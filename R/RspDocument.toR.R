#########################################################################/**
# @set "class=RspDocument"
# @RdocMethod toR
#
# @title "Translates the RSP document into R source code"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{factory}{A @see "RspSourceCodeFactory".}
#   \item{...}{Optional arguments passed to \code{toSourceCode()} for
#              the @see "RspSourceCodeFactory".}
# }
#
# \value{
#  Returns the R source code as an @see "RSourceCode".
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("toR", "RspDocument", function(object, factory=RspRSourceCodeFactory(), envir=parent.frame(), ...) {
  # Load the package (super quietly), in case R.rsp::rfile() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");

  # Argument 'factory':
  factory <- Arguments$getInstanceOf(factory, "RspSourceCodeFactory");

  # Argument 'envir':
  stopifnot(!is.null(envir));

  toSourceCode(factory, object, envir=envir, ...);
}) # toR()


#########################################################################/**
# @RdocMethod evaluate
#
# @title "Parses, translates, and evaluates the RSP document"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{envir}{The @environment where the RSP document is evaluated.}
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns the last evaluated expression, iff any.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("evaluate", "RspDocument", function(object, envir=parent.frame(), ...) {
  rCode <- toR(object);
  evaluate(rCode, envir=envir, ...);
}) # evaluate()



##############################################################################
# HISTORY:
# 2013-02-09
# o Created.
##############################################################################
