###########################################################################/**
# @RdocDefault rcompile
# @alias rcompile.RspString
# @alias rcompile.RspDocument
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
#   \item{...}{@character strings with RSP markup.}
#   \item{file, path}{Alternatively, a file, a URL or a @connection from
#      with the strings are read.
#      If a file, the \code{path} is prepended to the file, iff given.}
#   \item{envir}{The @environment in which the RSP string is
#      preprocessed and evaluated.}
#   \item{args}{A named @list of arguments assigned to the environment
#     in which the RSP string is parsed and evaluated.
#     See @see "R.utils::cmdArgs".}
#   \item{until}{Specifies how far the compilation should proceed.}
#   \item{as}{Specifies the format of the returned compilation.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns an @see "RspDocument" or @see "RspString"
#   (depending on argument \code{as}).
# }
#
# @author
#
# \seealso{
#  @see "rcat" and @see "rfile".
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/###########################################################################
setMethodS3("rcompile", "default", function(..., file=NULL, path=NULL, envir=parent.frame(), args="*", until="*", as=c("RspString", "RspDocument"), verbose=FALSE) {
  # Load the package (super quietly), in case R.rsp::nnn() was called.
  suppressPackageStartupMessages(require("R.utils", quietly=TRUE)) || throw("Package not loaded: R.utils");

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
      file <- Arguments$getReadablePathname(file, absolute=TRUE);
    }
  }

  # Argument 'until':
##  until <- match.arg(until);

  # Argument 'as':
  as <- match.arg(as);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "rcompile() for default");
  verbose && cat(verbose, "Compile until: ", sQuote(until));
  verbose && cat(verbose, "Return as: ", sQuote(as));

  if (is.null(file)) {
    s <- RspString(...);
  } else {
    verbose && cat(verbose, "Input file: ", file);
    s <- .readText(file);
    s <- RspString(s, source=file);
  }
  verbose && cat(verbose, "Length of RSP string: ", nchar(s));

  res <- rcompile(s, envir=envir, args=args, until=until, as=as, verbose=verbose);

  verbose && exit(verbose);

  res;
}) # rcompile()


setMethodS3("rcompile", "RspString", function(object, envir=parent.frame(), args="*", ..., until="*", as=c("RspString", "RspDocument"), verbose=FALSE) {
  # Load the package (super quietly), in case R.rsp::nnn() was called.
  suppressPackageStartupMessages(require("R.utils", quietly=TRUE)) || throw("Package not loaded: R.utils");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'args':
  args <- cmdArgs(args=args);

  # Argument 'until':
##  until <- match.arg(until);

  # Argument 'as':
  as <- match.arg(as);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "rcompile() for ", class(object)[1L]);
  verbose && cat(verbose, "Compile until: ", sQuote(until));
  verbose && cat(verbose, "Return as: ", sQuote(as));

  if (length(args) > 0L) {
    verbose && enter(verbose, "Assigning RSP arguments to processing environment");
    verbose && cat(verbose, "Environment: ", getName(envir));

    verbose && cat(verbose, "RSP arguments:");
    verbose && str(verbose, args);

    # Assign arguments to the parse/evaluation environment
    names <- attachLocally(args, envir=envir);
    if (length(names) > 0L) {
      verbose && printf(verbose, "Variables assigned: [%d] %s\n", length(names), hpaste(names));
      member <- NULL; rm(list="member"); # To please R CMD check
      ll <- subset(ll(envir=envir), member %in% names);
      verbose && print(verbose, ll);
    }
    verbose && exit(verbose);
  } else {
    names <- NULL;
  }

  verbose && enter(verbose, "Parsing RSP string");
  verbose && cat(verbose, "Parse environment: ", getName(envir));
  if (length(names) > 0L) {
    ll <- subset(ll(envir=envir), member %in% names);
    verbose && print(verbose, ll);
  }
  res <- parse(object, envir=envir, ..., until=until, as=as, verbose=verbose);
  verbose && print(verbose, res);
  verbose && exit(verbose);


  verbose && exit(verbose);

  res;
}) # rcompile()



setMethodS3("rcompile", "RspDocument", function(object, envir=parent.frame(), ..., verbose=FALSE) {
  # Load the package (super quietly), in case R.rsp::nnn() was called.
  suppressPackageStartupMessages(require("R.utils", quietly=TRUE)) || throw("Package not loaded: R.utils");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "rcompile() for ", class(object)[1L]);

  verbose && enter(verbose, "Coercing RSP document to RSP string");
  s <- asRspString(object);
  verbose && exit(verbose);

  res <- rcompile(s, ..., envir=envir, verbose=verbose);

  verbose && exit(verbose);

  res;
}) # rcompile()



##############################################################################
# HISTORY:
# 2013-03-10
# o Added rcompile().
# 2013-02-23
# o Now rstring() captures standard output such that all user output to
#   stdout will be part of the output document in the order they occur.
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
