###########################################################################/**
# @RdocDefault rstring
# @alias rstring.RspString
# @alias rstring.RspDocument
# @alias rstring.RSourceCode
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
#   \item{file}{Alternatively, a file, a URL or a @connection from with 
#      the strings are read.}
#   \item{envir}{The @environment in which the RSP string is evaluated.}
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
#  @see "rcat".
# }
#*/###########################################################################
setMethodS3("rstring", "default", function(..., file=NULL, envir=parent.frame()) {
  if (is.null(file)) {
    s <- RspString(...);
  } else {
    s <- readLines(file);
    s <- RspString(s);
  }
  rstring(s, envir=envir);
}) # rstring()

setMethodS3("rstring", "RspString", function(object, ...) {
  expr <- parse(object);
  rstring(expr, ...);
}) # rstring()

setMethodS3("rstring", "RspDocument", function(object, envir=parent.frame(), ...) {
  factory <- RspRSourceCodeFactory();
  rCode <- toSourceCode(factory, object, envir=envir);
  rstring(rCode, ..., envir=envir);
}) # rstring()

setMethodS3("rstring", "RSourceCode", function(object, envir=parent.frame(), ...) {
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
  expr <- base::parse(text=rCode);
  rspRes <- NULL; rm(rspRes); # To please R CMD check
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
# 2013-02-13
# o Added argument 'file' to rstring().
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
