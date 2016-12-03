###########################################################################/**
# @RdocDefault translateRsp
#
# @title "Translates an RSP file to an R RSP source file"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{filename}{A filename to be read.}
#   \item{path}{An optional path to the file.}
#   \item{...}{Not used.}
#   \item{force}{A @logical.}
#   \item{verbose}{@see "R.utils::Verbose".}
# }
#
# \value{
#   Returns (invisibly) the pathname to the R RSP source code.
# }
#
# @author
#
# \seealso{
#   Internally @see "parseRsp" parses the RSP file into an R code string.
#   @see "sourceRsp".
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/###########################################################################
setMethodS3("translateRsp", "default", function(filename, path=NULL, ..., force=FALSE, verbose=FALSE) {
  .Defunct(new="rcode()")
}, deprecated=TRUE) # translateRsp()


###########################################################################
# HISTORY:
# 2014-10-18
# o CLEANUP/ROBUSTNESS: translateRsp() and translateRspV1(), which are
#   both deprecated, no longer assume that write() is exported from R.rsp.
# 2011-11-17
# o Now the generated R script adds 'write <- R.rsp::write' at the
#   beginning, to assure that it is used instead of base::write().
# 2009-02-23
# o Renamed from compileRsp() to translateRsp().
# o Updated to use parseRsp().
# 2009-02-22
# o Created.
###########################################################################
