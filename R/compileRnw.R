###########################################################################/**
# @RdocDefault compileRnw
#
# @title "Compiles a Knitr or Sweave Rnw file"
#
# \description{
#  @get "title" using @see "compileSweave" or @see "compileKnitr"
#  depending on whether the content of the Rnw file indicates
#  that it is a Sweave or a knitr Rnw file.
# }
#
# @synopsis
#
# \arguments{
#   \item{filename, path}{The filename and (optional) path of the 
#      Knitr document to be compiled.}
#   \item{...}{Additional arguments passed to the compiler function
#      used.}
#   \item{type}{A @character string specifying what type of Rnw file
#      to compile.  The default type is inferred from the content
#      of the file using @see "typeOfRnw".}
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
setMethodS3("compileRnw", "default", function(filename, path=NULL, ..., type=typeOfRnw(filename, path=path), verbose=FALSE) {
  # Load the package (super quietly), in case R.rsp::nnn() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'type':
  type <- Arguments$getCharacter(type);
  if (!is.element(type, c("sweave", "knitr"))) {
    throw("Unknown value of argument 'type': ", type);
  }

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "Compiling Rnw document");

  verbose && cat(verbose, "Type of Rnw file: ", type);
  if (type == "sweave") {
    pathnameR <- compileSweave(filename, path=path, ..., verbose=verbose);
  } else if (type == "knitr") {
    pathnameR <- compileKnitr(filename, path=path, ..., verbose=verbose);
  }
  verbose && exit(verbose);

  invisible(pathnameR);
}) # compileRnw()


############################################################################
# HISTORY:
# 2013-01-20
# o Created from compileSweave.R.
############################################################################
