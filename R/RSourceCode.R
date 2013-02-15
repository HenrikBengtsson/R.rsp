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
#   \item{...}{@character strings.}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
# 
# @author
#
# @keyword internal
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


#########################################################################/**
# @RdocMethod tangle
#
# @title "Drops all text-outputting calls from the R code"
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
#  Returns an @see "RSourceCode" objects.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("tangle", "RSourceCode", function(code, ...) {
  # Remember attributes
  attrs <- attributes(code);

  # Drop all .ro("...")
  excl <- (regexpr(".ro(\"", code, fixed=TRUE) != -1L);
  code <- code[!excl];

  # Replace all .ro({...}) with {...}
  idxs <- grep(".ro(", code, fixed=TRUE);
  code[idxs] <- gsub(".ro(", "", code[idxs], fixed=TRUE);
  code[idxs] <- gsub("[)]$", "", code[idxs], fixed=FALSE);

  # Reset attributes
  attributes(code) <- attrs;

  code;
}, protected=TRUE) # tangle()



##############################################################################
# HISTORY:
# 2013-02-14
# o Added tangle() for RSourceCode.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
