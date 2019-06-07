path <- system.file("exData", package="R.rsp")
pathname <- rfile("random.txt.rsp", path=path,
                  output=file.path(tempdir(), "random.txt"))
print(pathname)

lines <- readLines(pathname, warn=FALSE)
cat(lines, collapse="\n")

file.remove(pathname)


# Passing arguments
path <- system.file("exData", package="R.rsp")
pathname <- rfile("random-args.txt.rsp", path=path, args=list(K=50),
                  output=file.path(tempdir(), "random-args.txt"))
print(pathname)

lines <- readLines(pathname, warn=FALSE)
cat(lines, collapse="\n")

file.remove(pathname)
