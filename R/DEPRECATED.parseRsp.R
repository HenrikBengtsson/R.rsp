###########################################################################/**
# @RdocDefault parseRsp
#
# @title "Parse an RSP code string to an R RSP code string"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{rspCode}{A @character @vector of RSP code to parsed.}
#   \item{rspLanguage}{An @see "RspLanguage" object.}
#   \item{trimRsp}{If @TRUE, white space is trimmed from RSP blocks.}
#   \item{validate}{If @TRUE, the parsed RSP code is validated through the
#     \R parser.}
#   \item{verbose}{Either a @logical, a @numeric, or a @see "R.utils::Verbose"
#     object specifying how much verbose/debug information is written to
#     standard output. If a Verbose object, how detailed the information is
#     is specified by the threshold level of the object. If a numeric, the
#     value is used to set the threshold of a new Verbose object. If @TRUE,
#     the threshold is set to -1 (minimal). If @FALSE, no output is written.
#     [Currently not used.]
#   }
#   \item{...}{Not used.}
# }
#
# \value{
#   Returns a @character string of \R source code.
# }
#
# @author
#
# \seealso{
#   @see "sourceRsp".
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/###########################################################################
setMethodS3("parseRsp", "default", function(rspCode, rspLanguage=getOption("rspLanguage"), trimRsp=TRUE, validate=TRUE, verbose=FALSE, ...) {
  .Defunct(new="rcompile()")
}, deprecated=TRUE)

##############################################################################
# HISTORY:
# 2011-11-14
# o ROBUSTNESS: Now <%=[expr]%> is translated with curly brackets around
#   the expression, i.e. write(response, {[expr]}).  This allows for
#   writing <%= x <- 1; x^2 %> instead of <%={ x <- 1; x^2 }%>.
# 2011-11-07
# o BUG FIX: <@fcn foo="bar"> for "fallback" directives would try to call
#   fcn(foo=bar) instead of fcn(foo="bar").
# o CLEANUP: Now translating to evalCapture() instead of evalWithEcho().
# o BUG FIX: One of the tags would generate invalid evalWithEcho() code.
# 2011-04-12
# o Change the preprocess directives to have format <%#insert ...%>.
# 2011-04-01
# o Added support for <%insert path="<path>" pattern="<pattern>"%>.
# o Added support for <%insert file="<filename>" path="<path>"%>.
# o Added support for <%insert file="<pathname>"%>.
# o Added internal processRspInserts().
# 2011-03-30
# o Now parseRsp() drops RSP comments, i.e. '<%-- {anything} --%>'.
# o Added internal dropRspComments() for dropping '<%-- {anything} --%>'.
# 2011-03-15
# o Added RSP markup <%;{R code}%> for evaluating and echoing code.
# 2011-03-12
# o Now the trimming of RSP handles all newline types, i.e. LF, CR+LF, CR.
# 2011-03-08
# o Added argument 'trimRsp' to parseRsp() for trimming white space
#   surrounding RSP blocks that have preceeding and succeeding white space
#   and that are followed by a newline.
# 2011-02-13
# o BUG FIX: parseRsp() would generate invalid R code/R comments for
#   multiline <%=...%> statements.
# 2009-02-23
# o Now parseRsp() does the validation of the R code.
# o Renamed translateRsp() to parseRsp().
# 2007-04-07
# o Replace regexpr pattern "^[ \]*=[ \]*" with "^[ \]*=[ \]*".
# 2006-07-20
# o BUG FIX: An RSP comment tag would also replicate last text or R code.
# 2006-07-17
# o BUG FIX: translateRsp("\\\n") would convert to "\\n".  Update internal
#   escapeRspText().  Thanks Peter Dalgaard for the suggestions.
# 2006-07-05
# o BUG FIX: If argument 'path' was NULL, translateRsp() gave an error.
# 2006-07-04
# o Now translateRsp() returns attribute 'pathname' too.  Used by sourceRsp().
# o The assigned 'out' object is obsolete.  Instead there should be an
#   RspResponse object.
# 2006-01-14 (Julien Gagneur)
# o BUG FIX: Changed value of variable MAGIC.STRING, the former was not
#   compatible with gsub under some locales. /JG
# 2005-08-15
# o Now all output is written as GString:s; updated the RspResponse class.
# o Now static text '<\%' is outputted as '<%'.
# o Now the 'out' (connection or filename) is available in the servlet code.
# o Replaced tag '<%#' with '<%:'.
# o Added support for page directive 'import'.
# 2005-08-13
# o BUG FIX: Forgot to add newline after translating a scripting element.
# o Updated escapeRspText() too escape all ASCII characters from 1 to 31 (not
#   zero though).  It also escapes the double quote character where needed.
# 2005-08-01
# o Replace importRsp() with import(response, ...).
# o Added Rdoc comments.
# 2005-07-31
# o Recreated again. Before the RSP code was translated to an output document
#   immediately, but now an intermediate R code is created.  That is, when
#   before the process was RSP -> HTML, it is now RSP -> R -> HTML.  This
#   makes it possible to create much richer RSP documents. Specifically, it
#   is possible to write R code statements spanning more than one RSP tag.
# 2005-07-29
# o Recreated from previous RspEngine class in the R.io package, which was
#   first written in May 2002. See source of old R.io package for details.
##############################################################################
