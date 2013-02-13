###########################################################################/**
# @RdocDefault rfile
#
# @title "Evaluates an RSP file and outputs the generated string"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{pathname}{The pathname of the RSP file to be processed.}
#   \item{output}{A @character string or a @connection specifying where
#      output should be directed.
#      The default is a file with a pathname where the file extension
#      (typically \code{".rsp"}) has been dropped from \code{pathname}.}
#   \item{envir}{The @environment in which the RSP document is evaluated.}
#   \item{...}{Additional arguments passed to the RSP engine.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   If argument \code{output} is a pathname, its absolute pathname is returned.
#   If a @connection, the connection is returned.
# }
#
# @author
#
# @keyword file
# @keyword IO
#*/########################################################################### 
setMethodS3("rfile", "default", function(pathname, output=NULL, envir=parent.frame(), ..., verbose=FALSE) {
  # Load the package (super quietly), in case R.rsp::rfile() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'pathname':
  pathname <- Arguments$getReadablePathname(pathname);
  pathname <- getAbsolutePath(pathname);

  # Argument 'output':
  if (is.null(output)) {
    pattern <- "((.*)[.]([^.]+))[.]([^.]+)$";
    outputF <- gsub(pattern, "\\1", basename(pathname));
    output <- Arguments$getWritablePathname(outputF);
    output <- getAbsolutePath(output);
    if (output == pathname) {
      throw("Cannot process RSP file. The inferred argument 'output' is the same as argument 'pathname': ", output, " == ", pathname);
    }
  } else if (inherits(output, "connection")) {
  } else if (is.character(output)) {
    output <- Arguments$getWritablePathname(output);
    output <- getAbsolutePath(output);
    if (output == pathname) {
      throw("Cannot process RSP file. Argument 'output' specifies the same file as argument 'pathname': ", output, " == ", pathname);
    }
  } else {
    throw("Argument 'output' of unknown type: ", class(output)[1L]);
  }


  # Argument 'envir':
#  envir <- Arguments$getEnvironment(envir);


  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "Processing RSP file");

  if (verbose) {
    cat(verbose, "Pathname: ", pathname);
    if (is.character(output)) {
      cat(verbose, "Output pathname: ", output);
    } else if (inherits(output, "connection")) {
      ci <- summary(output);
      printf(verbose, "Output '%s' connection: %s\n", 
          class(ci)[1L], ci$description);
    }
  }

  verbose && enter(verbose, "Loading RSP document");
  str <- readLines(pathname);
  str <- paste(str, collapse="\n");
  verbose && str(verbose, str);
  verbose && printf(verbose, "Number of characters: %d\n", nchar(str));
  verbose && exit(verbose);

  verbose && enter(verbose, "Evaluating RSP document");
  rcat(str, file=output, envir=envir, ...);
  verbose && exit(verbose);

  verbose && exit(verbose);

  output;
}, protected=TRUE) # rfile()



############################################################################
# HISTORY:
# 2013-02-12
# o Added some protection against overwriting the input file.
# o Renamed rspPlain() to rfile(), cf. rstring() and rcat().
# o rspPlain() is now utilizing the new RSP engine, e.g. rcat().
# o CLEANUP: Removed all dependencies on RspResponse, FileRspResponse etc.
# 2013-02-08
# o Extracted rspPlain() from rsp().
# o Created.
############################################################################
