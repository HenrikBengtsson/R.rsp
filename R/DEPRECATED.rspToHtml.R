###########################################################################/**
# @RdocDefault rspToHtml
#
# @title "Compiles an RSP file to an HTML file"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{file}{The filename of the RSP file to be compiled.}
#   \item{path}{An optional path to the RSP file.}
#   \item{outFile}{The filename of the output file.
#     If @NULL, a default output file is used.}
#   \item{outPath}{An optional path to the output file.}
#   \item{extension}{The filename extension of the default output file.}
#   \item{overwrite}{If @TRUE, an existing output file is overwritten.}
#   \item{...}{Additional arguments passed to @see "sourceRsp".}
# }
#
# \value{
#   Returns the pathname to the generated document.
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
setMethodS3("rspToHtml", "default", function(file=NULL, path=NULL, outFile=NULL, outPath=NULL, extension="html", overwrite=TRUE, ...) {
  .Defunct(new="rfile()")
}, deprecated=TRUE, private=TRUE) # rspToHtml()


############################################################################
# HISTORY:
# 2007-01-07
# o BUG FIX: Argument 'path' was set to the directory of the 'file'.
# 2006-08-06
# o Created for conveniency.
############################################################################


