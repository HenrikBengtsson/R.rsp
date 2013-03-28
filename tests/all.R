library("R.rsp")
verbose <- Arguments$getVerbose(TRUE)

path <- system.file("inst", package="R.rsp")
path <- "R.rsp/inst"
path <- file.path(path, "rsp,tests")

# Find all RSP files with matching "truth" files
pathnames <- list.files(path=path, pattern="[.]rsp$", full.names=TRUE)
pathnames <- pathnames[file_test("-f", pathnames)]

# Reference ("truth") files
pathnamesR <- gsub("[.]rsp$", "", pathnames)
keep <- file_test("-f", pathnamesR)
pathnames <- pathnames[keep]
pathnamesR <- pathnamesR[keep]

for (kk in seq_along(pathnames)) {
  pathname <- pathnames[kk]
  pathnameR <- pathnamesR[kk]
  verbose && enter(verbose, sprintf("RSP file #%d ('%s') of %d", kk, pathname, length(pathnames)))

  rs <- rstring(file=pathname)
  s <- as.character(rs)
  sR <- readChar(pathnameR, nchars=1e6)
  sR <- gsub("\r\n", "\n", sR, fixed=TRUE)
  # If there is a '<EOF>' string, drop it and everything beyond
  sR <- sub("<EOF>.*", "", sR)

  # Compare
  res <- all.equal(s, sR)
  stopifnot(res)

  verbose && exit(verbose)
}
