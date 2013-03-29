###########################################################################/**
# @RdocDefault compileSweave
#
# @title "Compiles a Sweave file"
#
# \description{
#  @get "title".
#  If Sweave generates a LaTeX file, that is then compiled as well,
#  which in turn generates either a PDF or a DVI document.
# }
#
# @synopsis
#
# \arguments{
#   \item{filename, path}{The filename and (optional) path of the
#      Sweave document to be compiled.}
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
#   Internally, @see "utils::Sweave" and @see "compileLaTeX" are used.
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/###########################################################################
setMethodS3("compileSweave", "default", function(filename, path=NULL, ..., outPath=".", verbose=FALSE) {
  # Load the package (super quietly), in case R.rsp::nnn() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");

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

  verbose && enter(verbose, "Compiling Sweave document");
  pathname <- getAbsolutePath(pathname);
  verbose && cat(verbose, "Sweave pathname (absolute): ", pathname);
  verbose && printf(verbose, "Input file size: %g bytes\n", file.info(pathname)$size);
  verbose && cat(verbose, "Output and working directory: ", outPath);

  opwd <- ".";
  on.exit(setwd(opwd), add=TRUE);
  if (!is.null(outPath)) {
    opwd <- setwd(outPath);
  }

  pathname2 <- Sweave(pathname);

  pathname2 <- getAbsolutePath(pathname2);
  verbose && cat(verbose, "Sweave output pathname: ", pathname2);

  setwd(opwd); opwd <- ".";
  verbose && printf(verbose, "Output file size: %g bytes\n", file.info(pathname2)$size);

  # Compile LaTeX?
  ext <- gsub(".*[.]([^.]*)$", "\\1", pathname2);
  isLaTeX <- (tolower(ext) == "tex");
  if (isLaTeX) {
    verbose && enter(verbose, "Compiling Sweave-generated LaTeX document");
    pathname3 <- compileLaTeX(pathname2, ..., outPath=outPath, verbose=less(verbose, 10));
    verbose && cat(verbose, "Output pathname: ", pathname3);
    verbose && exit(verbose);
  } else {
    pathname3 <- pathname2;
  }

  verbose && exit(verbose);

  invisible(pathname3);
}) # compileSweave()


############################################################################
# HISTORY:
# 2013-02-18
# o Added argument 'fake' to compileSweave().
# 2012-12-06
# o Added argument 'outPath' to compileSweave(), which is also the
#   working directory.
# 2011-04-14
# o Now compileSweave() only calls compileLaTeX() if Sweave outputs
#   a file with filename extension *.tex (non-case sensitive).
# 2011-04-12
# o Added compileSweave().
# o Created.
############################################################################
