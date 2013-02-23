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
setConstructorS3("RspText", function(text=character(), ...) {
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



##############################################################################
# HISTORY:
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
