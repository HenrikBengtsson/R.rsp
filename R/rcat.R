###########################################################################/**
# @RdocDefault rcat
# @alias rcat.RspString
# @alias rcat.RspDocument
# @alias rcat.RspRSourceCode
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
#   \item{output}{A @connection, or a pathname where to direct the output.
#               If \code{""}, the output is sent to the standard output.}
#   \item{append}{Only applied if \code{output} specifies a pathname;
#     If @TRUE, then the output is appended to the file, otherwise 
#     the files content is overwritten.}
#   \item{envir}{The @environment in which the RSP string is 
#     preprocessed and evaluated.}
#   \item{args}{A named @list of arguments assigned to the environment
#     in which the RSP string is parsed and evaluated.
#     See @see "R.utils::cmdArgs".}
# }
#
# \value{
#   Returns (invisibly) the outputted @see "RspStringProduct".
# }
#
# \section{Processing RSP strings from the command line}{
#   Using @see "Rscript" and \code{rcat()}, it is possible to process
#   an RSP string and output the result from the command line.  For example,
#
#   \code{Rscript -e "R.rsp::rcat('A random integer in [1,<\%=K\%>]: <\%=sample(1:K, size=1)\%>')" --args --K=50}
#
#   parses and evaluates the RSP string and outputs the result to 
#   standard output.
# }
#
# @examples "../incl/rcat.Rex"
#
# @author
#
# \seealso{
#  @see "rstring" and @see "rfile".
# }
#
# @keyword print
# @keyword IO
# @keyword file
#*/###########################################################################
setMethodS3("rcat", "default", function(..., output="", append=FALSE, envir=parent.frame(), args="*") {
  s <- rstring(..., envir=envir, args=args);
  cat(s, file=output, append=append);
  invisible(s);
}) # rcat()


setMethodS3("rcat", "RspString", function(..., output="", append=FALSE, envir=parent.frame(), args="*") {
  s <- rstring(..., envir=envir, args=args);
  cat(s, file=output, append=append);
  invisible(s);
}) # rcat()


setMethodS3("rcat", "RspDocument", function(..., output="", append=FALSE, envir=parent.frame(), args="*") {
  s <- rstring(..., envir=envir, args=args);
  cat(s, file=output, append=append);
  invisible(s);
}) # rcat()


setMethodS3("rcat", "RspRSourceCode", function(..., output="", append=FALSE, envir=parent.frame(), args="*") {
  s <- rstring(..., envir=envir, args=args);
  cat(s, file=output, append=append);
  invisible(s);
}) # rcat()


##############################################################################
# HISTORY:
# 2013-02-20
# o Renamed argument 'file' for rcat() to 'output', cf. rfile().  This
#   automatically makes argument 'file' & 'path' work also for rcat()
#   just as it works for rstring() and rfile().
# 2013-02-13
# o Added rcat() for several RSP-related classes.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
