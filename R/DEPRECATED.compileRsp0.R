setMethodS3("compileRsp0", "default", function(..., envir=parent.frame(), force=FALSE, verbose=FALSE) {
  .Defunct(new="compileRsp()")
}, deprecated=TRUE) # compileRsp0()


###########################################################################
# HISTORY:
# 2013-03-31
# o One issue with translateRsp() and compileRsp0() is that they create
#   files in the source directory, which may be read-only.
# 2013-03-29
# o Renamed to compileRsp0(). May be dropped rather soon.
# 2009-02-23
# o Updated to use parseRsp().
# 2009-02-22
# o Created.
###########################################################################
