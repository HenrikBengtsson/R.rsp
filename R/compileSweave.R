###########################################################################/**
# @RdocDefault compileSweave
#
# @title "Compiles a Sweave LaTeX file"
#
# \description{
#  @get "title" to either PDF or DVI.
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
#   Returns (invisibly) the pathname of the generated (PDF or DVI) document.
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

  verbose && enter(verbose, "Compiling Sweave LaTeX document");
  verbose && cat(verbose, "Sweave pathname: ", pathname);

  pathname2 <- Sweave(pathname);
  verbose && cat(verbose, "LaTeX pathname: ", pathname2);

  pathname3 <- compileLaTeX(pathname2, ...);
  verbose && cat(verbose, "Output pathname: ", pathname3);

  verbose && exit(verbose);

  invisible(pathname3);
}) # compileSweave()


############################################################################
# HISTORY:
# 2011-04-12
# o Added compileSweave().
# o Created.
############################################################################
