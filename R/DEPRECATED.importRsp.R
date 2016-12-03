###########################################################################/**
# @RdocDefault importRsp
#
# @title "Imports an RSP file"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to @see "sourceRsp".}
# }
#
# \value{
#   Returns the compile output of an RSP template as a @character string.
# }
#
# @author
#
# \seealso{
#   @see "sourceRsp".
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/###########################################################################
setMethodS3("importRsp", "default", function(...) {
  .Defunct(msg="importRsp() is deprecated. Please use <%@include ...%> instead")
})


##############################################################################
# HISTORY:
# 2005-09-22
# o BUG FIX: sourceRsp() is no longer using argument 'output', but 'response'.
# 2005-09-18
# o Added Rdoc comments.
# 2005-07-31
# o Created.
##############################################################################
