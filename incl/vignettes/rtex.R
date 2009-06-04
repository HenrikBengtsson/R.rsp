rtex <- function(filename, pdf=FALSE) {
  require("R.rsp") || stop("Package not loaded: R.rsp");
  name <- gsub("[.][^.]*$", "", filename);
  ofile <- sprintf("%s.tex", name);
  sourceRsp(filename, response=FileRspResponse(ofile, overwrite=TRUE));
  system(sprintf("latex %s.tex", name));
  system(sprintf("dvips %s.dvi", name));
  if (pdf)
    system(sprintf("ps2pdf %s.ps", name));
} # rtex()

