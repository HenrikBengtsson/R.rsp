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
#   Returns a @character string.
#   If set/known, the content type is returned as attribute \code{type}.
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
  rCode <- toSourceCode(factory, object);
  rstring(rCode, ..., envir=envir);
}) # rstring()


setMethodS3("rstring", "RspRSourceCode", function(object, envir=parent.frame(), args="*", ...) {
  # Argument 'args':
  args <- rargs(args);

  # Assign arguments to the parse/evaluation environment
  attachLocally(args, envir=envir);


  # Build R source code
  header <- '
rspCon <- textConnection(NULL, open="w", local=TRUE);
on.exit({ if (exists("rspCon")) close(rspCon) });

.ro <- function(..., collapse="", sep="") {
  msg <- paste(..., collapse=collapse, sep=sep);
  cat(msg, sep="", file=rspCon);
} # .ro()

';

  footer <- '
.ro("\n"); # Force a last complete line
rm(".ro");
rspRes <- paste(textConnectionValue(rspCon), collapse="\n");
close(rspCon);
rm("rspCon");
';

  rCode <- c(header, object, footer);
  rCode <- paste(rCode, collapse="\n");
##  rCode <- sprintf("local({%s})", rCode);


  # Parse R source code
  expr <- base::parse(text=rCode);
  rspRes <- NULL; rm(rspRes); # To please R CMD check


  # Evaluate R source code
  eval(expr, envir=envir, ...);
  res <- get("rspRes", envir=envir);
  rm("rspRes", envir=envir);


  # Set the content type?
  type <- getType(object);
  if (!is.na(type)) {
    attr(res, "type") <- type;
  }

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
