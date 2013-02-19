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
#   \item{clean, quiet}{Additional arguments passed to @see "tools::texi2dvi".}
#   \item{...}{Not used.}
#   \item{outPath}{The output and working directory.}
#   \item{fake}{If @TRUE, nothing is done, but the pathname of the 
#      output file that would have been created is still returned.}
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
setMethodS3("compileLaTeX", "default", function(filename, path=NULL, format=c("pdf", "dvi"), clean=FALSE, quiet=TRUE, ..., outPath=".", fake=FALSE, verbose=FALSE) {
  # Load the package (super quietly), in case R.rsp::nnn() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'fake':
  fake <- Arguments$getLogical(fake);

  # Arguments 'filename' & 'path':
  pathname <- Arguments$getReadablePathname(filename, path=path, mustExist=!fake);

  # Arguments 'outPath':
  outPath <- Arguments$getWritablePath(outPath);
  if (is.null(outPath)) outPath <- ".";

  # Arguments 'format':
  format <- match.arg(format);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  } 


  verbose && enter(verbose, "Compiling LaTeX document");
  pathname <- getAbsolutePath(pathname);
  verbose && cat(verbose, "LaTeX pathname (absolute): ", pathname);
  verbose && printf(verbose, "Input file size: %g bytes\n", file.info(pathname)$size);
  verbose && cat(verbose, "Output format: ", format);
  verbose && cat(verbose, "Output and working directory: ", getAbsolutePath(outPath));
  pattern <- "(.*)[.]([^.]+)$";
  replace <- sprintf("\\1.%s", format);
  filenameOut <- gsub(pattern, replace, basename(pathname));
  pathnameOut <- filePath(outPath, filenameOut);
  verbose && cat(verbose, "Output pathname (", toupper(format), "): ", getAbsolutePath(pathnameOut));

  if (fake) {
    verbose && cat(verbose, "Returning early (fake=TRUE)");
    verbose && exit(verbose);
    return(pathnameOut);
  }

  opwd <- ".";
  on.exit(setwd(opwd), add=TRUE);
  if (!is.null(outPath)) {
    opwd <- setwd(outPath);
  }

  verbose && enter(verbose, "Calling tools::texidvi()");
  pdf <- (format == "pdf");
  pathnameR <- getRelativePath(pathname);
  tools::texi2dvi(pathnameR, pdf=pdf, clean=clean, quiet=quiet);
  verbose && exit(verbose);

  setwd(opwd); opwd <- ".";
  verbose && printf(verbose, "Output file size: %g bytes\n", file.info(pathnameOut)$size);

  verbose && exit(verbose);

  invisible(pathnameOut);
}) # compileLaTeX()


############################################################################
# HISTORY:
# 2013-02-18
# o Added argument 'fake' to compileLaTeX().
# 2012-12-06
# o Added argument 'outPath' to compileLaTeX(), which is also the 
#   working directory.
# o BUG FIX: compileLaTeX() would return an incorrect pathname unless
#   the given LaTeX file was in the current working directory.
# 2011-04-19
# o Added arguments 'clean' and 'quiet' to compileLaTeX().
# 2011-04-12
# o Added compileLaTeX().
# o Created.
############################################################################
