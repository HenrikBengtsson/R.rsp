library("R.rsp")

# A knitr Rnw file
pathname <- system.file("exData", "LoremIpsum.knitr.Rnw", package="R.rsp")
pathname <- Arguments$getReadablePathname(pathname)
print(pathname)

if (Sys.getenv("_R_CHECK_FULL_") != "") {
  pathnameR <- compileRnw(pathname, outPath="knitr.Rnw-auto/", verbose=-10)
  print(pathnameR)
  pathnameR <- Arguments$getReadablePathname(pathnameR)
}


# A Sweave Rnw file
pathname <- system.file("exData", "LoremIpsum.Rnw", package="R.rsp")
pathname <- Arguments$getReadablePathname(pathname)
print(pathname)

if (Sys.getenv("_R_CHECK_FULL_") != "") {
  pathnameR <- compileRnw(pathname, outPath="Rnw-auto/", verbose=-10)
  print(pathnameR)
  pathnameR <- Arguments$getReadablePathname(pathnameR)
}
