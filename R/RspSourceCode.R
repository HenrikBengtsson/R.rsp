###########################################################################/**
# @RdocClass RspSourceCode
#
# @title "The RspSourceCode class"
#
# \description{
#  @classhierarchy
#
#  An RspSourceCode object is a @character @vector holding RSP generated
#  source code for a particular programming language.
# }
# 
# @synopsis
#
# \arguments{
#   \item{code}{@character @vector.}
#   \item{...}{Additional arguments passed to the @see "RspProduct" 
#     constructor.}
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
setConstructorS3("RspSourceCode", function(code=character(), ...) {
  extend(RspProduct(code, ...), "RspSourceCode");
})



#########################################################################/**
# @RdocMethod print
#
# @title "Prints the source code"
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
setMethodS3("print", "RspSourceCode", function(x, ...) {
  code <- paste(x, collapse="\n");
  cat(code);
  cat("\n");
})


#########################################################################/**
# @RdocMethod evaluate
#
# @title "Parses and evaluates the source code"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
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
setMethodS3("evaluate", "RspSourceCode", abstract=TRUE);



#########################################################################/**
# @RdocMethod tangle
#
# @title "Drops all text-outputting calls from the source code"
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
#  Returns a @see "RspSourceCode" objects.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("tangle", "RspSourceCode", abstract=TRUE);



##############################################################################
# HISTORY:
# 2013-02-16
# o Now RspSourceCode extends RspProduct,
# o Renamed SourceCode to RspSourceCode.
# 2013-02-14
# o Added tangle() for SourceCode.
# 2013-02-13
# o Added getType() for SourceCode.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
