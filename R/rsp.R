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
#   \item{postprocess}{If @TRUE, and a postprocessing method exists for
#      the generated document type, it is postprocessed as well.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns what the type-specific compiler returns.
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
setMethodS3("rsp", "default", function(filename=NULL, path=NULL, text=NULL, response=NULL, ..., envir=parent.frame(), postprocess=TRUE, verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local functions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  rVer <- as.character(getRversion());

  # For R v2.12.x and before
  if (compareVersion(rVer, "2.13.0") < 0) { 
    tempfile <- function(..., fileext="") {
      # Try 100 times (should really work the first though)
      for (kk in 1:100) {
        pathnameT <- base::tempfile(...);
        if (fileext != "") {
          pathnameT <- sprintf("%s%s", pathnameT, fileext);
          if (!file.exists(pathnameT)) {
            return(pathnameT);
          }
        }
      } # for (kk ...)
      stop("Failed to create a non-existing temporary pathname.");
    } # tempfile()
  }


  rspPlain <- function(pathname, response=NULL, ..., verbose=FALSE) {
    # Argument 'response':
    if (is.null(response)) {
      verbose && enter(verbose, "Creating FileRspResponse");
      pattern <- "((.*)[.]([^.]+))[.]([^.]+)$";
      pathname2 <- gsub(pattern, "\\1", pathname);
      pathname2 <- Arguments$getWritablePathname(pathname2);
      response <- FileRspResponse(file=pathname2, overwrite=TRUE);
      verbose && exit(verbose);
    }

    if (inherits(response, "connection")) {
      response <- FileRspResponse(file=response);
    } else if (is.character(response)) {
      pathname <- Arguments$getWritablePathname(response);
      response <- FileRspResponse(file=pathname);
    } else if (!inherits(response, "RspResponse")) {
      throw("Argument 'response' is not an RspResponse object: ", 
                                                         class(response)[1]);
    }

    # Argument 'verbose':
    verbose <- Arguments$getVerbose(verbose);
    if (verbose) {
      pushState(verbose);
      on.exit(popState(verbose));
    }

    verbose && enter(verbose, "Compiling RSP-embedded plain document");
    verbose && cat(verbose, "Input pathname: ", pathname);
    verbose && printf(verbose, "%s:\n", class(response)[1]);
    verbose && print(verbose, response);

    pathname2 <- getOutput(response);
    verbose && cat(verbose, "Response output class: ", class(pathname2)[1]);
    verbose && cat(verbose, "Response output pathname: ", pathname2);

    verbose && enter(verbose, "Calling sourceRspV2()");
    sourceRspV2(pathname, path=NULL, ..., response=response, envir=envir, verbose=less(verbose, 20));
    verbose && exit(verbose);

    verbose && exit(verbose);

    invisible(pathname2);
  } # rspPlain()



  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (!is.null(filename) && !is.null(text)) {
    throw("Only one of arguments 'filename' and 'text' can be specified.");
  }

  # Argument 'text':
  if (!is.null(text)) {
    pathnameT <- tempfile(fileext=".txt.rsp");
    on.exit(file.remove(pathnameT));
    writeLines(text=text, con=pathnameT);
    filename <- pathnameT;
    path <- NULL;
    if (is.null(response)) {
      response <- stdout();
    }
  }
  
  # Arguments 'filename' & 'path':
  pathname <- Arguments$getReadablePathname(filename, path=path, mustExist=TRUE);

  # Argument 'postprocess':
  postprocess <- Arguments$getLogical(postprocess);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "Compiling RSP document");

  verbose && cat(verbose, "RSP pathname: ", pathname);
  pattern <- "((.*)[.]([^.]+))[.]([^.]+)$";
  ext <- gsub(pattern, "\\3", pathname);
  type <- tolower(ext);
  verbose && cat(verbose, "RSP type: ", type);
  verbose && cat(verbose, "Postprocess (if recognized): ", postprocess);

  if (postprocess) {
    verbose && enter(verbose, "Searching for document-type specific postprocessor");

    # Find another RSP compiler
    postProcessors <- list(
      # RSP-embedded LaTeX documents:
      # *.tex => ... => *.dvi/*.pdf
      "tex" = compileLaTeX,
 
      # RSP-embedded Sweave documents:
      # *.Rnw => ... => *.tex => dvi/*.pdf
      "rnw" = compileSweave
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
  } # if (postprocess)


  # Default RSP compiler
  verbose && enter(verbose, "Preprocessing, translating, and evaluating RSP document");
  res <- rspPlain(pathname, response=response, ..., verbose=verbose);
  wasFileGenerated <- inherits(res, "character");
  if (wasFileGenerated) {
    pathname2 <- res;
    verbose && cat(verbose, "Output pathname: ", pathname2);
  }
  verbose && exit(verbose);

  # Postprocess file?
  if (!is.null(postProcessor)) {
    if (wasFileGenerated) {
      verbose && enter(verbose, "Postprocessing generated document");
      verbose && cat(verbose, "Input pathname: ", pathname2);
      pathname3 <- postProcessor(pathname2, ..., verbose=verbose);
      verbose && cat(verbose, "Output pathname: ", pathname3);
      verbose && exit(verbose);
      res <- pathname3;
    }
  }

  if (wasFileGenerated) {
    verbose && cat(verbose, "Output document pathname: ", res);
  } else {
    verbose && printf(verbose, "Output written to: %s [%d]\n", class(res)[1], res);
  }

  verbose && exit(verbose);

  invisible(res);
}) # rsp()


############################################################################
# HISTORY:
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
