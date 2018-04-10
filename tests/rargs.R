library("R.rsp")

path <- system.file("doc", package="R.rsp")
print(path)
print(dir(path=path))

args <- rargs(file="RSP_refcard.tex.rsp", path=path)
print(args)
str(args)

