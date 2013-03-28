library("R.rsp")

# A knitr Rnw file
path <- system.file("rsp,LoremIpsum", package="R.rsp")
pathname <- file.path(path, "LoremIpsum.knitr.Rnw")
print(pathname)

if (Sys.getenv("_R_CHECK_FULL_") != "") {
  pathnameR <- compileRnw(pathname, outPath="knitr.Rnw-auto/", verbose=-10)
  print(pathnameR)
  pathnameR <- Arguments$getReadablePathname(pathnameR)
}


# A Sweave Rnw file
path <- system.file("rsp,LoremIpsum", package="R.rsp")
pathname <- file.path(path, "LoremIpsum.Rnw")
print(pathname)

if (Sys.getenv("_R_CHECK_FULL_") != "") {
  pathnameR <- compileRnw(pathname, outPath="Rnw-auto/", verbose=-10)
  print(pathnameR)
  pathnameR <- Arguments$getReadablePathname(pathnameR)
}
