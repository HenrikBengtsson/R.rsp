###########################################################################/**
# @RdocClass RspExpression
#
# @title "The RspExpression class"
#
# \description{
#  @classhierarchy
#
#  An RspExpression object represents an RSP expression, which can either
#  be a plain text section or an RSP section.
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
setConstructorS3("RspExpression", function(object=character(), ...) {
  extend(object, "RspExpression");
})


#########################################################################/**
# @RdocMethod getAttributes
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
setMethodS3("getAttributes", "RspExpression", function(directive, ...) {
  attrs <- attributes(directive);
  keys <- names(attrs);
  keys <- setdiff(keys, "class");
  attrs <- attrs[keys];
  attrs;
})
 
 


###########################################################################/**
# @RdocClass RspComment
#
# @title "The RspComment class"
#
# \description{
#  @classhierarchy
#
#  An RspComment is an @see "RspExpression" that represents an RSP comment.
# }
# 
# @synopsis
#
# \arguments{
#   \item{str}{A @character string.}
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
setConstructorS3("RspComment", function(str=character(), ...) {
  extend(RspExpression(str), "RspComment");
})



###########################################################################/**
# @RdocClass RspText
#
# @title "The RspText class"
#
# \description{
#  @classhierarchy
#
#  An RspText is an @see "RspExpression" that represents an 
#  plain text section.
#  Its content is independent of the underlying programming language.
# }
# 
# @synopsis
#
# \arguments{
#   \item{text}{A @character string.}
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
setConstructorS3("RspText", function(text=character(), ...) {
  extend(RspExpression(text), "RspText");
})


#########################################################################/**
# @RdocMethod getText
#
# @title "Gets the text"
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
setMethodS3("getText", "RspText", function(text, ...) {
  as.character(text);
})



###########################################################################/**
# @RdocClass RspCode
#
# @title "The RspCode class"
#
# \description{
#  @classhierarchy
#
#  An RspCode is an @see "RspExpression" that represents a piece of source
#  code, which may or may not be a complete code chunk (expression).
# }
# 
# @synopsis
#
# \arguments{
#   \item{code}{A @character string.}
#   \item{echo}{If @TRUE, code is echoed to the output.}
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
setConstructorS3("RspCode", function(code=character(), echo=FALSE, ...) {
  # Replace all '\r\n' and '\r' with '\n' newlines
  code <- gsub("\r\n", "\n", code);
  code <- gsub("\r", "\n", code);

  this <- extend(RspExpression(code), "RspCode");
  attr(this, "echo") <- echo;
  this;
})


#########################################################################/**
# @RdocMethod getCode
#
# @title "Gets the source code"
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
setMethodS3("getCode", "RspCode", function(code, ...) {
  as.character(code);
})


#########################################################################/**
# @RdocMethod getEcho
#
# @title "Checks whether the source code should be echoed or not"
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
#  Returns a @logical.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getEcho", "RspCode", function(code, ...) {
  isTRUE(attr(code, "echo"));
})



###########################################################################/**
# @RdocClass RspCodeChunk
#
# @title "The RspCodeChunk class"
#
# \description{
#  @classhierarchy
#
#  An RspCodeChunk is an @see "RspCode" that represents a complete
#  RSP code chunk.
# }
# 
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to the constructor of @see "RspCode".}
#   \item{return}{If @TRUE, the value of the evaluated code chunk is returned.}
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
setConstructorS3("RspCodeChunk", function(..., return=FALSE) {
  this <- extend(RspCode(...), "RspCodeChunk");
  attr(this, "return") <- return;
  this;
})


#########################################################################/**
# @RdocMethod getReturn
#
# @title "Checks whether the value of the evaluated code chunk should be returned or not"
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
#  Returns a @logical.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getReturn", "RspCodeChunk", function(code, ...) {
  isTRUE(attr(code, "return"));
})



###########################################################################/**
# @RdocClass RspDirective
#
# @title "The abstract RspDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspDirective is an @see "RspExpression" that represents a directive
#  to the RSP parser.
#  The directive is independent of the underlying programming language.
# }
# 
# @synopsis
#
# \arguments{
#   \item{directive}{A @character string.}
#   \item{attributes}{A named @list.}
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
setConstructorS3("RspDirective", function(directive=character(), attributes=list(), ...) {
  this <- extend(RspExpression(directive), "RspDirective");
  for (key in names(attributes)) {
    attr(this, key) <- attributes[[key]];
  }
  this;
})



