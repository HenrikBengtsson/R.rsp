###########################################################################/**
# @RdocDefault rspPlain
#
# @title "Compiles a plain RSP document"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{pathname}{The pathname of the RSP document to be compiled.}
#   \item{response}{Specifies where the final output should be sent.
#      If argument \code{text} is given, then @see "base::stdout" is used.
#      Otherwise, the output defaults to that of the type-specific compiler.}
#   \item{envir}{The @environment in which the RSP document is evaluated.}
#   \item{...}{Additional arguments passed to the RSP compiler.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns the pathname of the file generated.
# }
#
# @author
#
# @keyword file
# @keyword IO
#*/########################################################################### 
setMethodS3("rspPlain", "default", function(pathname, response=NULL, envir=parent.frame(), ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'response':
  if (is.null(response)) {
    verbose && enter(verbose, "Creating FileRspResponse");
    pattern <- "((.*)[.]([^.]+))[.]([^.]+)$";
    filename2 <- gsub(pattern, "\\1", basename(pathname));
    outPath <- ".";
    pathname2 <- Arguments$getWritablePathname(filename2, path=outPath);
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


  # Argument 'envir':
#  envir <- Arguments$getEnvironment(envir);


  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "Compiling RSP-embedded plain document");
  verbose && cat(verbose, "Input pathname: ", getAbsolutePath(pathname));
  verbose && printf(verbose, "%s:\n", class(response)[1]);
  verbose && print(verbose, response);

  pathname2 <- getOutput(response);
  verbose && cat(verbose, "Response output class: ", class(pathname2)[1]);
  verbose && cat(verbose, "Response output pathname: ", getAbsolutePath(pathname2));

  verbose && enter(verbose, "Calling sourceRspV2()");
  sourceRspV2(pathname, path=NULL, ..., response=response, envir=envir, verbose=less(verbose, 20));
  verbose && exit(verbose);

  verbose && exit(verbose);

  invisible(pathname2);
}, protected=TRUE) # rspPlain()



############################################################################
# HISTORY:
# 2013-02-08
# o Extracted rspPlain() from rsp().
# o Created.
############################################################################
