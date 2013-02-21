path <- system.file("exData", package="R.rsp")
pathname <- rfile("random.txt.rsp", path=path)
print(pathname)

lines <- readLines(pathname, warn=FALSE)
cat(lines, collapse="\n")


# Passing arguments
path <- system.file("exData", package="R.rsp")
pathname <- rfile("random-args.txt.rsp", path=path, args=list(K=50))
print(pathname)

lines <- readLines(pathname, warn=FALSE)
cat(lines, collapse="\n")


# Compile and display the main vignette
path <- system.file("doc", package="R.rsp")
pathname <- rfile("Dynamic_document_creation_using_RSP.tex.rsp", path=path)
printf("Created document: %s\n", pathname)
if (interactive()) browseURL(pathname)
