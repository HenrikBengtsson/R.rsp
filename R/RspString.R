###########################################################################/**
# @RdocClass RspString
#
# @title "The RspString class"
#
# \description{
#  @classhierarchy
#
#  An RspString is a @character @vector with RSP markup.
# }
# 
# @synopsis
#
# \arguments{
#   \item{str, ...}{@character strings.}
#   \item{type}{The content type of the RSP string.}
#   \item{source}{A reference to the source RSP document, iff any.}
#   \item{annotations}{A named @list of other content annotations.}
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
setConstructorS3("RspString", function(str=character(), ..., type=NA, source=NA,  annotations=list()) {
  # Argument 'str':
  str <- paste(c(str, ...), collapse="\n");

  # Argument 'source':
  if (is.character(source)) {
    if (isUrl(source)) {
    } else {
      source <- getAbsolutePath(source);
    }
  }

  this <- extend(str, "RspString");
  attr(this, "type") <- as.character(type);
  attr(this, "source") <- source;
  attr(this, "annotations") <- annotations;
  this;
})


#########################################################################/**
# @RdocMethod getType
#
# @title "Gets the type of an RSP string"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{default}{If unknown/not set, the default content type to return.}
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
setMethodS3("getType", "RspString", function(object, default=NA, as=c("text", "IMT"), ...) {
  as <- match.arg(as);
  res <- attr(object, "type");
  if (is.null(res) || is.na(res)) res <- as.character(default);
  res <- tolower(res);
  if (as == "IMT" && !is.na(res)) {
    res <- parseInternetMediaType(res);
  }
  res;
}, protected=TRUE)


#########################################################################/**
# @RdocMethod getAnnotations
#
# @title "Gets the annotations of the RspDocument"
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
setMethodS3("getAnnotations", "RspString", function(object, name=NULL, ...) {
  res <- attr(object, "annotations");
  if (is.null(res)) res <- list();
  if (!is.null(name)) {
    res <- res[[name]];
  }
  res;
}, protected=TRUE)


#########################################################################/**
# @RdocMethod getSource
#
# @title "Gets the source reference of an RSP string"
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
setMethodS3("getSource", "RspString", function(object, ...) {
  res <- attr(object, "source");
  if (is.null(res)) res <- as.character(NA);
  res;
}, protected=TRUE)




#########################################################################/**
# @RdocMethod parse
#
# @title "Parses the RSP string"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Additional arguments passed to the RSP parser.}
#   \item{envir}{The @environment where the RSP document is parsed.}
#   \item{parser}{An @see "RspParser".}
# }
#
# \value{
#  Returns a @see "RspDocument" (unless \code{until != "*"} in case it
#  returns a deparsed @see "RspString".)
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("parse", "RspString", function(object, ..., envir=parent.frame(), parser=RspParser()) {
  # Load the package (super quietly), in case R.rsp::nnn() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");

  # Argument 'parser':
  parser <- Arguments$getInstanceOf(parser, "RspParser");

  parse(parser, object, ..., envir=envir);
}, protected=TRUE) # parse()



##############################################################################
# HISTORY:
# 2013-03-09
# o Moved all parsing code to the new RspParser class.
# 2013-03-07
# o Added annotation attributes to RspString and RspDocument.
# 2013-02-13
# o Added getType() for RspString.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
