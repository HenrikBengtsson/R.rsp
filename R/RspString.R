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
#   \item{s}{A @character @vector.}
#   \item{attrs}{RSP attributes as a named @list, e.g. \code{type}, 
#      \code{language}, and \code{source}.}
#   \item{...}{Additional named RSP attributes.}
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
setConstructorS3("RspString", function(s=character(), attrs=list(), ...) {
  # Argument 'str':
  str <- paste(s, collapse="\n");


  # Argument 'attrs':
  if (!is.list(attrs)) {
    throw("Argument 'attrs' is not a list: ", mode(attrs)[1L]);
  }

  # Argument '...':
  userAttrs <- list(...);


  this <- extend(str, "RspString");
  this <- setAttributes(this, attrs);
  this <- setAttributes(this, userAttrs);
  this;
})


#########################################################################/**
# @RdocMethod getAttributes
# @aliasmethod getAttribute
#
# @title "Gets the attributes of an RSP document"
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
setMethodS3("getAttributes", "RspString", function(object, private=FALSE, ...) {
  attrs <- attributes(object);
  keys <- names(attrs);
  keys <- setdiff(keys, c("class", "names"));

  # Exclude private attributes?
  if (!private) {
    pattern <- sprintf("^[%s]", paste(c(base::letters, base::LETTERS), collapse=""));
    keys <- keys[regexpr(pattern, keys) != -1L];
  }

  attrs <- attrs[keys];
  attrs;
})

setMethodS3("getAttribute", "RspString", function(object, name, default=NULL, private=TRUE, ...) {
  attrs <- getAttributes(object, private=private, ...);
  if (!is.element(name, names(attrs))) {
    attr <- default;
  } else {
    attr <- attrs[[name]];
  }
  attr;
})

setMethodS3("setAttributes", "RspString", function(object, attrs, ...) {
  # Argument 'attrs':
  if (is.null(attrs)) {
    return(invisible(object));
  }
  if (!is.list(attrs)) {
    throw("Cannot set attributes. Argument 'attrs' is not a list: ", mode(attrs)[1L]);
  }


  # Current attributes
  attrsD <- attributes(object);

  # Update/add new attributes
  keys <- names(attrs);
  keys <- setdiff(keys, c("class", "names"));
  for (key in keys) {
    attrsD[[key]] <- attrs[[key]];
  }

  attributes(object) <- attrsD;

  invisible(object);
})

setMethodS3("setAttribute", "RspString", function(object, name, value, ...) {
  attrs <- list(value);
  names(attrs) <- name;
  setAttributes(object, attrs, ...);
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
  res <- getAttribute(object, "type");
  if (is.null(res) || is.na(res)) res <- as.character(default);
  res <- tolower(res);
  if (as == "IMT" && !is.na(res)) {
    res <- parseInternetMediaType(res);
  }
  res;
}, protected=TRUE)


#########################################################################/**
# @RdocMethod getMetadata
#
# @title "Gets the metadata of the RspDocument"
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
setMethodS3("getMetadata", "RspString", function(object, name=NULL, ...) {
  res <- getAttribute(object, "metadata");
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
  res <- getAttribute(object, "source");
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
