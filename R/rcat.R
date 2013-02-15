###########################################################################/**
# @RdocDefault rcat
# @alias rcat.RspString
# @alias rcat.RspDocument
# @alias rcat.RSourceCode
#
# @title "Evaluates an RSP string and outputs the generated string"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{@character strings with RSP markup.}
#   \item{file}{A @connection, or a pathname where to direct the output.
#               If \code{""}, the output is sent to the standard output.}
#   \item{append}{Only applied if \code{file} specifies a pathname;
#     If @TRUE, then the output is appended to the file, otherwise 
#     the files content is overwritten.}
#   \item{envir}{The @environment in which the RSP string is 
#     preprocessed and evaluated.}
# }
#
# \value{
#   Returns (invisibly) the outputted @character string.
# }
#
# @examples "../incl/rcat.Rex"
#
# @author
#
# \seealso{
#  @see "rstring".
# }
#*/###########################################################################
setMethodS3("rcat", "default", function(..., file="", append=FALSE, envir=parent.frame()) {
  s <- rstring(..., envir=envir);
  cat(s, file=file, append=append);
  invisible(s);
}) # rcat()


setMethodS3("rcat", "RspString", function(..., file="", append=FALSE, envir=parent.frame()) {
  s <- rstring(..., envir=envir);
  cat(s, file=file, append=append);
  invisible(s);
}) # rcat()


setMethodS3("rcat", "RspDocument", function(..., file="", append=FALSE, envir=parent.frame()) {
  s <- rstring(..., envir=envir);
  cat(s, file=file, append=append);
  invisible(s);
}) # rcat()


setMethodS3("rcat", "RSourceCode", function(..., file="", append=FALSE, envir=parent.frame()) {
  s <- rstring(..., envir=envir);
  cat(s, file=file, append=append);
  invisible(s);
}) # rcat()


##############################################################################
# HISTORY:
# 2013-02-13
# o Added rcat() for several RSP-related classes.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
