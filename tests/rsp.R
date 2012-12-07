library("R.rsp")

path <- system.file("exData", package="R.rsp")
path <- Arguments$getReadablePath(path)

pathnames <- list.files(path=path, pattern="[.]rsp$", full.names=TRUE)
print(pathnames)

if (Sys.getenv("_R_CHECK_FULL_") != "") {
  for (pathname in pathnames) {
    outPath <- gsub(".*[.](.*[.]rsp)$", "\\1", pathname);
    pathnameR <- rsp(pathname, outPath=outPath, verbose=-10)
    print(pathnameR)
    pathnameR <- Arguments$getReadablePathname(pathnameR)
  }
}
