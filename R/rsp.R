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
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns what the type-specific compiler returns.
# }
#
# @author
#
# \seealso{
#   Internally, 
#     @see "rsptex" is used for *.tex.rsp documents,
#     @see "rspToHtml" is used for *.html.rsp documents.
# }
#
# @keyword file
# @keyword IO
#*/########################################################################### 
setMethodS3("rsp", "default", function(filename=NULL, path=NULL, text=NULL, response=NULL, ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local functions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  rspPlain <- function(filename, response=NULL, ...) {
    if (is.null(response)) {
      pattern <- "((.*)[.]([^.]+))[.]([^.]+)$";
      filenameOut <- gsub(pattern, "\\1", filename);
      filenameOut <- Arguments$getWritablePathname(filenameOut);
      response <- FileRspResponse(file=filenameOut, overwrite=TRUE);
    }
    sourceRspV2(filename, ..., response=response);
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

  # Select RSP compiler
  rspCompiler <- switch(type, 
    # RSP-embedded LaTeX documents; *.tex.rsp => ... => *.dvi/*.pdf
    "tex" = function(filename, path=NULL, ..., verbose=FALSE) {
      rsptex(filename=filename, path=path, ..., verbose=verbose);
    },

    # Default compiler
    rspPlain
  );

  res <- rspCompiler(filename=filename, path=path, response=response, ..., verbose=verbose);

  verbose && exit(verbose);

  invisible(res);
}) # rsp()


############################################################################
# HISTORY:
# 2011-04-12
# o Added rsp().
# o Created.
############################################################################
