setMethodS3("rstring", "default", function(..., envir=parent.frame()) {
  s <- RspString(...);
  rstring(s, envir=envir);
}) # rstring()

setMethodS3("rstring", "RspString", function(object, ...) {
  expr <- parse(object);
  rstring(expr, ...);
}) # rstring()

setMethodS3("rstring", "RspDocument", function(object, ...) {
  rCode <- toR(object);
  rstring(rCode, ...);
}) # rstring()

setMethodS3("rstring", "RCode", function(object, envir=parent.frame(), engine=RRspEngine(), ...) {
  header <- '
rspCon <- textConnection(NULL, open="w", local=TRUE);
on.exit({ if (exists("rspCon")) close(rspCon) });

.ro <- function(..., collapse="", sep="") {
  msg <- paste(..., collapse=collapse, sep=sep);
  cat(msg, sep="", file=rspCon);
} # .ro()

';

  footer <- '
.ro("\n"); # Force a last complete line
rm(".ro");
rspRes <- paste(textConnectionValue(rspCon), collapse="\n");
close(rspCon);
rm("rspCon");
';

  rCode <- c(header, object, footer);
  rCode <- paste(rCode, collapse="\n");
##  rCode <- sprintf("local({%s})", rCode);
  expr <- base::parse(text=rCode);
  rspRes <- NULL; rm(rspRes); # To please R CMD check
  eval(expr, envir=envir, ...);
  res <- rspRes;
  rm("rspRes", envir=envir);
  res;
}) # rstring()


setMethodS3("rcat", "default", function(..., file="", append=FALSE, envir=parent.frame()) {
  s <- rstring(..., envir=envir);
  cat(s, file=file, append=append);
}) # rstring()


##############################################################################
# HISTORY:
# 2013-02-09
# o Created.
##############################################################################
