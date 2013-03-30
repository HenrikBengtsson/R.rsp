###########################################################################/**
# @RdocDefault compileAsciiDoc
#
# @title "Compiles an AsciiDoc file"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{filename, path}{The filename and (optional) path of the
#      document to be compiled.}
#   \item{...}{Additional arguments passed to executable \code{ascii}
#     (which must be on the system search path)
#     called via @see "base::system2".}
#   \item{outPath}{The output and working directory.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns (invisibly) the pathname of the generated document.
# }
#
# @author
#
# @keyword file
# @keyword IO
# @keyword internal
#*/###########################################################################
setMethodS3("compileAsciiDoc", "default", function(filename, path=NULL, ..., outPath=".", postprocess=TRUE, verbose=FALSE) {
  suppressPackageStartupMessages(require("ascii", quietly=TRUE)) || throw("Package not loaded: ascii");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Arguments 'filename' & 'path':
  pathname <- Arguments$getReadablePathname(filename, path=path);

  # Arguments 'outPath':
  outPath <- Arguments$getWritablePath(outPath);
  if (is.null(outPath)) outPath <- ".";

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "Compiling AsciiDoc noweb document");
  pathname <- getAbsolutePath(pathname);
  verbose && cat(verbose, "Pathname (absolute): ", pathname);
  verbose && printf(verbose, "Input file size: %g bytes\n", file.info(pathname)$size);
  verbose && cat(verbose, "Output and working directory: ", outPath);

  asciidoc <- findAsciiDoc(mustExist=TRUE, verbose=less(verbose, 10));

  opwd <- ".";
  on.exit(setwd(opwd), add=TRUE);
  if (!is.null(outPath)) {
    opwd <- setwd(outPath);
  }

  pathname <- getRelativePath(pathname);
  args <- c("-v");
##  args <- c(args, "-a data-uri");
  args <- c(args, pathname);
  res <- system2(asciidoc, args=args, stderr=TRUE);

  # Locate output filename
  pattern <- "^asciidoc: writing: ";
  pathname2 <- grep(pattern, res, value=TRUE);
  pathname2 <- gsub(pattern, "", pathname2);
  pathname2 <- trim(pathname2);
  pathname2 <- getAbsolutePath(pathname2);
  setwd(opwd); opwd <- ".";

  res <- RspFileProduct(pathname2);
  verbose && print(verbose, res);

  # Postprocess?
  if (postprocess) {
    res <- process(res, outPath=outPath, recursive=TRUE, verbose=verbose);
  }

  verbose && exit(verbose);

  res;
}) # compileAsciiDoc()


############################################################################
# HISTORY:
# 2013-03-29
# o Created (from compileAsciiDocNoweb.R).
############################################################################
