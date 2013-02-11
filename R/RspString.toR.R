#########################################################################/**
# @set "class=RspString"
# @RdocMethod toR
#
# @title "Parses and translates the RSP string into R code"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns the code as an @see "SourceCode".
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("toR", "RspString", function(object, ...) {
  expr <- parse(object);
  toR(expr, ...);
}, protected=TRUE) # toR()



#########################################################################/**
# @RdocMethod evaluate
#
# @title "Parses, translates, and evaluates the RSP string"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{envir}{The @environment where the RSP string is evaluated.}
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
setMethodS3("evaluate", "RspString", function(object, envir=parent.frame(), ...) {
  rCode <- toR(object, ...);
  # TO FIX!!!
  evaluate(rCode, envir=envir, ...);
}) # evaluate()



##############################################################################
# HISTORY:
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
