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


# Compile and display the main vignette (requires LaTeX)
if (isCapableOf(R.rsp, "latex")) {
  path <- system.file("doc", package="R.rsp")
  pdf <- rfile("Dynamic_document_creation_using_RSP.tex.rsp", path=path)
  printf("Created document: %s\n", pdf)
  if (interactive()) browseURL(pdf)
}
