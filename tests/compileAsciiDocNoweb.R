library("R.rsp")

path <- system.file(package="R.rsp")
path <- file.path(path, "rsp,LoremIpsum")
pathname <- file.path(path, "LoremIpsum.asciidoc.Rnw")
print(pathname)

if (Sys.getenv("_R_CHECK_FULL_") != "") {
  outPath <- file.path("LoremIpsum", "asciidoc.Rnw");
  pathnameR <- compileAsciiDocNoweb(pathname, outPath=outPath, verbose=-10)
  print(pathnameR)
  pathnameR <- Arguments$getReadablePathname(pathnameR)
}

