library("R.rsp")

pathname <- system.file("exData", "LoremIpsum.knitr.Rnw", package="R.rsp")
pathname <- Arguments$getReadablePathname(pathname)
print(pathname)

if (Sys.getenv("_R_CHECK_FULL_") != "") {
  pathnameR <- compileKnitr(pathname, outPath="knitr.Rnw/", verbose=-10)
  print(pathnameR)
  pathnameR <- Arguments$getReadablePathname(pathnameR)
}

