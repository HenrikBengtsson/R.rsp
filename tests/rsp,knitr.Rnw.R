library("R.rsp")

pathname <- system.file("exData", "LoremIpsum.knitr.Rnw.rsp", package="R.rsp")
pathname <- Arguments$getReadablePathname(pathname)
if (Sys.getenv("_R_CHECK_FULL_") != "") {
  pathnameR <- rsp(pathname, outPath="knitr.Rnw.rsp", verbose=-10)
  print(pathnameR)
  pathnameR <- Arguments$getReadablePathname(pathnameR)
}
