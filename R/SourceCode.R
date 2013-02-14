###########################################################################/**
# @RdocClass SourceCode
#
# @title "The SourceCode class"
#
# \description{
#  @classhierarchy
#
#  An SourceCode object is a @character @vector holding source code for
#  a particular programming language.
# }
# 
# @synopsis
#
# \arguments{
#   \item{code, ...}{@character strings.}
#   \item{type}{The content type of the source code.}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
# 
# @author
#*/###########################################################################
setConstructorS3("SourceCode", function(code=character(), ..., type=NA) {
  this <- extend(c(code, ...), "SourceCode");
  attr(this, "type") <- as.character(type);
  this;
})


#########################################################################/**
# @RdocMethod getType
#
# @title "Gets the type of the SourceCode"
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
#  Returns a @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getType", "SourceCode", function(object, ...) {
  res <- attr(object, "type");
  if (is.null(res)) res <- as.character(NA);
  res;
}, protected=TRUE)



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
setMethodS3("print", "SourceCode", function(x, ...) {
  code <- paste(x, collapse="\n");
  cat(code);
  cat("\n");
})


#########################################################################/**
# @RdocMethod parse
#
# @title "Parses the source code"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Optional arguments passed to language parse.}
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
setMethodS3("parse", "SourceCode", abstract=TRUE);


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
setMethodS3("evaluate", "SourceCode", abstract=TRUE);



##############################################################################
# HISTORY:
# 2013-02-13
# o Added getType() for SourceCode.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
