###########################################################################/**
# @RdocClass RspExpression
#
# @title "The RspExpression class"
#
# \description{
#  @classhierarchy
#
#  An RspExpression is an @see RspConstruct of format \code{<\% ... \%>}.
# }
#
# @synopsis
#
# \arguments{
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
setConstructorS3("RspExpression", function(...) {
  extend(RspConstruct(...), "RspExpression")
})


###########################################################################/**
# @RdocClass RspUnparsedExpression
#
# @title "The RspUnparsedExpression class"
#
# \description{
#  @classhierarchy
#
#  An RspUnparsedExpression is an @see RspExpression that still has not
#  been parsed for its class and content.  After @see "parse":ing such
#  an object, the class of this RSP expression will be known.
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to @see "RspExpression".}
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
setConstructorS3("RspUnparsedExpression", function(...) {
  extend(RspExpression(...), "RspUnparsedExpression")
})


#########################################################################/**
# @RdocMethod parseExpression
#
# @title "Parses the unknown RSP expression for its class"
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
#  Returns an @see "RspExpression" of known class.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("parseExpression", "RspUnparsedExpression", function(expr, ...) {
  suffixSpecs <- attr(expr, "suffixSpecs")
  body <- expr

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RSP Scripting Elements and Variables
  #
  # <%=[expression]%>
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  pattern <- "^=(.*)$"
  if (regexpr(pattern, body) != -1L) {
    code <- gsub(pattern, "\\1", body)
    code <- trim(code)
    res <- RspCodeChunk(code, return=TRUE)
    attr(res, "suffixSpecs") <- suffixSpecs
    return(res)
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RSP Scripting Elements and Variables
  #
  # <%:[expression]%>
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  pattern <- "^:(|[ \t\v]*(\n|\r|\r\n))(.*)$"
  if (regexpr(pattern, body) != -1L) {
    code <- gsub(pattern, "\\3", body)
    res <- RspCode(code, echo=TRUE)
    attr(res, "suffixSpecs") <- suffixSpecs
    return(res)
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RSP Scripting Elements and Variables
  #
  # <% [expressions] %>
  #
  # This applies to anything not recognized above.
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  res <- RspCode(trim(body))
  attr(res, "suffixSpecs") <- suffixSpecs
  res
})
