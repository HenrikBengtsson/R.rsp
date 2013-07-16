library("R.rsp")

path <- system.file("rsp_LoremIpsum", package="R.rsp")
pathname <- file.path(path, "LoremIpsum.tex")
print(pathname)

if (Sys.getenv("_R_CHECK_FULL_") != "") {
  outPath <- file.path("LoremIpsum", "tex");
  pathnameR <- compileLaTeX(pathname, outPath=outPath, verbose=-10)
  print(pathnameR)
  pathnameR <- Arguments$getReadablePathname(pathnameR)
}

