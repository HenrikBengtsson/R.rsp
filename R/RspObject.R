###########################################################################/**
# @RdocClass RspObject
#
# @title "The abstract RspObject class"
#
# \description{
#  @classhierarchy
#
#  An RspObject represents an instance a specific RSP class.
# }
#
# @synopsis
#
# \arguments{
#   \item{value}{An R object.}
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
setConstructorS3("RspObject", function(value=NA, attrs=list(), ...) {
  # Argument 'attrs':
  if (!is.list(attrs)) {
    throw("Argument 'attrs' is not a list: ", mode(attrs)[1L]);
  }

  # Argument '...':
  userAttrs <- list(...);


  this <- extend(value, "RspObject");
  this <- setAttributes(this, attrs);
  this <- setAttributes(this, userAttrs);
  this;
})



#########################################################################/**
# @RdocMethod print
# @alias print.RspDocument
# @alias print.RspFileProduct
# @alias print.RspProduct
# @alias print.RspSourceCode
# @alias print.RspString
# @alias print.RspStringProduct
#
# @title "Prints a summary of an RSP object"
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
setMethodS3("print", "RspObject", function(x, ...) {
  s <- NextMethod("print");
  s <- c(sprintf("%s:", class(x)[1L]), s);
  s <- paste(s, collapse="\n");
  cat(s, "\n", sep="");
}, protected=TRUE)



#########################################################################/**
# @RdocMethod getAttributes
# @aliasmethod getAttribute
# @aliasmethod hasAttribute
# @aliasmethod setAttributes
# @aliasmethod setAttribute
#
# @title "Gets the attributes of an RSP object"
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
setMethodS3("getAttributes", "RspObject", function(object, private=FALSE, ...) {
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

setMethodS3("getAttribute", "RspObject", function(object, name, default=NULL, private=TRUE, ...) {
  attrs <- getAttributes(object, private=private, ...);
  if (!is.element(name, names(attrs))) {
    attr <- default;
  } else {
    attr <- attrs[[name]];
  }
  attr;
})

setMethodS3("hasAttribute", "RspObject", function(object, name, private=TRUE, ...) {
  attrs <- getAttributes(object, private=private, ...);
  is.element(name, names(attrs));
})

setMethodS3("setAttributes", "RspObject", function(object, attrs, ...) {
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

setMethodS3("setAttribute", "RspObject", function(object, name, value, ...) {
  attrs <- list(value);
  names(attrs) <- name;
  setAttributes(object, attrs, ...);
})



##############################################################################
# HISTORY:
# o Created from RspString.R.
##############################################################################
