setMethodS3("rsource", "default", function(file, path=NULL, output="", buffered=FALSE, ...) {
  rcat(file=file, path=path, output=output, buffered=buffered, ...);
}) # rsource()

setMethodS3("rsource", "RspString", function(rstr, output="", buffered=FALSE, ...) {
  rcat(rstr, output=output, buffered=buffered, ...);
}, protected=TRUE) # rsource()



setMethodS3("rsource", "RspDocument", function(doc, output="", buffered=FALSE, ...) {
  rcat(doc, output=output, buffered=buffered, ...);
}, protected=TRUE) # rsource()


setMethodS3("rsource", "RspRSourceCode", function(rcode, output="", buffered=FALSE, ...) {
  rcat(rcode, output=output, buffered=buffered, ...);
}, protected=TRUE) # rsource()

setMethodS3("rsource", "function", function(object, output="", buffered=FALSE, ...) {
  rcat(object, output=output, buffered=buffered, ...);
}, protected=TRUE) # rsource()


############################################################################
# HISTORY:
# 2013-08-05
# o Created.
############################################################################
