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
#*/###########################################################################
setConstructorS3("RspExpression", function(object=character(), ...) {
  extend(object, "RspExpression");
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
#   \item{...}{Not used.}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
# 
# @author
#*/###########################################################################
setConstructorS3("RspCode", function(code=character(), ...) {
  extend(RspExpression(code), "RspCode");
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
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
# 
# @author
#*/###########################################################################
setConstructorS3("RspCodeChunk", function(...) {
  extend(RspCode(...), "RspCodeChunk");
})



###########################################################################/**
# @RdocClass RspCodeChunkWithReturn
#
# @title "The RspCodeChunkWithReturn class"
#
# \description{
#  @classhierarchy
#
#  An RspCodeChunkWithReturn is an @see "RspCodeChunk", which represents a
#  complete RSP code chunk, and whose value is returned/inserted
#  when evaluated.
# }
# 
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to the constructor of @see "RspCode".}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
# 
# @author
#*/###########################################################################
setConstructorS3("RspCodeChunkWithReturn", function(...) {
  extend(RspCodeChunk(...), "RspCodeChunkWithReturn");
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
#*/###########################################################################
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


##############################################################################
# HISTORY:
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
