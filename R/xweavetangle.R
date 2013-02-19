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
#   \item{fake}{If @TRUE, nothing is done, but the pathname of the 
#      output file that would have been created is still returned.}
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
rspWeave <- function(file, ..., fake=FALSE, envir=parent.frame()) {
  # From help("vignetteEngine", package="tools"):
  #  "If the filename being processed has one of the Sweave extensions
  # (i.e. matching the regular expression ".[RrSs](nw|tex)$", the weave
  # function should produce a '.tex' file in the same directory.
  # If it has the extension '.Rmd', weaving should produce an .html' file.
  if (is.character(file)) {
    output <- NULL;
    filename <- basename(file);
    patterns <- c(tex="[.][RrSs](nw|tex)$", html="[.]Rmd$");
    for (kk in seq_along(patterns)) {
      ext <- names(patterns)[kk];
      pattern <- patterns[kk];
      if (regexpr(pattern, filename, ignore.case=TRUE) == -1L) {
        next;
      }
      fullname <- gsub(pattern, "", filename, ignore.case=TRUE);
      extT <- tolower(gsub("[.]([^.]*)$", "\\1", fullname, ignore.case=TRUE));
      if (extT == ext) {
        output <- fullname;
      } else {
        output <- sprintf("%s.%s", fullname, ext);
      }
    } # for (kk ...)
  } else {
    output <- NULL;
  }

  rfile(file, output=output, workdir=".", postprocess=FALSE, envir=envir, fake=fake);
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
#   \item{fake}{If @TRUE, nothing is done, but the pathname of the 
#      output file that would have been created is still returned.}
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
rspTangle <- function(file, ..., fake=FALSE, envir=parent.frame()) {
  # Setup output R file
  workdir <- ".";
  filename <- basename(file);
  fullname <- gsub("[.]([^.])$", "", filename);
  filenameR <- sprintf("%s.R", fullname);
  pathnameR <- Arguments$getWritablePathname(filenameR, path=workdir);
  pathnameR <- getAbsolutePath(pathnameR);

  if (fake) {
    return(pathnameR);
  }

  # Read RSP file
  lines <- readLines(file, warn=FALSE);

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
# 2013-02-18
# o Added argument 'fake' to rspSweave() and rspTangle().
# 2013-02-14
# o Created.
###############################################################################
