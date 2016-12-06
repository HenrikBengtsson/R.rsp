setMethodS3("compileRsp0", "default", function(..., envir=parent.frame(), force=FALSE, verbose=FALSE) {
  .Defunct(new="compileRsp()")
}, deprecated=TRUE)

hexToInt <- function(hex, ...) .Defunct()

setMethodS3("importRsp", "default", function(...) {
  .Defunct(msg="importRsp() is deprecated. Please use <%@include ...%> instead")
})

setMethodS3("parseRsp", "default", function(rspCode, rspLanguage=getOption("rspLanguage"), trimRsp=TRUE, validate=TRUE, verbose=FALSE, ...) {
  .Defunct(new="rcompile()")
}, deprecated=TRUE)

setMethodS3("rsp", "default", function(filename=NULL, path=NULL, text=NULL, response=NULL, ..., envir=parent.frame(), outPath=".", postprocess=TRUE, verbose=FALSE) {
  .Defunct(new="rfile()")
}, deprecated=TRUE)

rspCapture <- function(..., wrapAt=80, collapse="\n") {
  .Defunct(new="R.utils::withCapture()")
} # rspCapture()

setMethodS3("rspToHtml", "default", function(file=NULL, path=NULL, outFile=NULL, outPath=NULL, extension="html", overwrite=TRUE, ...) {
  .Defunct(new="rfile()")
}, deprecated=TRUE, private=TRUE)

setMethodS3("rsptex", "default", function(..., pdf=TRUE, force=FALSE, verbose=FALSE) {
  .Defunct(new="rfile()")
}, deprecated=TRUE, private=TRUE)

setMethodS3("sourceAllRsp", "default", function(pattern="[.]rsp$", path=".", extension="html", outputPath=extension, overwrite=FALSE, ..., envir=parent.frame()) {
  .Defunct(new="lapply(dir(pattern='[.]rsp$', FUN=rfile)")
}, deprecated=TRUE)

setMethodS3("sourceRsp", "default", function(..., response=FileRspResponse(file=stdout()), request=NULL, envir=parent.frame(), verbose=FALSE) {
  .Defunct(new="rfile(), rcat(), or rstring()")
}, deprecated=TRUE)

setMethodS3("sourceRspV2", "default", function(..., response=FileRspResponse(file=stdout()), request=NULL, envir=parent.frame(), verbose=FALSE) {
  .Defunct(new="rfile(), rcat(), or rstring()")
}, deprecated=TRUE, private=TRUE)

setMethodS3("translateRsp", "default", function(filename, path=NULL, ..., force=FALSE, verbose=FALSE) {
  .Defunct(new="rcode()")
}, deprecated=TRUE)

setMethodS3("translateRspV1", "default", function(file="", text=NULL, path=getParent(file), rspLanguage=getOption("rspLanguage"), trimRsp=TRUE, verbose=FALSE, ...) {
  .Defunct(new="rcode()")
}, deprecated=TRUE)

urlDecode <- function(url, ...) {
  .Defunct(new="utils::URLdecode()")
}

setMethodS3("import", "RspResponse", function(response, ...) {
  .Defunct(msg = "RSP construct <%@import file=\"url\"%> is defunct.")
}, protected=TRUE, deprecated=TRUE)

setMethodS3("rscript", "default", function(...) {
  .Defunct(new="rcode()")
}, deprecated=TRUE)
