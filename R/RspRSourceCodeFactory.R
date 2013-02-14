###########################################################################/**
# @RdocClass RspRSourceCodeFactory
#
# @title "The RspRSourceCodeFactory class"
#
# \description{
#  @classhierarchy
#
#  An RspRSourceCodeFactory is an @see "RspSourceCodeFactory" for 
#  the R language.
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
#*/###########################################################################
setConstructorS3("RspRSourceCodeFactory", function(...) {
  extend(RspSourceCodeFactory("R"), "RspRSourceCodeFactory");
})



#########################################################################/**
# @RdocMethod exprToCode
#
# @title "Translates an RspExpression into R source code"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{expr}{An @see "RspExpression".}
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns a @character @vector.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("exprToCode", "RspRSourceCodeFactory", function(object, expr, ..., index=NA) {
  # Load the package (super quietly), in case R.rsp::nnn() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local function
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  escapeRspText <- function(text) {
    text <- deparse(text);
    text <- substring(text, first=2L, last=nchar(text)-1L);
    text;
  } # escapeRspText()


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'expr':
  expr <- Arguments$getInstanceOf(expr, "RspExpression");


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RspText => .ro("<text>")
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (inherits(expr, "RspText")) {
    text <- getText(expr);
    if (nchar(text) == 0L) {
      return("");
    }

    code <- NULL;
    while (nchar(text) > 0L) {
      textT <- substring(text, first=1L, last=1024L);
      textT <- escapeRspText(textT);
      codeT <- sprintf(".ro(\"%s\")", textT);
      code <- c(code, codeT);
      text <- substring(text, first=1025L);
    }

    return(code);
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RspCodeChunk => .ro({<expr>})
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (inherits(expr, "RspCodeChunk")) {
    codeT <- getCode(expr);
    code <- sprintf("{%s}", trim(codeT));

    # Validate code chunk
    tryCatch({
      base::parse(text=code);
    }, error = function(ex) {
      throw(sprintf("RSP code chunk (#%d) does not contain a complete R expression: %s", index, ex));
    });

    echo <- getEcho(expr);
    if (echo) {
      codeE <- sprintf(".ro(\"%s\")", escapeRspText(codeT));
    }

    ret <- getReturn(expr);
    if (echo && !ret) {
      code <- c(codeE, code);
    } else if (echo && ret) {
      codeT <- sprintf(".rtmp <- %s", code);
      code <- c(codeE, code, ".ro(.rtmp)", "rm(list=\".rtmp\")");
    } else if (!echo && ret) {
      code <- sprintf(".ro(%s)", code);
    } else {
    }

    return(code);
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RspCode => <code>
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (inherits(expr, "RspCode")) {
    code <- getCode(expr);
    echo <- getEcho(expr);
    if (echo) {
      codeE <- sprintf(".ro(\"%s\")", escapeRspText(code));
      code <- c(codeE, code);
    }
    return(code);
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RspComment => [void]
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (inherits(expr, "RspComment")) {
    return("");
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RspDirective?
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (inherits(expr, "RspDirective")) {
    throw(sprintf("Detected an %s (#%d). It appears that the %s was not preprocessed.", index, class(expr)[1L], class(object)[1L]));
  }

  throw(sprintf("Unknown class of RSP expression (#%d): %s", index, class(expr)[1L]));
}, protected=TRUE) # exprToCode()



##############################################################################
# HISTORY:
# 2013-02-13
# o CLEANUP: RspDirective:s are now handles by preprocess() for RspDocument
#   and are independent of programming language, except RspEvalDirective
#   which by design can evaluate code of different languages, but currently
#   only R is supported.
# 2013-02-12
# o Added preprocessing directives RspDefineDirective and RspEvalDirective.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-10
# o Created.
##############################################################################
