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
setMethodS3("exprToCode", "RspRSourceCodeFactory", function(object, expr, envir=parent.frame(), ..., index=NA) {
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


  readFile <- function(file, envir=parent.frame(), ..., directive=NA, index=NA) {
    # Support @(include|eval) file="$VAR"
    # Note that 'VAR' must exist when parsing the RSP string.
    # In other words, it cannot be set from within the RSP string!
    pattern <- "^[$]([abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0-9]*)$";
    if (regexpr(pattern, file) != -1L) {
      key <- gsub(pattern, "\\1", file);
      if (exists(key, mode="character", envir=envir)) {
        file <- get(key, mode="character", envir=envir);
        if (nchar(file) == 0L) {
          throw(sprintf("RSP '%s' preprocessing directive (#%d) has a 'file' attribute given by an R variable ('$%s') that is empty.", directive, index, key));
        }
      } else {
        file <- Sys.getenv(key);
        if (nchar(file) == 0L) {
          throw(sprintf("RSP '%s' preprocessing directive (#%d) has a 'file' attribute that specifies ('$%s') neither an existing R character variable nor an existing system environment variable.", directive, index, key));
        }
      }
    }

    if (isUrl(file)) {
      fh <- url(file);
      lines <- readLines(fh);
    } else {
      file <- getAbsolutePath(file);
      if (!isFile(file)) {
        throw(sprintf("RSP '%s' preprocessing directive (#%d) specifies an non-existing file: %s", directive, index, file));
      }
      lines <- readLines(file); 
    }

    lines;
  } # readFile()


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'expr':
  expr <- Arguments$getInstanceOf(expr, "RspExpression");

  # Argument 'envir':
  stopifnot(!is.null(envir));


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
    return(code);
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RspComment => [void]
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (inherits(expr, "RspComment")) {
    return("");
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RspIncludeDirective => ...
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (inherits(expr, "RspIncludeDirective")) {
    file <- getFile(expr);

    lines <- readFile(file, envir=envir, directive="include", index=index);

    # Parse RSP string to RSP document
    s <- RspString(lines);
    e <- parse(s);
    # Translate to R source code
    code <- toSourceCode(object, e, envir=envir, ...);

    # Add a header and footer
    hdr <- sprintf("# BEGIN: @include file='%s'", file);
    ftr <- sprintf("# END: @include file='%s'", file);
    code <- c(hdr, code, ftr);

    return(code);
  } # RspIncludeDirective


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RspDefineDirective => ...
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (inherits(expr, "RspDefineDirective")) {
    attrs <- getAttributes(expr);
    for (key in names(attrs)) {
      assign(key, attrs[[key]], envir=envir);
    }
    return(NULL);
  } # RspDefineDirective


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RspEvalDirective => ...
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (inherits(expr, "RspEvalDirective")) {
    text <- getText(expr);
    if (!is.null(text)) {
      expr <- base::parse(text=text);
      value <- eval(expr, envir=envir);
      return(NULL);
    } # if (!is.null(text))

    file <- getFile(expr);
    if (!is.null(file)) {
      lines <- readFile(file, envir=envir, directive="include", index=index);
      expr <- parse(text=lines);
      eval(expr, envir=envir);
      return(NULL);
    } # if (!is.null(file))

    throw(sprintf("RSP 'eval' preprocessing directive (#%d) requires either attribute 'file' or 'text'.", index));
  } # RspEvalDirective


  throw(sprintf("Unknown type of RSP expression (#%d): %s", index, class(expr)[1L]));
}, protected=TRUE) # exprToCode()



##############################################################################
# HISTORY:
# 2013-02-12
# o Added preprocessing directives RspDefineDirective and RspEvalDirective.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-10
# o Created.
##############################################################################
