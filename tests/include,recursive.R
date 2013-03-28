library("R.rsp")

path <- system.file("rsp,tests", package="R.rsp")
pathname <- file.path(path, "recursive.txt.rsp")
print(pathname)

evalWithTimeout({
  res <- try({ rcat(file=pathname) })
  stopifnot(inherits(res, "try-error"))
}, timeout=30L)
