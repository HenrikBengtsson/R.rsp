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
#
# @keyword internal
#*/###########################################################################
setConstructorS3("RspRSourceCodeFactory", function(...) {
  extend(RspSourceCodeFactory("R"), "RspRSourceCodeFactory");
})



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
  reqClasses <- c("RspText", "RspExpression");
  if (!inherits(expr, reqClasses)) {
    throw("Argument 'expr' must be of class RspText or RspExpression: ", class(expr)[1L]);
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RspText => .rout("<text>")
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (inherits(expr, "RspText")) {
    text <- getContent(expr);

    code <- NULL;
    while (nchar(text) > 0L) {
      textT <- substring(text, first=1L, last=1024L);
      textT <- escapeRspText(textT);
      codeT <- sprintf(".rout(\"%s\")", textT);
      code <- c(code, codeT);
      text <- substring(text, first=1025L);
    }
    if (is.null(code)) {
      code <- ".rout(\"\")";
    }

    return(code);
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RspCodeChunk => .rout({<expr>})
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (inherits(expr, "RspCodeChunk")) {
    code <- getCode(expr);
    code <- trim(code);

    # Parse and validate code chunk
    # (i) Try without { ... }
    rexpr <- tryCatch({
      codeT <- sprintf("(%s)", code);
      base::parse(text=codeT);
    }, error = function(ex) NULL);

    # (ii) Otherwise retry with { ... }
    if (is.null(rexpr)) {
      code <- sprintf("{%s}", code);
      rexpr <- tryCatch({
        codeT <- sprintf("(%s)", code);
        base::parse(text=codeT);
      }, error = function(ex) {
        throw(sprintf("RSP code chunk (#%d) does not contain a complete R expression: %s", index, ex));
      });
    }

    echo <- getEcho(expr);
    ret <- getInclude(expr);

    # An <%= ... %> construct?
    if (ret && inherits(expr, "RspCodeChunk")) {
      rout <- ".rout0";
    } else {
      rout <- ".rout";
    }

    if (echo) {
      codeE <- sprintf("%s(\"%s\")", rout, escapeRspText(codeT));
    }

    if (echo && !ret) {
      code <- c(codeE, code);
    } else if (echo && ret) {
      codeT <- sprintf(".rtmp <- %s", code);
      code <- c(codeE, code, sprintf("%s(.rtmp)", "rm(list=\".rtmp\")", rout));
    } else if (!echo && ret) {
      code <- sprintf("%s(%s)", rout, code);
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
      codeE <- sprintf(".rout(\"%s\")", escapeRspText(code));
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

  throw(sprintf("Unknown class of RSP expression (#%d): %s", index, class(expr)[1L]));
}, protected=TRUE) # exprToCode()



setMethodS3("getCompleteCode", "RspRSourceCodeFactory", function(this, object, ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local functions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  minIndent <- function(...) {
    s <- c(...);
    s <- gsub('"\n"', '"\r"', s);
    s <- unlist(strsplit(s, split="\n", fixed=TRUE));
    s <- sapply(s, FUN=function(s) gsub('"\r"', '"\n"', s));
    names(s) <- NULL;

    # Nothing todo?
    if (length(s) == 0L) return(s);

    # Clean all-blank lines
    s <- gsub("^[ ]*$", "", s);
    # Drop empty lines at the top and the end
    while (nchar(s[1L]) == 0L) {
      s <- s[-1L];
    }

    # Nothing todo?
    if (length(s) == 0L) return(s);

    while (nchar(s[length(s)]) == 0L) {
      s <- s[-length(s)];
    }

    # Drop duplicated empty lines
    idxs <- which(nchar(s) == 0L);
    if (length(idxs) > 0L) {
      idxs <- idxs[which(diff(idxs) == 1L)];
      if (length(idxs) > 0L) {
        s <- s[-idxs];
      }
    }

    # Find minimum indentation of non-blank lines
    idxs <- which(nchar(s) > 0L);

    # Nothing to do?
    if (length(idxs) == 0L) {
      return(s);
    }

    prefix <- gsub("^([ ]*).*", "\\1", s[idxs]);
    min <- min(nchar(prefix));

    # Nothing to do?
    if (min == 0L) {
      return(s);
    }

    pattern <- sprintf("^%s", paste(rep(" ", times=min), collapse=""));
    s <- gsub(pattern, "", s);

    s;
  } # minIndent()



  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Get the default code header, body and footer
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  res <- NextMethod("getCompleteCode");


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Update the header
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  code <- NULL;
##  code <- 'library("R.rsp")';

  # Add metadata
  metadata <- getMetadata(object);
  for (key in names(metadata)) {
     value <- metadata[[key]];
     value <- gsub('"', '\\"', value, fixed=TRUE);
     value <- sprintf('  %s = "%s"', key, value);
     code <- c(code, value);
  }
  code <- unlist(strsplit(paste(code, collapse=",\n"), split="\n", fixed=TRUE))
  code <- c('## RSP document metadata', '.rmeta <- list(', code, ');');
  header0 <- paste('    ', code, sep="");

  # Build R source code
  res$header <- minIndent(header0, '
    ## = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
    ## This is a self-contained R script generated from an RSP document.
    ## It may be evaluated using source() as is.
    ## = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

    ## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ## Local RSP utility functions
    ## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ## Look up \'base\' function once (faster)
    .base_paste0 <- base::paste0
    .base_cat <- base::cat

    ## RSP output function
    .rout <- function(x) .base_cat(.base_paste0(x))

    ## RSP output function for inline RSP constructs
    .rout0 <- function(x) .base_cat(rpaste(x))

    ## The output of inline RSP constructs is controlled by
    ## generic function rpaste().
    rpaste <- function(...) UseMethod("rpaste")

    setInlineRsp <- function(class, fun, envir=parent.frame()) {
      name <- sprintf("rpaste.%s", class)
      assign(name, fun, envir=envir)
    }

    ## The default is to coerce to character and collapse without
    ## a separator.  It is possible to override the default in an
    ## RSP code expression.
    setInlineRsp("default", function(x, ...) .base_paste0(x, collapse=""))

    ## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ## RSP source code script
    ## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ');

  res;
}, protected=TRUE) # getCompleteCode()




##############################################################################
# HISTORY:
# 2013-07-26
# o GENERALIZATION: Now all return values are processed via generic
#   function rpaste() before being outputted via cat().
# 2013-03-27
# o Renamed .ro() to .rout().
# o .ro() need to use cat(as.character(...)) in order to assert that
#   the object is coerced to a character before being outputted.
# 2013-03-14
# o Moved getCompleteCode() from RspRSourceCode to RspRSourceCodeFactory.
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
