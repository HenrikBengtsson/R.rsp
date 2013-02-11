setConstructorS3("RspExpression", function(object=character(), ...) {
  extend(object, "RspExpression");
})

setConstructorS3("RspComment", function(str=character(), ...) {
  extend(RspExpression(str), "RspComment");
})

setConstructorS3("RspText", function(text=character(), ...) {
  extend(RspExpression(text), "RspText");
})

setMethodS3("getText", "RspText", function(text, ...) {
  as.character(text);
})

setConstructorS3("RspEqualExpression", function(code=character(), ...) {
  extend(RspExpression(code), "RspEqualExpression");
})

setMethodS3("getCode", "RspEqualExpression", function(code, ...) {
  as.character(code);
})

setConstructorS3("RspCode", function(code=character(), ...) {
  extend(RspExpression(code), "RspCode");
})

setMethodS3("getCode", "RspCode", function(code, ...) {
  as.character(code);
})

setConstructorS3("RspDirective", function(directive=character(), attributes=list(), ...) {
  this <- extend(RspExpression(directive), "RspDirective");
  for (key in names(attributes)) {
    attr(this, key) <- attributes[[key]];
  }
  this;
})

setConstructorS3("RspIncludeDirective", function(attributes=list(), ...) {
  # Argument 'attributes':
  if (!missing(attributes)) {
    keys <- names(attributes);
    if (!any(is.element(c("file"), keys))) {
      throw("Missing attribute 'file' for RSP 'include' directive: ", hpaste(keys));
    }
  }

  extend(RspDirective("include", attributes=attributes, ...), "RspIncludeDirective")
})

setMethodS3("getFile", "RspIncludeDirective", function(directive, ...) {
  attr(directive, "file");
})

setMethodS3("getVerbatim", "RspIncludeDirective", function(directive, ...) {
  res <- attr(directive, "verbatim");
  res <- as.logical(res);
  isTRUE(res);
})


##############################################################################
# HISTORY:
# 2013-02-09
# o Created.
##############################################################################
