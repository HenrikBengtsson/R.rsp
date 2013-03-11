###########################################################################/**
# @RdocClass RspConstruct
#
# @title "The RspConstruct class"
#
# \description{
#  @classhierarchy
#
#  An RspConstruct object represents an RSP construct, which can either be
#  (i) an RSP text (a plain text section), (ii) an RSP comment,
#  (iii) an RSP preprocessing directive, or (iv) an RSP expression.
# }
# 
# @synopsis
#
# \arguments{
#   \item{object}{A R object.}
#   \item{...}{Not used.}
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
setConstructorS3("RspConstruct", function(object=character(), ...) {
  extend(object, "RspConstruct");
})


#########################################################################/**
# @RdocMethod getAttributes
# @aliasmethod getAttribute
#
# @title "Gets the attributes of an RSP expression"
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
#  Returns a named @list.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getAttributes", "RspConstruct", function(directive, ...) {
  attrs <- attributes(directive);
  keys <- names(attrs);
  keys <- setdiff(keys, "class");
  attrs <- attrs[keys];
  attrs;
})

setMethodS3("getAttribute", "RspConstruct", function(directive, name, default=NULL, ...) {
  attrs <- getAttributes(directive, ...);
  if (!is.element(name, names(attrs))) {
    attr <- default;
  } else {
    attr <- attrs[[name]];
  }
  attr;
})
 
 
#########################################################################/**
# @RdocMethod getSuffixSpecs
#
# @title "Gets the suffix specifications"
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
#  Returns a trimmed @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getSuffixSpecs", "RspConstruct", function(object, ...) {
  specs <- attr(object, "suffixSpecs");
  if (is.null(specs)) return(NULL);
##  specs <- gsub("^\\[[ \t\v]*", "", specs);
##  specs <- gsub("[ \t\v]*\\]$", "", specs);
  specs;
})



#########################################################################/**
# @RdocMethod "asRspString"
#
# @title "Recreates an RSP string from an RspConstruct"
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
#  Returns an @see "RspString".
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("asRspString", "RspConstruct", function(object, ...) {
  throw(sprintf("Do not know how to construct an RSP string from %s: %s", class(object)[1L], capture.output(str(object))));
})



##############################################################################
# HISTORY:
# 2013-02-22
# o Added RspUnparsedExpression.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
