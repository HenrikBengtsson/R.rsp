library("R.rsp")

path <- system.file("rsp_examples", package="R.rsp")
print(path)
print(dir(path=path))

args <- rargs(file="LoremIpsum.tex.rsp", path=path)
print(args)
str(args)

