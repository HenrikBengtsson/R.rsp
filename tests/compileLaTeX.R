library("R.rsp")

pathname <- system.file("exData", "LoremIpsum.tex", package="R.rsp")
pathname <- Arguments$getReadablePathname(pathname)
print(pathname)

if (Sys.getenv("_R_CHECK_FULL_") != "") {
  pathnameR <- compileLaTeX(pathname, outPath="latex/", verbose=-10)
  print(pathnameR)
  pathnameR <- Arguments$getReadablePathname(pathnameR)
}
