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
  # Argument 'pathname':
  pathname <- Arguments$getReadablePathname(pathname);
  pathname <- getAbsolutePath(pathname);

  # Argument 'response':
  if (is.null(response)) {
    pattern <- "((.*)[.]([^.]+))[.]([^.]+)$";
    response <- gsub(pattern, "\\1", basename(pathname));
  }
  if (inherits(response, "connection")) {
  } else if (is.character(response)) {
    response <- Arguments$getWritablePathname(response);
    response <- getAbsolutePath(response);
  } else {
    throw("Argument 'response' of unknown type: ", class(response)[1L]);
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
  verbose && cat(verbose, "Input pathname: ", pathname);
  if (inherits(response, "connection")) {
    verbose && printf(verbose, "Output %s:\n", class(response)[1L]);
    verbose && print(verbose, response);
  } else {
    verbose && printf(verbose, "Output pathname: %s\n", response);
  }

  verbose && enter(verbose, "Loading RSP document");
  str <- readLines(pathname);
  str <- paste(str, collapse="\n");
  verbose && str(verbose, str);
  verbose && printf(verbose, "Number of characters: %d\n", nchar(str));
  verbose && exit(verbose);

##  verbose && enter(verbose, "Parsing RSP document");
##  rstr <- RspString(str);
##  rexpr <- parse(rstr, envir=envir, ...);
##  verbose && printf(verbose, "Number of RSP expressions: %d\n", length(rexpr));
##  verbose && str(verbose, head(rexpr));
##  verbose && str(verbose, tail(rexpr));
##  verbose && exit(verbose);
##
##  verbose && enter(verbose, "Translating RSP document (to R)");
###  rcode <- toR(rexpr, ...);
###  verbose && printf(verbose, "Number of R source code lines: %d\n", length(rcode));
##  verbose && exit(verbose);

  verbose && enter(verbose, "Evaluating RSP document");
##  res <- evaluate(rcode, envir=envir, ...);
  rcat(str, file=response, envir=envir, ...);
  verbose && exit(verbose);

  verbose && exit(verbose);

  invisible(response);
}, protected=TRUE) # rspPlain()



############################################################################
# HISTORY:
# 2013-02-08
# o Extracted rspPlain() from rsp().
# o Created.
############################################################################
