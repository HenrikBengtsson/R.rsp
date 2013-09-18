###########################################################################/**
# @RdocClass RspRSourceCode
#
# @title "The RspRSourceCode class"
#
# \description{
#  @classhierarchy
#
#  An RspRSourceCode object is an @see "RspSourceCode" holding R source code.
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{@character strings.}
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
setConstructorS3("RspRSourceCode", function(...) {
  extend(RspSourceCode(...), "RspRSourceCode");
})



#########################################################################/**
# @RdocMethod parse
#
# @title "Parses the R code"
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
#  Returns an @expression.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("parse", "RspRSourceCode", function(object, ...) {
  # Get the source code
  code <- as.character(object);

  # Write R code?
  pathname <- getOption("R.rsp/debug/writeCode", NULL);
  if (!is.null(pathname)) {
    if (regexpr("%s", pathname, fixed=TRUE) != -1) {
      require("digest") || throw("Package not loaded: digest");
      pathname <- sprintf(pathname, digest(code));
    }
    pathname <- Arguments$getWritablePathname(pathname, mustNotExist=FALSE);
    writeLines(code, con=pathname);
##    verbose && cat(verbose, "R source code written to file: ", pathname);
  }

  # Parse R source code
  expr <- base::parse(text=code);

  expr;
}, createGeneric=FALSE, protected=TRUE) # parse()



#########################################################################/**
# @RdocMethod evaluate
# @aliasmethod findProcessor
#
# @title "Parses and evaluates the R code"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{envir}{The @environment in which the RSP string is evaluated.}
#   \item{args}{A named @list of arguments assigned to the environment
#     in which the RSP string is parsed and evaluated.
#     See @see "R.utils::cmdArgs".}
#   \item{output}{A @character string specifying how the RSP output
#     should be handled/returned.}
#   \item{...}{Not used.}
# }
#
# \value{
#  If \code{output="stdout"}, then @NULL is returned and the RSP output
#  is sent to the standard output.  This is output is "non-buffered",
#  meaning it will be sent to the output as soon as it is generated.
#  If \code{output="RspStringProduct"}, then the output is captured
#  and returned as an @see "RspStringProduct" with attributes set.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("evaluate", "RspRSourceCode", function(object, envir=parent.frame(), args="*", output=c("RspStringProduct", "stdout"), ..., verbose=FALSE) {
  # Argument 'envir':
  envir <- as.environment(envir);

  # Argument 'args':
  args <- cmdArgs(args);

  # Argument 'output':
  output <- match.arg(output);


  # Parse R RSP source code
  expr <- parse(object);

  # Assign arguments to the parse/evaluation environment
  attachLocally(args, envir=envir);

  if (output == "RspStringProduct") {
    # Evaluate R source code and capture output
    res <- capture.output({
      eval(expr, envir=envir);
      # Force a last complete line
      cat("\n");
    });
    res <- paste(res, collapse="\n");
    res <- RspStringProduct(res, attrs=getAttributes(object));
  } else if (output == "stdout") {
    eval(expr, envir=envir);
    # Force a last complete line
    cat("\n");
    res <- NULL;
  }

  res;
}, createGeneric=FALSE) # evaluate()


setMethodS3("findProcessor", "RspRSourceCode", function(object, ...) {
  function(...) {
    evaluate(...);
  }
}) # findProcess()



