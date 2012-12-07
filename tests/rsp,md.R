library("R.rsp")

pathname <- system.file("exData", "LoremIpsum.md.rsp", package="R.rsp")
pathname <- Arguments$getReadablePathname(pathname)
pathnameR <- rsp(pathname, outPath="md.rsp", verbose=-10)
print(pathnameR)
pathnameR <- Arguments$getReadablePathname(pathnameR)
