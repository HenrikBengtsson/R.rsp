###########################################################################/**
# @RdocFunction rspWeave
#
# @title "A weave function for RSP documents"
#
# \description{
#  @get "title".
#  This function is for RSP what @see "utils::Sweave" is for Sweave documents.
# }
#
# @synopsis
#
# \arguments{
#   \item{file}{The file to be weaved.}
#   \item{...}{Not used.}
#   \item{quiet}{If @TRUE, no verbose output is generated.}
#   \item{envir}{The @environment where the RSP document is 
#         parsed and evaluated.}
# }
#
# \value{
#   Returns the absolute pathname of the generated RSP product.
#   The generated RSP product is not postprocessed.
# }
#
# @author
#
# \seealso{
#   @see "rspTangle"
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/########################################################################### 
rspWeave <- function(file, ..., postprocess=FALSE, quiet=FALSE, envir=parent.frame()) {
  rfile(file, ..., workdir=".", postprocess=postprocess, envir=envir, verbose=!quiet);
} # rspWeave()



###########################################################################/**
# @RdocFunction rspTangle
#
# @title "A tangle function for RSP documents"
#
# \description{
#  @get "title".
#  This function is for RSP what @see "utils::Stangle" is for Sweave documents.
# }
#
# @synopsis
#
# \arguments{
#   \item{file}{The file to be tangled.}
#   \item{...}{Not used.}
#   \item{envir}{The @environment where the RSP document is parsed.}
# }
#
# \value{
#   Returns the absolute pathname of the generated R source code file.
# }
#
# @author
#
# \seealso{
#   @see "rspWeave"
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/########################################################################### 
rspTangle <- function(file, ..., envir=parent.frame()) {
  require("R.utils") || throw("Package not loaded: R.utils");

  # Setup output R file
  workdir <- ".";
  filename <- basename(file);
  pattern <- "(|[.][^.]*)[.]rsp$";
  fullname <- gsub(pattern, "", filename);
  filenameR <- sprintf("%s.R", fullname);
  pathnameR <- Arguments$getWritablePathname(filenameR, path=workdir);
  pathnameR <- getAbsolutePath(pathnameR);

  # Read RSP file
  lines <- readLines(file, warn=FALSE);

  # Setup RSP string
  s <- RspString(lines, source=file);

  # Parse as RSP document
  doc <- parse(s, envir=envir);

  # Translate to R code
  rcode <- toR(doc);

  # Drop text-outputting code
  rcode <- tangle(rcode);

  # Write R code
  writeLines(rcode, con=pathnameR);

  invisible(pathnameR);
} # rspTangle()


###############################################################################
# HISTORY:
# 2013-03-07
# o CLEANUP: Dropped 'fake' processing again.
# 2013-03-01
# o BUG FIX: rspTangle() assumed R.utils is loaded.
# 2013-02-18
# o Added argument 'fake' to rspSweave() and rspTangle().
# 2013-02-14
# o Created.
###############################################################################
