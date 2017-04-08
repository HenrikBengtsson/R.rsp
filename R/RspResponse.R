###########################################################################/**
# @RdocClass RspResponse
#
# @title "The RspResponse class"
#
# \description{
#  @classhierarchy
#
#  An abstract class that provides basic methods to write and flush output to
#  the generated document.
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
#
# @author
# @keyword internal
#*/###########################################################################
setConstructorS3("RspResponse", function(...) {
  extend(Object(), "RspResponse",
    ...
  )
})




#########################################################################/**
# @RdocMethod write
# @alias write.FileRspResponse
# @alias write.HttpDaemonRspResponse
#
# @title "Writes an RSP response to the predefined output"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Objects to be pasted together and outputted.}
#   \item{collapse}{A @character string to be used to collapse the objects.}
#   \item{sep}{A @character string to separate the objects.}
# }
#
# \value{
#  Returns nothing.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#
# @keyword IO
#*/#########################################################################
setMethodS3("write", "RspResponse", abstract=TRUE);




#########################################################################/**
# @RdocMethod flush
# @alias flush.FileRspResponse
# @alias flush.HttpDaemonRspResponse
#
# @title "Flushes the response buffer"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns nothing.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#
# @keyword IO
#*/#########################################################################
setMethodS3("flush", "RspResponse", appendVarArgs=FALSE, abstract=TRUE)



##############################################################################
# HISTORY:
# 2006-07-04
# o Renamed from Response to RspResponse.
# 2005-11-30
# o Created from (File)RspResponse.  This is to be the new superclass.
##############################################################################
