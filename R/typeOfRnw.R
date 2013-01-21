###########################################################################/**
# @RdocDefault typeOfRnw
#
# @title "Checks whether an Rnw file is a Sweave or a knitr file"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{filename, path}{The filename and (optional) path of the Rnw file.}
#   \item{default}{A @character string specifying the default result.}
#   \item{...}{Not used.}
# }
#
# \value{
#   Returns a @character string.
# }
#
# @author
#
# \seealso{
#   TBA.
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/########################################################################### 
setMethodS3("typeOfRnw", "default", function(filename, path=NULL, default=c("sweave", "knitr"), ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Arguments 'filename' & 'path':
  pathname <- Arguments$getReadablePathname(filename, path=path, mustExist=TRUE);

  # Argument 'default':
  default <- match.arg(default);

  # Read content
  bfr <- readLines(pathname);


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Check for knitr-specific commands
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (any(regexpr("opts_chunk$set(", bfr, fixed=TRUE) != -1)) {
    return("knitr");
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Check for Sweave-specific commands
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (any(regexpr("\\SweaveOpts(", bfr, fixed=TRUE) != -1)) {
    return("Sweave");
  }

  default;
}) # typeOfRnw()


############################################################################
# HISTORY:
# 2013-01-20
# o Created.
############################################################################
