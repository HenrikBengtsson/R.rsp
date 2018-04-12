setMethodS3("rsource", "default", function(file, path=NULL, envir=parent.frame(), output="", buffered=FALSE, ...) {
  rcat(file=file, path=path, envir=envir, output=output, buffered=buffered, ...)
}) # rsource()

setMethodS3("rsource", "RspString", function(..., envir=parent.frame(), output="", buffered=FALSE) {
  rcat(..., envir=envir, output=output, buffered=buffered)
}, protected=TRUE) # rsource()

setMethodS3("rsource", "RspDocument", rsource.RspString)
setMethodS3("rsource", "RspRSourceCode", rsource.RspString)
setMethodS3("rsource", "function", rsource.RspString)
setMethodS3("rsource", "expression", rsource.RspString)
