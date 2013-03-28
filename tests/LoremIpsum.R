library("R.rsp")

path <- system.file(package="R.rsp")
path <- file.path(path, "rsp,LoremIpsum")
pathnames <- list.files(path=path, pattern="[.]rsp$", full.names=TRUE)
for (pathname in pathnames) {
  outPath <- gsub("LoremIpsum.", "", basename(pathname))
  outPath <- file.path("LoremIpsum", outPath)
  pathnameR <- rsp(pathname, outPath=outPath, verbose=-10)
  print(pathnameR)
}
