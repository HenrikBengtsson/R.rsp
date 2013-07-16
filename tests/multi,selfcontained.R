library("R.rsp")

path <- system.file("rsp,tests", package="R.rsp")
pathname <- rfile("multi,selfcontained.md.rsp", path=path)
print(pathname)

res <- rfile(pathname, output=output)
print(res)
