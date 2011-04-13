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
#   \item{postprocess}{If @TRUE, and a postprocessing method exists for
#      the generated document type, it is postprocessed as well.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns what the type-specific compiler returns.
# }
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
setMethodS3("rsp", "default", function(filename=NULL, path=NULL, text=NULL, response=NULL, ..., postprocess=TRUE, verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local functions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  rspPlain <- function(pathname, response=NULL, ..., verbose=FALSE) {
    # Argument 'verbose':
    verbose <- Arguments$getVerbose(verbose);
    if (verbose) {
      pushState(verbose);
      on.exit(popState(verbose));
    }

    verbose && enter(verbose, "Compiling RSP-embedded plain document");

    verbose && cat(verbose, "Input pathname: ", pathname);
    if (is.null(response)) {
      pattern <- "((.*)[.]([^.]+))[.]([^.]+)$";
      pathname2 <- gsub(pattern, "\\1", pathname);
      pathname2 <- Arguments$getWritablePathname(pathname2);
      response <- FileRspResponse(file=pathname2, overwrite=TRUE);
    }
    pathname2 <- getOutput(response);
    verbose && cat(verbose, "Output pathname: ", pathname2);

    verbose && enter(verbose, "Calling sourceRspV2()");
    sourceRspV2(pathname, path=NULL, ..., response=response, verbose=less(verbose, 20));
    verbose && exit(verbose);

    verbose && exit(verbose);

    invisible(pathname2);
  } # rspPlain()


  rspLaTeX <- function(pathname, ..., verbose=FALSE) {
    # Argument 'verbose':
    verbose <- Arguments$getVerbose(verbose);
    if (verbose) {
      pushState(verbose);
      on.exit(popState(verbose));
    }

    verbose && enter(verbose, "Compiling RSP-embedded LaTeX document");
    verbose && cat(verbose, "Input pathname: ", pathname);

    pathname2 <- rspPlain(pathname, ..., verbose=verbose);
    verbose && cat(verbose, "LaTeX pathname: ", pathname2);

    pathname3 <- compileLaTeX(pathname2);
    verbose && cat(verbose, "Output pathname: ", pathname3);

    verbose && exit(verbose);

    invisible(pathname3);
  } # rspLaTeX()


  rspSweave <- function(pathname, ..., verbose=FALSE) {
    # Argument 'verbose':
    verbose <- Arguments$getVerbose(verbose);
    if (verbose) {
      pushState(verbose);
      on.exit(popState(verbose));
    }

    verbose && enter(verbose, "Compiling RSP-embedded Sweave document");
    verbose && cat(verbose, "Input pathname: ", pathname);

    pathname2 <- rspPlain(pathname, ..., verbose=verbose);
    verbose && cat(verbose, "Sweave pathname: ", pathname2);

    pathname3 <- Sweave(pathname);
    verbose && cat(verbose, "LaTeX pathname: ", pathname3);

    pathname4 <- compileLaTeX(pathname3);
    verbose && cat(verbose, "Output pathname: ", pathname4);

    verbose && exit(verbose);

    invisible(pathname4);
  } # rspSweave()




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
  pathname2 <- rspPlain(pathname, response=response, ..., verbose=verbose);
  verbose && exit(verbose);


  pathnameR <- pathname2;
  if (!is.null(postProcessor)) {
    verbose && enter(verbose, "Postprocessing generated document");
    verbose && cat(verbose, "Input pathname: ", pathname2);
    pathname3 <- postProcessor(pathname2, ..., verbose=verbose);
    verbose && cat(verbose, "Output pathname: ", pathname3);
    verbose && exit(verbose);

    pathnameR <- pathname3;
  }

  verbose && cat(verbose, "Output document pathname: ", pathnameR);

  verbose && exit(verbose);

  invisible(pathnameR);
}) # rsp()


############################################################################
# HISTORY:
# 2011-04-12
# o Added rsp().
# o Created.
############################################################################
