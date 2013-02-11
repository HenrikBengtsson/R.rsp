###########################################################################/**
# @RdocClass RSourceCode
#
# @title "The RSourceCode class"
#
# \description{
#  @classhierarchy
#
#  An RSourceCode object is a @character @vector holding R source code.
# }
# 
# @synopsis
#
# \arguments{
#   \item{code, ...}{@character strings.}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
# 
# @author
#*/###########################################################################
setConstructorS3("RSourceCode", function(...) {
  extend(SourceCode(...), "RSourceCode");
})



#########################################################################/**
# @RdocMethod parse
#
# @title "Parses the R code"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Optional arguments passed to @see "base::parse".}
# }
#
# \value{
#  Returns an @expression.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("parse", "RSourceCode", function(this, ...) {
  code <- paste(this, collapse="\n");
  base::parse(text=code, ...);
})


#########################################################################/**
# @RdocMethod evaluate
#
# @title "Parses and evaluates the R code"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{envir}{The @environment where the RSP string is evaluated.}
#   \item{...}{Optional arguments passed to @seemethod "parse".}
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
setMethodS3("evaluate", "RSourceCode", function(this, envir=parent.frame(), ...) {
  expr <- parse(this, ...);
  eval(expr, envir=envir);
})


##############################################################################
# HISTORY:
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
