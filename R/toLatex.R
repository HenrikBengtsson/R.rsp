###########################################################################/**
# @set class=character
# @RdocMethod toLatex
# @alias toLatex.default
# @alias le
#
# @title "Escapes character strings to become LaTeX compatible"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{object}{A @character @vector of N strings.}
#   \item{...}{Not used.}
# }
#
# \value{
#   A @character @vector of N strings.
# }
#
# @author
#
# \seealso{
#   @see "utils::toLatex" for escaping @see "utils::sessionInfo" objects.
# }
#
# @keyword internal
#*/########################################################################### 
setMethodS3("toLatex", "character", function(object, ...) {
  s <- object
  replace <- c("\\"="\\textbackslash", "{"="\\{", "}"="\\}", 
                "&"="\\&", "%"="\\%", "$"="\\$", "#"="\\#", 
                "_"="\\_", 
                "~"="\\~{}", "^"="\\^{}");  # <== ?
  search <- names(replace)
  for (ii in seq_along(replace)) {
    s <- gsub(search[ii], replace[ii], s, fixed=TRUE)
  } 
  s
}) # toLatex()

# To handle the NULL case
setMethodS3("toLatex", "default", function(object, ...) {
  if (is.null(object)) return("")
  object
}) # toLatex()


le <- function(...) { 
  sapply(c(...), FUN=function(s) {
    gsub("_", "\\_", s, fixed=TRUE)
  })
} # le()
