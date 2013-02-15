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
#   \item{envir}{The @environment where the RSP document is 
#         parsed and evaluated.}
# }
#
# \value{
#   Returns the absolute pathname of the generated RSP artifact.
#   The generated RSP artifact is not postprocessed.
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
rspWeave <- function(file, ..., envir=parent.frame()) {
  rfile(file, workdir=".", postprocess=FALSE, envir=envir);
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
  # Setup output R file
  workdir <- ".";
  filename <- basename(file);
  filenameR <- sprintf("%s.R", filename);
  pathnameR <- Arguments$getWritablePathname(filenameR, path=workdir);

  # Read RSP file
  lines <- readLines(file);

  # Setup RSP string
  s <- RspString(lines, source=file);

  # Parse as RSP document
  doc <- parse(s, envir=envir);
  print(doc);

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
# 2013-02-14
# o Created.
###############################################################################
