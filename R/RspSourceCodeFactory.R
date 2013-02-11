###########################################################################/**
# @RdocClass RspSourceCodeFactory
#
# @title "The RspSourceCodeFactory class"
#
# \description{
#  @classhierarchy
#
#  An RspSourceCodeFactory is language-specific engine that knows how to translate
#  individual @see "RspExpression":s into source code of a specific
#  programming language.
# }
# 
# @synopsis
#
# \arguments{
#   \item{language}{A @character string.}
#   \item{...}{Not used.}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
# 
# @author
#*/###########################################################################
setConstructorS3("RspSourceCodeFactory", function(language=NA_character_, ...) {
  language <- Arguments$getCharacter(language);
  extend(language, "RspSourceCodeFactory");
})


#########################################################################/**
# @RdocMethod getLanguage
#
# @title "Gets the language"
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
#  Returns an @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("getLanguage", "RspSourceCodeFactory", function(this, ...) {
  as.character(this);
})


#########################################################################/**
# @RdocMethod makeSourceCode
#
# @title "Makes a SourceCode object"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to the source code constructor.}
# }
#
# \value{
#  Returns an @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("makeSourceCode", "RspSourceCodeFactory", function(this, ...) {
  lang <- getLanguage(this);
  className <- sprintf("%sSourceCode", capitalize(lang));
  clazz <- Class$forName(className);
  clazz(...);
}, protected=TRUE)


#########################################################################/**
# @RdocMethod toSourceCode
#
# @title "Translates an RspExpression into source code"
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
#  Returns a @see "SourceCode" object.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("toSourceCode", "RspSourceCodeFactory", abstract=TRUE);



###########################################################################/**
# @RdocClass RRspSourceCodeFactory
#
# @title "The RRspSourceCodeFactory class"
#
# \description{
#  @classhierarchy
#
#  An RRspSourceCodeFactory is an @see "RspSourceCodeFactory" for the R language.
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
setConstructorS3("RRspSourceCodeFactory", function(...) {
  extend(RspSourceCodeFactory("R"), "RRspSourceCodeFactory");
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
setMethodS3("exprToCode", "RRspSourceCodeFactory", function(object, expr, ...) {
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
  # RspEqualExpression => .ro({<expr>})
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (inherits(expr, "RspEqualExpression")) {
    codeT <- getCode(expr);
    code <- sprintf(".ro({%s})", codeT);
    return(code);
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # RspIncludeDirective => ...
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (inherits(expr, "RspIncludeDirective")) {
    file <- getFile(expr);

    if (isUrl(file)) {
      fh <- url(file);
      lines <- readLines(fh);
    } else {
      file <- getAbsolutePath(file);
      if (!isFile(file)) {
        throw("Cannot include file. File not found: ", file);
      }
      lines <- readLines(file); 
    }

    # Parse RSP string to RSP document
    s <- RspString(lines);
    e <- parse(s);
    # Translate to R source code
    code <- toSourceCode(object, e, ...);

    # Add a header and footer
    hdr <- sprintf("# BEGIN: @include file='%s'", file);
    ftr <- sprintf("# END: @include file='%s'", file);
    code <- c(hdr, code, ftr);

    return(code);
  }

  throw("Unknown RspExpression: ", class(expr)[1L]);
}, protected=TRUE) # exprToCode()



setMethodS3("toSourceCode", "RspSourceCodeFactory", function(object, doc, ...) {
  # Argument 'doc':
  doc <- Arguments$getInstanceOf(doc, "RspDocument");

  # Coerce all RspExpression:s to source code
  code <- lapply(doc, FUN=function(expr) exprToCode(object, expr));
  code <- unlist(code, use.names=FALSE);

  makeSourceCode(object, code);
}) # toSourceCode()



##############################################################################
# HISTORY:
# 2013-02-11
# o Added Rdoc help.
# 2013-02-10
# o Created.
##############################################################################