setMethodS3("tidy", "RspRSourceCode", function(object, format=c("asis", "tangle", "safetangle", "demo", "unsafedemo"), collapse="\n", ...) {
  # Argument 'format':
  format <- match.arg(format);

  # Record attributes
  attrs <- attributes(object);

  code <- object;

  if (is.element(format, c("tangle", "safetangle", "demo", "unsafedemo"))) {
    # Drop header
    idx <- grep('## RSP source code script [BEGIN]', code, fixed=TRUE)[1L];
    if (!is.na(idx)) code <- code[-seq(length=idx+1L)];
    # Drop footer
    idx <- grep('## RSP source code script [END]', code, fixed=TRUE)[1L];
    if (!is.na(idx)) code <- code[seq(length=idx-2L)];
  }

  if (format == "demo") {
    # (a) Display a cleaner .rout()
    hdr <- c('.rout <- function(x)\n  cat(paste0(x, collapse=""))')
    code <- c(hdr, code);
  } else if (format == "unsafedemo") {
    # NOTE: The generated demo code may not display properly
    # (a) Replace .rout(<code chunk>) with cat(<code chunk>)
    for (rout in c(".rout0", ".rout")) {
      pattern <- sprintf('^%s', rout);
      idxs <- grep(pattern, code, fixed=FALSE);
      if (length(idxs) > 0L) {
        code[idxs] <- gsub(rout, "cat", code[idxs], fixed=TRUE);
      }
    }
  } else if (is.element(format, c("tangle", "safetangle"))) {
    # (a) Drop all .rout("...")
    idxs <- grep('^.rout[(]"', code, fixed=FALSE);
    if (length(idxs) > 0L) {
      code <- code[-idxs];
    }

    if (format == "tangle") {
      # (b) Drop all .rout0(...)
      idxs <- grep('^.rout0[(]', code, fixed=FALSE);
      if (length(idxs) > 0L) {
        code <- code[-idxs];
      }
    }

    # (c) Replace .rout(<code chunk>) with (<code chunk>).
    for (rout in c(".rout0", ".rout")) {
      pattern <- sprintf('^%s[(]', rout);
      idxs <- grep(pattern, code, fixed=FALSE);
      if (length(idxs) > 0L) {
        first <- nchar(rout) + 2L;
        code[idxs] <- substring(code[idxs], first=first, last=nchar(code[idxs])-1L);
      }
    }
  } # if (format ...)

  # Collapse?
  if (!is.null(collapse)) {
    code <- paste(code, collapse=collapse);
  }

  # Recreate RSP source code object, i.e. restore attributes (if lost)
  object <- code;
  attributes(object) <- attrs;

  object;
})


setMethodS3("tangle", "RspRSourceCode", function(code, format=c("safetangle", "tangle"), ...) {
  format <- match.arg(format);
  tidy(code, format=format);
})


##############################################################################
# HISTORY:
# 2013-09-18
# o Now tidy() handles the new RSP R source code footer comments.
# 2013-08-04
# o Added argument 'output' to evaluate() for RspRSourceCode.
# 2013-07-29
# o BUG FIX: tidy() for RspRSourceCode would not drop the last line
#   of the header leaving a long '## - - - - ...' comment line at top.
# 2013-07-17
# o Now evaluate() for RspRSourceCode no longer passes '...' to eval().
#   This make it possible to pass argument 'clean' all the way down to
#   compileLaTeX() as rfile("foo.tex.rsp", clean=TRUE).
# 2013-07-14
# o BUG FIX: evaluate() for RspRSourceCode failed to evaluate in to proper
#   environment if the default (parent) environment was used.  By adding an
#   explicit envir <- as.argument(envir) the 'envir' argument is forced to
#   be evaluated there and not later inside a capture.output() call.
# 2013-03-26
# o Added tidy() with support for formats 'asis', 'demo' and 'tangle'.
# o CLEANUP: tangle() is now a wrapper for tidy(..., format="tangle").
# 2013-03-25
# o Now tangle() drops the top of the code that sets up output functions etc.
# 2013-03-14
# o Moved getCompleteCode() from RspRSourceCode to RspRSourceCodeFactory.
# 2013-02-23
# o Added support for getCompleteCode(..., output="stdout")
# o Added debug option() for have parse() write R code to file.
# 2013-02-16
# o Added findProcessor() for RspRSourceCode, which returns the evaluate()
#   method.
# o Added getCompleteCode() for RspRSourceCode.
# o Renamed RSourceCode to RspRSourceCode.
# 2013-02-14
# o Added tangle() for RSourceCode.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
