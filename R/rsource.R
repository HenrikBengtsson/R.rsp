setMethodS3("rsource", "default", function(file, path=NULL, envir=parent.frame(), output="", buffered=FALSE, ...) {
  rcat(file=file, path=path, envir=envir, output=output, buffered=buffered, ...);
}) # rsource()

setMethodS3("rsource", "RspString", function(rstr, envir=parent.frame(), output="", buffered=FALSE, ...) {
  rcat(rstr, envir=envir, output=output, buffered=buffered, ...);
}, protected=TRUE) # rsource()



setMethodS3("rsource", "RspDocument", function(doc, envir=parent.frame(), output="", buffered=FALSE, ...) {
  rcat(doc, envir=envir, output=output, buffered=buffered, ...);
}, protected=TRUE) # rsource()


setMethodS3("rsource", "RspRSourceCode", function(rcode, envir=parent.frame(), output="", buffered=FALSE, ...) {
  rcat(rcode, envir=envir, output=output, buffered=buffered, ...);
}, protected=TRUE) # rsource()

setMethodS3("rsource", "function", function(object, envir=parent.frame(), output="", buffered=FALSE, ...) {
  rcat(object, envir=envir, output=output, buffered=buffered, ...);
}, protected=TRUE) # rsource()


############################################################################
# HISTORY:
# 2013-11-23
# o BUG FIX: rsource() would not evaluate in the current environment.
# 2013-08-05
# o Created.
############################################################################
