library("R.rsp")

pathname <- system.file("exData", "LoremIpsum.html.rsp", package="R.rsp")
pathname <- Arguments$getReadablePathname(pathname)
pathnameR <- rsp(pathname, outPath="txt.rsp", verbose=-10)
print(pathnameR)
pathnameR <- Arguments$getReadablePathname(pathnameR)
