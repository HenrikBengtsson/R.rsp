###########################################################################/**
# @RdocDefault rsptex
#
# @title "Compiles an RSP LaTeX file into a DVI file"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to @see "compileRsp0".}
#   \item{pdf}{If @TRUE, a PDF is generated, otherwise a DVI file.}
#   \item{force}{If @TRUE, file timestamps are ignored.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns the pathname to the generated document.
# }
#
# \section{Retrieving intermediate and final results}{
#   By default, the RSP document is processed in a local environment,
#   which is discarded afterward.  This can be avoided by explicitly
#   specifying the processing environment, e.g.
#   \code{env <- new.env(); rsptex(..., envir=env)}.
#   Afterward you can query its content by, say, \code{ll(envir=env)}
#   or attach its content by \code{attachLocally(env)}.
# }
#
# \examples{\dontrun{
#   @include "../incl/rsptex.Rex"
# }}
#
# @author
#
# \seealso{
#   The generated TeX document is compiled by @see "tools::texi2dvi" in
#   the \pkg{tools} package.
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/###########################################################################
setMethodS3("rsptex", "default", function(..., pdf=TRUE, force=FALSE, verbose=FALSE) {
  .Defunct(new="rfile()")
}, deprecated=TRUE, private=TRUE) # rsptex()


############################################################################
# HISTORY:
# 2013-03-31
# o BUG FIX: rsptex() would return a non-existing pathname (it assumed
#   the generated PDF/DVI file is in the source directory while it really
#   is in the current working directory).
# 2013-03-29
# o Renamed to compileRsp0().
# 2011-03-08
# o Now rsptex() trims white space of RSP blocks so that RSP blocks will
#   not add additional newlines.  This is done via the new 'trimRsp'
#   argument of compileRsp() et al.
# 2011-02-20
# o Now argument 'pdf' of rsptex() default to TRUE.
# o Added an example(rsptex).
# 2011-02-13
# o Added a section to help(rsptex) explaining in what environment the
#   RSP document is evaluated and how to retrieve it and its content.
# 2009-02-23
# o Created.
############################################################################
