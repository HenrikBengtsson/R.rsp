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
#   \item{clean, quiet, texinputs}{Additional arguments passed to
#      @see "tools::texi2dvi".}
#   \item{...}{Not used.}
#   \item{outPath}{The output and working directory.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns the pathname of the generated (PDF or DVI) document.
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
setMethodS3("compileLaTeX", "default", function(filename, path=NULL, format=c("pdf", "dvi"), clean=FALSE, quiet=TRUE, texinputs=NULL, ..., outPath=".", verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Arguments 'filename' & 'path':
  pathname <- Arguments$getReadablePathname(filename, path=path);

  # Arguments 'outPath':
  outPath <- Arguments$getWritablePath(outPath);
  if (is.null(outPath)) outPath <- ".";

  # Arguments 'texinputs':
  texinputs <- Arguments$getCharacters(texinputs);

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

  opwd <- ".";
  on.exit(setwd(opwd), add=TRUE);
  if (!is.null(outPath)) {
    opwd <- setwd(outPath);
  }

  verbose && enter(verbose, "Calling tools::texidvi()");
  pdf <- (format == "pdf");
  pathnameR <- getRelativePath(pathname);
  # Sanity check
  pathnameRx <- Arguments$getReadablePathname(pathname);

  # Append the directory of the TeX file to TEXINPUTS search path?
  pathR <- dirname(pathnameR);
  if (pathR != ".") {
    verbose && enter(verbose, "Appending directory of TeX file to 'texinputs'");
    if (!is.null(texinputs)) {
      texinputs <- unlist(strsplit(texinputs, split="[:;]", fixed=FALSE), use.names=FALSE);
    }
    verbose && cat(verbose, "'texinputs' before:");
    verbose && print(verbose, texinputs);
    texinputs <- c(getAbsolutePath(pathR), getRelativePath(pathR), texinputs);
    verbose && exit(verbose);
  }

  verbose && cat(verbose, "texinputs:");
  verbose && print(verbose, texinputs);
  verbose && cat(verbose, "TEXINPUTS: ", Sys.getenv("TEXINPUTS"));
  verbose && cat(verbose, "BIBINPUTS: ", Sys.getenv("BIBINPUTS"));
  verbose && cat(verbose, "BSTINPUTS: ", Sys.getenv("BSTINPUTS"));
  verbose && cat(verbose, "TEXINDY: ", Sys.getenv("TEXINDY"));

  tools::texi2dvi(pathnameR, pdf=pdf, clean=clean, quiet=quiet, texinputs=texinputs);
  verbose && exit(verbose);

  setwd(opwd); opwd <- ".";
  verbose && printf(verbose, "Output file size: %g bytes\n", file.info(pathnameOut)$size);

  verbose && exit(verbose);

  pathnameOut;
}) # compileLaTeX()


############################################################################
# HISTORY:
# 2014-01-13
# o ROBUSTNESS: Now compileLaTeX() adds the directory of the LaTeX file
#   to TEXINPUTS also by its relative path (in addition to its absolute
#   path).  This provides a workaround for systems that does not handle
#   TEXINPUTS paths that are too long.  How to know what "too long" is is
#   not clear, but for the record a path with 138 characters is too long.
# 2013-07-16
# o Now compileLaTeX() adds the directory of the LaTeX file to the
#   TEXINPUTS search path, iff it's different than the working
#   directory.
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
