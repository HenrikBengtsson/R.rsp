###########################################################################/**
# @RdocDefault compileKnitr
#
# @title "Compiles a Knitr file"
#
# \description{
#  @get "title".
#  If Knitr generates a LaTeX file, that is then compiled as well,
#  which in turn generates either a PDF or a DVI document.
# }
#
# @synopsis
#
# \arguments{
#   \item{filename, path}{The filename and (optional) path of the 
#      Knitr document to be compiled.}
#   \item{...}{Additional arguments passed to @see "compileLaTeX".}
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
# \seealso{
#   Internally, @see "knitr::knit" and @see "compileLaTeX" are used.
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/########################################################################### 
setMethodS3("compileKnitr", "default", function(filename, path=NULL, ..., outPath=".", verbose=FALSE) {
  require("knitr") || throw("Package not loaded: knitr");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Arguments 'filename' & 'path':
  pathname <- Arguments$getReadablePathname(filename, path=path, mustExist=TRUE);

  # Arguments 'outPath':
  outPath <- Arguments$getWritablePath(outPath);
  if (is.null(outPath)) outPath <- ".";

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "Compiling Knitr document");
  pathname <- getAbsolutePath(pathname);
  verbose && cat(verbose, "Knitr pathname (absolute): ", pathname);
  verbose && printf(verbose, "Input file size: %g bytes\n", file.info(pathname)$size);
  verbose && cat(verbose, "Output and working directory: ", outPath);

  opwd <- ".";
  on.exit(setwd(opwd), add=TRUE);
  if (!is.null(outPath)) {
    opwd <- setwd(outPath);
  }

  pathname2 <- knit(pathname);
  pathname2 <- getAbsolutePath(pathname2);
  verbose && cat(verbose, "Knitr output pathname: ", pathname2);

  setwd(opwd); opwd <- ".";
  verbose && printf(verbose, "Output file size: %g bytes\n", file.info(pathname2)$size);

  # Compile LaTeX?
  ext <- gsub(".*[.]([^.]*)$", "\\1", pathname2);
  isLaTeX <- (tolower(ext) == "tex");
  if (isLaTeX) {
    verbose && enter(verbose, "Compiling Knitr-generated LaTeX document");
    pathname3 <- compileLaTeX(pathname2, ..., outPath=outPath, verbose=less(verbose, 10));
    verbose && cat(verbose, "Output pathname: ", pathname3);
    verbose && exit(verbose);
  } else {
    pathname3 <- pathname2;
  }

  verbose && exit(verbose);

  invisible(pathname3);
}) # compileKnitr()


############################################################################
# HISTORY:
# 2013-01-20
# o Created from compileSweave.R.
############################################################################
