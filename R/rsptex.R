###########################################################################/**
# @RdocDefault rsptex
#
# @title "Compiles an RSP LaTeX file into a DVI file"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to @see "compileRsp".}
#   \item{pdf}{If @TRUE, a PDF is generated, otherwise a DVI file.}
#   \item{force}{If @TRUE, file timestamps are ignored.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns the pathname to the generated document.
# }
#
# @author
#
# \seealso{
#   The generated TeX document is compiled by @see "tools::texi2dvi" in
#   the \pkg{tools} package.
# }
#
# @keyword file
# @keyword IO
#*/########################################################################### 
setMethodS3("rsptex", "default", function(..., pdf=FALSE, force=FALSE, verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "Compiling RSP LaTeX file");

  pathname2 <- compileRsp(..., force=force, verbose=verbose);
  verbose && cat(verbose, "LaTeX pathname: ", pathname2);

  ext <- ifelse(pdf, ".pdf", ".dvi");
  pathname3 <- gsub("[.]tex$", ext, pathname2);
  verbose && cat(verbose, "Output pathname: ", pathname3);

  # Is output file up to date?
  isUpToDate <- FALSE;
  if (!force && isFile(pathname3)) {
    date <- file.info(pathname2)$mtime;
    verbose && cat(verbose, "Source file modified on: ", date);
    outDate <- file.info(pathname3)$mtime;
    verbose && cat(verbose, "Output file modified on: ", outDate);
    if (is.finite(date) && is.finite(outDate)) {
      isUpToDate <- (outDate >= date);
    }
    verbose && printf(verbose, "Output file is %sup to date.\n", ifelse(isUpToDate, "", "not "));
  }

  if (force || !isUpToDate) {
    verbose && enter(verbose, "Compiling LaTeX file");
    tools::texi2dvi(pathname2, pdf=pdf);
    verbose && exit(verbose);
  }

  verbose && exit(verbose);

  invisible(pathname3);
}) # rsptex()


############################################################################
# HISTORY:
# 2009-02-23
# o Created.
############################################################################
