library("R.rsp")

path <- system.file(package="R.rsp")
path <- file.path(path, "rsp_LoremIpsum")
pathname <- file.path(path, "LoremIpsum.asciidoc.Rnw")
print(pathname)

if (Sys.getenv("_R_CHECK_FULL_") != "") {
  postprocess <- !is.null(findAsciiDoc(mustExist=FALSE));
  outPath <- file.path("LoremIpsum", "asciidoc.Rnw");
  pathnameR <- compileAsciiDocNoweb(pathname, outPath=outPath, postprocess=postprocess, verbose=-10)
  print(pathnameR)
  pathnameR <- Arguments$getReadablePathname(pathnameR)
}

