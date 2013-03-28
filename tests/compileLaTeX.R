library("R.rsp")

path <- system.file("rsp,LoremIpsum", package="R.rsp")
pathname <- file.path(path, "LoremIpsum.tex")
print(pathname)

if (Sys.getenv("_R_CHECK_FULL_") != "") {
  pathnameR <- compileLaTeX(pathname, outPath="tex/", verbose=-10)
  print(pathnameR)
  pathnameR <- Arguments$getReadablePathname(pathnameR)
}

