library("R.rsp")

path <- system.file("rsp,tests", package="R.rsp")
pathname <- Arguments$getReadablePathname("recursive.txt.rsp", path=path)
print(pathname)

evalWithTimeout({
  res <- try({ rcat(file=pathname) })
  stopifnot(inherits(res, "try-error"))
}, timeout=30L)
