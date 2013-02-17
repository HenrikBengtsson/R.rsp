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
#     in which the RSP string is parsed and evaluated. See @see "rargs".}
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
setMethodS3("rstring", "default", function(..., file=NULL, path=NULL, envir=parent.frame(), args="*") {
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


  if (is.null(file)) {
    s <- RspString(...);
  } else {
    s <- readLines(file);
    s <- RspString(s, source=file);
  }

  rstring(s, envir=envir, args=args);
}) # rstring()


setMethodS3("rstring", "RspString", function(object, envir=parent.frame(), args="*", ...) {
  # Argument 'args':
  args <- rargs(args);

  # Assign arguments to the parse/evaluation environment
  attachLocally(args, envir=envir);

  expr <- parse(object, envir=envir, ...);
  rstring(expr, envir=envir, args=NULL, ...);
}) # rstring()


setMethodS3("rstring", "RspDocument", function(object, envir=parent.frame(), ...) {
  factory <- RspRSourceCodeFactory();
  code <- toSourceCode(factory, object);
  rstring(code, ..., envir=envir);
}) # rstring()


setMethodS3("rstring", "RspRSourceCode", function(object, envir=parent.frame(), ...) {
  process(object, envir=envir, ...);
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
