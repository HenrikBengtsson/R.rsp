###########################################################################/**
# @RdocDefault sourceRsp
#
# @title "Processes an RSP file by translating it to an R servlet, which is then sourced"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to @see "translateRspV1", e.g. \code{file}
#     and \code{path}.}
#   \item{response}{An @see "RspResponse" object to which output is passed.
#     This object can be accessed by the RSP code.}
#   \item{request}{An optional @see "HttpRequest" object describing the
#     request.  If @NULL, one is created refering to the request RSP file.
#     This object can be accessed by the RSP code.}
#   \item{envir}{An @environment to be the working environment of the
#     servlet, i.e. where RSP variables and objects are stored.}
#   \item{verbose}{Either a @logical, a @numeric, or a @see "R.utils::Verbose"
#     object specifying how much verbose/debug information is written to
#     standard output. If a Verbose object, how detailed the information is
#     is specified by the threshold level of the object. If a numeric, the
#     value is used to set the threshold of a new Verbose object. If @TRUE,
#     the threshold is set to -1 (minimal). If @FALSE, no output is written.
#   }
# }
#
# \value{
#   Returns what the \R servlet code returns.
# }
#
# \details{
#   When "sourcing" an RSP file, the RSP code is first translated to an
#   \R servlet, which is plain \R source code.  Then the servlet is sourced,
#   and it in turns outputs the final response, e.g. an HTML document.
# }
#
# \examples{\dontrun{
#  @include "../incl/sourceRsp.Rex"
# }}
#
# @author
#
# \seealso{
#   @see "translateRspV1".
#   @see "sourceAllRsp".
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/###########################################################################
setMethodS3("sourceRsp", "default", function(..., response=FileRspResponse(file=stdout()), request=NULL, envir=parent.frame(), verbose=FALSE) {
  .Defunct(new="rfile(), rcat(), or rstring()")
}, deprecated=TRUE)


##############################################################################
# HISTORY:
# 2006-07-04
# o Now sourceRsp() creates an HttpRequest object internally, if not given.
# 2005-09-24
# o Added argument 'request'.
# 2005-08-01
# o Added Rdoc comments.
# o Added more argument validation.
# 2005-07-31
# o Created.
##############################################################################
