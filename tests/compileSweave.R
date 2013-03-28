library("R.rsp")

path <- system.file("rsp,LoremIpsum", package="R.rsp")
pathname <- file.path(path, "LoremIpsum.Rnw")
print(pathname)

if (Sys.getenv("_R_CHECK_FULL_") != "") {
  pathnameR <- compileSweave(pathname, outPath="Rnw/", verbose=-10)
  print(pathnameR)
  pathnameR <- Arguments$getReadablePathname(pathnameR)
}
