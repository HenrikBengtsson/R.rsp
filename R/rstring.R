###########################################################################/**
# @RdocDefault rstring
# @alias rstring.RspString
# @alias rstring.RspDocument
# @alias rstring.RspRSourceCode
#
# @title "Evaluates an RSP string and returns the generated string"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{@character strings with RSP markup.}
#   \item{file, path}{Alternatively, a file, a URL or a @connection from 
#      with the strings are read.
#      If a file, the \code{path} is prepended to the file, iff given.}
#   \item{envir}{The @environment in which the RSP string is 
#      preprocessed and evaluated.}
#   \item{args}{A named @list of arguments assigned to the environment
#     in which the RSP string is parsed and evaluated.
#     See @see "R.utils::cmdArgs".}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns an @see "RspStringProduct".
# }
#
# @examples "../incl/rstring.Rex"
#
# @author
#
# \seealso{
#  @see "rcat" and @see "rfile".
# }
#*/###########################################################################
setMethodS3("rstring", "default", function(..., file=NULL, path=NULL, envir=parent.frame(), args="*", verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'file' & 'path':
  if (inherits(file, "connection")) {
  } else if (is.character(file)) {
    if (!is.null(path)) {
      file <- file.path(path, file);
    }
    if (!isUrl(file)) {
      # Load the package (super quietly), in case R.rsp::nnn() was called.
      suppressPackageStartupMessages(require("R.utils", quietly=TRUE)) || throw("Package not loaded: R.utils");
      file <- Arguments$getReadablePathname(file, absolute=TRUE);
    }
  }

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "rstring() for default");

  if (is.null(file)) {
    s <- RspString(...);
  } else {
    verbose && cat(verbose, "Input file: ", file);
    s <- readLines(file, warn=FALSE);
    s <- RspString(s, source=file);
  }
  verbose && cat(verbose, "Length of RSP string: ", nchar(s));

  res <- rstring(s, envir=envir, args=args, verbose=verbose);

  verbose && exit(verbose);

  res;
}) # rstring()


setMethodS3("rstring", "RspString", function(object, envir=parent.frame(), args="*", ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'args':
  args <- cmdArgs(args);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "rstring() for ", class(object)[1L]);

  if (length(args) > 0L) {
    verbose && enter(verbose, "Assigning RSP arguments to processing environment");
    verbose && cat(verbose, "Environment: ", getName(envir));

    verbose && cat(verbose, "RSP arguments:");
    verbose && str(verbose, args);

    # Assign arguments to the parse/evaluation environment
    names <- attachLocally(args, envir=envir);
    if (length(names) > 0L) {
      verbose && printf(verbose, "Variables assigned: [%d] %s\n", length(names), hpaste(names));
      member <- NULL; rm("member"); # To please R CMD check
      ll <- subset(ll(envir=envir), member %in% names);
      verbose && print(verbose, ll);
    }
    verbose && exit(verbose);
  } else {
    names <- NULL;
  }

  verbose && enter(verbose, "Parse RSP string to RSP document");
  verbose && cat(verbose, "Parse environment: ", getName(envir));
  if (length(names) > 0L) {
    ll <- subset(ll(envir=envir), member %in% names);
    verbose && print(verbose, ll);
  }
  expr <- parse(object, envir=envir, ..., verbose=verbose);
  verbose && print(verbose, expr);
  verbose && exit(verbose);

  res <- rstring(expr, envir=envir, args=NULL, ..., verbose=verbose);

  verbose && exit(verbose);

  res;
}) # rstring()


setMethodS3("rstring", "RspDocument", function(object, envir=parent.frame(), ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "rstring() for ", class(object)[1L]);

  verbose && enter(verbose, "Coerce RSP document to RSP source code");
  factory <- RspRSourceCodeFactory();
  verbose && cat(verbose, "Language: ", getLanguage(factory));
  code <- toSourceCode(factory, object, verbose=verbose);
  verbose && cat(verbose, "Generated source code:");
  verbose && cat(verbose, head(code, n=3L));
  verbose && cat(verbose);
  verbose && cat(verbose, "[...]");
  verbose && cat(verbose);
  verbose && cat(verbose, tail(code, n=3L));
  verbose && exit(verbose);

  res <- rstring(code, ..., envir=envir, verbose=verbose);

  verbose && exit(verbose);

  res;
}) # rstring()


setMethodS3("rstring", "RspRSourceCode", function(object, envir=parent.frame(), ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "rstring() for ", class(object)[1L]);
  verbose && cat(verbose, "Environment: ", getName(envir));

  res <- process(object, envir=envir, ..., verbose=less(verbose,10));

  verbose && exit(verbose);

  res;
}) # rstring()




##############################################################################
# HISTORY:
# 2013-02-16
# o Now rstring() only takes a character vector; it no longer c(...) the
#   '...' arguments.
# o Added argument 'args' to rstring() for RspString and RspRSourceCode.
# o Added argument 'envir' to rstring() for RspString.
# 2013-02-13
# o Added argument 'file' to rstring().
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