###########################################################################/**
# @RdocClass RspIncludeDirective
#
# @title "The RspIncludeDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspIncludeDirective is an @see "RspDirective" that causes the
#  RSP parser to include (and parse) an external RSP file.
# }
# 
# @synopsis
#
# \arguments{
#   \item{attributes}{A named @list, which must contain a 'file' element.}
#   \item{...}{Optional arguments passed to the constructor 
#              of @see "RspDirective".}
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
setConstructorS3("RspIncludeDirective", function(attributes=list(), ...) {
  # Argument 'attributes':
  if (!missing(attributes)) {
    keys <- names(attributes);
    if (!any(is.element(c("file"), keys))) {
      throw("Missing attribute 'file' for the RSP 'include' directive: ", hpaste(keys));
    }
  }

  extend(RspDirective("include", attributes=attributes, ...), "RspIncludeDirective")
})



#########################################################################/**
# @RdocMethod getFile
#
# @title "Gets the file attribute"
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
setMethodS3("getFile", "RspIncludeDirective", function(directive, ...) {
  attr(directive, "file");
})



###########################################################################/**
# @RdocClass RspDefineDirective
#
# @title "The RspDefineDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspDefineDirective is an @see "RspDirective" that causes the
#  RSP parser to assign the value of an attribute to an R object of
#  the same name as the attribute at the time of parsing.
# }
# 
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to the constructor of @see "RspDirective".}
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
setConstructorS3("RspDefineDirective", function(...) {
  extend(RspDirective("define", ...), "RspDefineDirective")
})




###########################################################################/**
# @RdocClass RspEvalDirective
#
# @title "The RspEvalDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspEvalDirective is an @see "RspDirective" that causes the
#  RSP parser to evaluate a piece of R code (either in a text string
#  or in a file) as it is being parsed.
# }
# 
# @synopsis
#
# \arguments{
#   \item{attributes}{A named @list, which must contain a 'file' 
#      or a 'text' element.}
#   \item{...}{Optional arguments passed to the constructor 
#              of @see "RspDirective".}
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
setConstructorS3("RspEvalDirective", function(attributes=list(), ...) {
  # Argument 'attributes':
  if (!missing(attributes)) {
    keys <- names(attributes);
    if (!any(is.element(c("file", "text"), keys))) {
      throw("Either attribute 'file' or 'text' for the RSP 'eval' directive must be given: ", hpaste(keys));
    }

    # Default programming language is "R".
    if (is.null(attributes$language)) attributes$language <- "R";
  }

  extend(RspDirective("eval", attributes=attributes, ...), "RspEvalDirective")
})


#########################################################################/**
# @RdocMethod getFile
#
# @title "Gets the file attribute"
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
setMethodS3("getFile", "RspEvalDirective", function(directive, ...) {
  attr(directive, "file");
})


#########################################################################/**
# @RdocMethod getText
#
# @title "Gets the text"
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
setMethodS3("getText", "RspEvalDirective", function(directive, ...) {
  attr(directive, "text");
})

#########################################################################/**
# @RdocMethod getLanguage
#
# @title "Gets the programming language"
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
setMethodS3("getLanguage", "RspEvalDirective", function(directive, ...) {
  res <- attr(directive, "language");
  if (is.null(res)) res <- as.character(NA);
  res;
})


###########################################################################/**
# @RdocClass RspPageDirective
#
# @title "The RspPageDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspPageDirective is an @see "RspDirective" that annotates the
#  content of the RSP document, e.g. the content type.
# }
# 
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to the constructor of @see "RspDirective".}
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
setConstructorS3("RspPageDirective", function(...) {
  extend(RspDirective("page", ...), "RspPageDirective")
})


#########################################################################/**
# @RdocMethod getType
#
# @title "Gets the content type"
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
setMethodS3("getType", "RspPageDirective", function(directive, ...) {
  res <- attr(directive, "type");
  if (is.null(res)) res <- as.character(NA);
  res;
})


setConstructorS3("RspIfeqDirective", function(...) {
  extend(RspDirective("ifeq", ...), "RspIfeqDirective")
})

setConstructorS3("RspEndifDirective", function(...) {
  extend(RspDirective("endif", ...), "RspEndifDirective")
})


##############################################################################
# HISTORY:
# 2013-02-13
# o Added RspPageDirective.
# o Added 'language' attribute to RspEvalDirective.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
