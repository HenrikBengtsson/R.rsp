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
#   \item{value}{A @character string.}
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
setConstructorS3("RspDefineDirective", function(value="define", ...) {
  extend(RspDirective(value, ...), "RspDefineDirective")
})


##############################################################################
# HISTORY:
# 2013-03-17
# o Deprecated the RspDefineDirective.
##############################################################################
