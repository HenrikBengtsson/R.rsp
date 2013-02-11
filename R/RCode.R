###########################################################################/**
# @RdocClass RCode
#
# @title "The RCode class"
#
# \description{
#  @classhierarchy
#
#  An RCode object is a @character @vector holding R source code.
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
setConstructorS3("RCode", function(code=character(), ...) {
  extend(c(code, ...), "RCode");
})


#########################################################################/**
# @RdocMethod print
#
# @title "Prints the R code"
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
#  Returns nothing.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("print", "RCode", function(x, ...) {
  code <- paste(x, collapse="\n");
  cat(code);
  cat("\n");
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
setMethodS3("parse", "RCode", function(this, ...) {
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
setMethodS3("evaluate", "RCode", function(this, envir=parent.frame(), ...) {
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
