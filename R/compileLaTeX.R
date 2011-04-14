###########################################################################/**
# @RdocDefault compileLaTeX
#
# @title "Compiles a LaTeX file"
#
# \description{
#  @get "title" to either PDF or DVI.
# }
#
# @synopsis
#
# \arguments{
#   \item{filename, path}{The filename and (optional) path of the 
#      LaTeX document to be compiled.}
#   \item{format}{A @character string specifying the output format.}
#   \item{...}{Additional arguments passed to @see "tools::texi2dvi".}
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
#   Internally, @see "tools::texi2dvi" is used.
#   To compile Sweave LaTeX documents, @see "compileSweave".
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/########################################################################### 
setMethodS3("compileLaTeX", "default", function(filename, path=NULL, format=c("pdf", "dvi"), ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Arguments 'filename' & 'path':
  pathname <- Arguments$getReadablePathname(filename, path=path, mustExist=TRUE);

  # Arguments 'format':
  format <- match.arg(format);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  } 


  verbose && enter(verbose, "Compiling LaTeX document");
  verbose && cat(verbose, "LaTeX pathname: ", pathname);
  verbose && cat(verbose, "Output format: ", format);

  pattern <- "(.*)[.]([^.]+)$";
  replace <- sprintf("\\1.%s", format);
  pathnameOut <- gsub(pattern, replace, pathname);
  verbose && cat(verbose, toupper(format), " pathname: ", pathnameOut);

  verbose && enter(verbose, "Calling tools::texidvi()");
  pdf <- (format == "pdf");
  tools::texi2dvi(pathname, pdf=pdf);
  verbose && exit(verbose);

  verbose && exit(verbose);

  invisible(pathnameOut);
}) # compileLaTeX()


############################################################################
# HISTORY:
# 2011-04-12
# o Added compileLaTeX().
# o Created.
############################################################################
