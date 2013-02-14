###########################################################################/**
# @RdocDefault rsp
#
# @title "Compiles an RSP document"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{filename, path}{The filename and (optional) path of the 
#      RSP document to be compiled.}
#   \item{text}{A @character @vector of RSP code to be processed, 
#      iff argument \code{filename} is not given.}
#   \item{response}{Specifies where the final output should be sent.
#      If argument \code{text} is given, then @see "base::stdout" is used.
#      Otherwise, the output defaults to that of the type-specific compiler.}
#   \item{...}{Additional arguments passed to the type-specific compiler.}
#   \item{envir}{The @environment in which the RSP document is evaluated.}
#   \item{outPath}{The output and working directory.}
#   \item{postprocess}{If @TRUE, and a postprocessing method exists for
#      the generated document type, it is postprocessed as well.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   If argument \code{response} specifies a file output, then the
#   absolute pathname of the generated file is returned.
#   If argument \code{text} is specified, then the generated string
#   is returned (invisibly).
# }
#
# @examples "../incl/rsp.Rex"
#
# @author
#
# \section{Postprocessing}{
#   For some document types, the \code{rsp()} method automatically
#   postprocesses the generated document as well.
# }
#
# @keyword file
# @keyword IO
#*/########################################################################### 
setMethodS3("rsp", "default", function(filename=NULL, path=NULL, text=NULL, response=NULL, ..., envir=parent.frame(), outPath=".", postprocess=TRUE, verbose=FALSE) {
  # Load the package (super quietly), in case R.rsp::rsp() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local functions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  findPostprocessor <- function(type, verbose=FALSE, ...) {
    verbose && enter(verbose, "Searching for document-type specific postprocessor");
    # Find another RSP compiler
    postProcessors <- list(
      # RSP-embedded LaTeX documents:
      # *.tex => ... => *.dvi/*.pdf
      "tex" = compileLaTeX,
 
      # RSP-embedded Sweave and Knitr Rnw documents:
      # *.Rnw => ... => *.tex => dvi/*.pdf
      "rnw" = compileRnw
    );

    postProcessor <- NULL;
    for (key in names(postProcessors)) {
      pattern <- key;
      if (regexpr(pattern, type) != -1) {
        postProcessor <- postProcessors[[key]];
        verbose && cat(verbose, "Match: ", key);
        break;
      }
    } # for (key ...)

    if (is.null(postProcessor)) {
      verbose && cat(verbose, "Postprocessor found: <none>");
    } else {
      verbose && cat(verbose, "Postprocessor found: ", type);
    }

    verbose && exit(verbose);

    postProcessor;
  } # findPostprocessor()


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (!is.null(filename) && !is.null(text)) {
    throw("Only one of arguments 'filename' and 'text' can be specified.");
  }

  # Argument 'text':
  if (!is.null(text)) {
    text <- Arguments$getCharacter(text);
  }
  
  # Arguments 'filename' & 'path':
  if (!is.null(filename)) {
    pathname <- Arguments$getReadablePathname(filename, path=path, mustExist=TRUE);
    pathname <- getAbsolutePath(pathname);
  } else {
    pathname <- NULL;
  }

  if (is.null(text) && is.null(pathname)) {
    throw("Either argument 'filename' or 'text' must be given.");
  }

  # Arguments 'outPath':
  if (is.null(outPath)) {
    outPath <- ".";
  } else {
    outPath <- Arguments$getWritablePath(outPath);
    if (is.null(outPath)) outPath <- getwd();
  }
  outPath <- getAbsolutePath(outPath);

  # Argument 'envir':
#  envir <- Arguments$getEnvironment(envir);

  # Argument 'postprocess':
  postprocess <- Arguments$getLogical(postprocess);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }



  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Compile an RSP string
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (!is.null(text)) {
    verbose && enter(verbose, "Parsing and evaluating RSP string");

    if (is.null(response)) {
      response <- stdout();
    }

    # Change working directory?
    opwd <- getwd();
    on.exit({ if (!is.null(opwd)) setwd(opwd) }, add=TRUE);
    setwd(outPath);

    res <- rcat(text, file=response, envir=envir, ...);

    # Reset working directory
    if (!is.null(opwd)) {
      setwd(opwd);
      opwd <- NULL;
    }

    verbose && exit(verbose);
    return(invisible(res));
  } # if (!is.null(text))



  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Compile an RSP file
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  verbose && enter(verbose, "Parsing and evaluating RSP file");
  if (is.character(response)) {
    response <- getAbsolutePath(response);
  }

  verbose && cat(verbose, "RSP pathname (absolute): ", pathname);
  verbose && cat(verbose, "Output and working directory: ", outPath);

  pattern <- "((.*)[.]([^.]+))[.]([^.]+)$";
  ext <- gsub(pattern, "\\3", pathname);
  type <- tolower(ext);
  verbose && cat(verbose, "RSP type: ", type);
  verbose && cat(verbose, "Postprocess (if recognized): ", postprocess);
  if (postprocess) {
    postProcessor <- findPostprocessor(type, verbose=verbose);
  } # if (postprocess)


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Process RSP file
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  verbose && enter(verbose, "Preprocessing, translating, and evaluating RSP document");
  verbose && cat(verbose, "Current directory: ", getwd());
  res <- rfile(pathname, output=response, workdir=outPath, envir=envir, ..., verbose=verbose);

  if (isFile(res)) {
    verbose && cat(verbose, "Output pathname: ", res);
    verbose && printf(verbose, "Output file size: %g bytes\n", file.info(res)$size);
  } else {
    verbose && printf(verbose, "Output written to: %s [%d]\n", class(res)[1L], res);
  }
  verbose && exit(verbose);


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Postprocess RSP artifact?
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (!is.null(postProcessor)) {
    if (isFile(res)) {
      verbose && enter(verbose, "Postprocessing generated document");
      verbose && cat(verbose, "Input pathname: ", res);

      # Change working directory?
      opwd <- getwd();
      on.exit({ if (!is.null(opwd)) setwd(opwd) }, add=TRUE);
      setwd(outPath);

      pathname3 <- postProcessor(res, ..., verbose=verbose);
      verbose && cat(verbose, "Output pathname: ", pathname3);
      res <- getAbsolutePath(pathname3);
      verbose && cat(verbose, "Output pathname (absolute): ", res);
      verbose && printf(verbose, "Output file size: %g bytes\n", file.info(res)$size);

      # Reset working directory
      if (!is.null(opwd)) {
        setwd(opwd);
        opwd <- NULL;
      }

      verbose && exit(verbose);
    }
  } # if (!is.null(postProcessor))

  verbose && exit(verbose);

  invisible(res);
}) # rsp()


############################################################################
# HISTORY:
# 2013-02-13
# o CLEANUP: Removed obsolete local tempfile() function.
# 2013-02-12
# o Now rsp(text=...) uses rcat() and rsp(file=...) uses rfile().
# 2013-02-08
# o Made internal rspPlain() its own function.
# 2011-11-14
# o Added argument 'envir' to rsp(..., envir=parent.frame()).
# 2011-04-16
# o BUG FIX: On R v2.12.x, rsp(text="...") would throw 'Error ...: unused
#   argument(s) (fileext = ".txt.rsp")'.  Solved by providing a patched
#   tempfile() with this feature for R v2.12.x.  Thanks Uwe Ligges for
#   spotting this.
# 2011-04-12
# o Added rsp().
# o Created.
############################################################################
