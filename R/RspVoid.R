setConstructorS3("RspVoid", function(...) {
  extend(RspConstruct(), "RspVoid")
})

setMethodS3("asRspString", "RspVoid", function(object, ...) {
  RspString()
})

##############################################################################
# HISTORY:
# 2014-10-19
# o Created.
##############################################################################