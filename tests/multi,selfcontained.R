library("R.rsp")

path <- system.file("rsp,tests", package="R.rsp")
res <- rfile("multi,selfcontained.md.rsp", path=path, workdir="multi,selfcontained/")
print(res)
