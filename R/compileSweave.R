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
setMethodS3("compileSweave", "default", function(filename, path=NULL, ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Arguments 'filename' & 'path':
  pathname <- Arguments$getReadablePathname(filename, path=path, mustExist=TRUE);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "Compiling Sweave document");
  verbose && cat(verbose, "Sweave pathname: ", pathname);

  pathname2 <- Sweave(pathname);
  verbose && cat(verbose, "Sweave output pathname: ", pathname2);

  # Compile LaTeX?
  ext <- gsub(".*[.]([^.]*)$", "\\1", pathname2);
  isLaTeX <- (tolower(ext) == "tex");
  if (isLaTeX) {
    verbose && enter(verbose, "Compiling Sweave-generated LaTeX document");
    pathname3 <- compileLaTeX(pathname2, ..., verbose=less(verbose, 10));
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
# 2011-04-14
# o Now compileSweave() only calls compileLaTeX() if Sweave outputs
#   a file with filename extension *.tex (non-case sensitive).
# 2011-04-12
# o Added compileSweave().
# o Created.
############################################################################
