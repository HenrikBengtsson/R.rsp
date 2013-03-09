###########################################################################/**
# @RdocClass RspText
#
# @title "The RspText class"
#
# \description{
#  @classhierarchy
#
#  An RspText is an @see "RspConstruct" that represents a plain text
#  section, i.e. everything that is inbetween any other types of
#  @see "RspConstruct":s.
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
setConstructorS3("RspText", function(text=character(), escape=FALSE, ...) {
  if (escape) {
    text <- gsub("<%", "<|%", text, fixed=TRUE);
    text <- gsub("%>", "%|>", text, fixed=TRUE);
  }
  extend(RspConstruct(text), "RspText");
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
#   \item{unescaped}{If @TRUE, then escaped RSP start and end tags are 
#      unescaped.}
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
setMethodS3("getText", "RspText", function(text, unescape=FALSE, ...) {
  text <- as.character(text);

  # Unenscape?
  if (unescape) {
    text <- gsub("<|%", "<%", text, fixed=TRUE);
    text <- gsub("%|>", "%>", text, fixed=TRUE);
  }

  text;
})


#########################################################################/**
# @RdocMethod "asRspString"
#
# @title "Recreates an RSP string from an RspText"
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
setMethodS3("asRspString", "RspText", function(text, ...) {
  RspString(getText(text));
})


##############################################################################
# HISTORY:
# 2013-03-08
# o Added argument 'escaped' to getText() for RspText.
# o Now asRspString() returns escaped RSP texts.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
