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


#########################################################################/**
# @RdocMethod "asRspString"
#
# @title "Recreates an RSP string from an RspCode"
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
setMethodS3("asRspString", "RspCode", function(code, ...) {
  body <- getCode(code);

  if (getEcho(code)) {
    fmtstr <- ":%s";
  } else {
    fmtstr <- "%s";
  }

  fmtstr <- paste("<%%", fmtstr, "%%>", sep="");
  s <- sprintf(fmtstr, body);
  RspString(s);
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


#########################################################################/**
# @RdocMethod "asRspString"
#
# @title "Recreates an RSP string from an RspCodeChunk"
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
setMethodS3("asRspString", "RspCodeChunk", function(code, ...) {
  body <- getCode(code);

  if (getEcho(code)) {
    fmtstr <- ":%s";
  } else if (getReturn(code)) {
    fmtstr <- "=%s";
  } else {
    fmtstr <- "%s";
  }

  fmtstr <- paste("<%%", fmtstr, "%%>", sep="");
  s <- sprintf(fmtstr, body);
  RspString(s);
})


##############################################################################
# HISTORY:
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################