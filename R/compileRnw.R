###########################################################################/**
# @RdocDefault compileRnw
#
# @title "Compiles a Rnw file"
#
# \description{
#  @get "title".
#  The compiler used depends on the content type.
# }
#
# @synopsis
#
# \arguments{
#   \item{filename, path}{The filename and (optional) path of the
#      document to be compiled.}
#   \item{...}{Additional arguments passed to the compiler function
#      used.}
#   \item{type}{A @character string specifying what content type of
#      Rnw file to compile.  The default type is inferred from the
#      content of the file using @see "typeOfRnw".}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns the pathname of the generated document.
# }
#
# @author
#
# @keyword file
# @keyword IO
# @keyword internal
#*/###########################################################################
setMethodS3("compileRnw", "default", function(filename, path=NULL, ..., type=typeOfRnw(filename, path=path), verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'type':
  type <- Arguments$getCharacter(type);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "Compiling Rnw document");

  verbose && cat(verbose, "Type of Rnw file: ", type);

  if (type == "application/x-sweave") {
    pathnameR <- compileSweave(filename, path=path, ..., verbose=verbose);
  } else if (type == "application/x-knitr") {
    pathnameR <- compileKnitr(filename, path=path, ..., verbose=verbose);
  } else if (type == "application/x-asciidoc-noweb") {
    pathnameR <- compileAsciiDocNoweb(filename, path=path, ..., verbose=verbose);
  } else {
    throw("Unknown value of argument 'type': ", type);
  }

  verbose && exit(verbose);

  pathnameR;
}) # compileRnw()


############################################################################
# HISTORY:
# 2013-03-29
# o Added support for AsciiDoc Rnw:s.
# 2013-01-20
# o Created from compileSweave.R.
############################################################################
