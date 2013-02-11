###########################################################################/**
# @RdocClass RspEngine
#
# @title "The RspEngine class"
#
# \description{
#  @classhierarchy
#
#  An RspEngine is language-specific engine that knows how to translate
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
setConstructorS3("RspEngine", function(language=NA_character_, ...) {
  language <- Arguments$getCharacter(language);
  extend(language, "RspEngine");
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
setMethodS3("getLanguage", "RspEngine", function(this, ...) {
  as.character(this);
})


#########################################################################/**
# @RdocMethod toR
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
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns an @character @vector.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("toR", "RspEngine", abstract=TRUE);



###########################################################################/**
# @RdocClass RRspEngine
#
# @title "The RRspEngine class"
#
# \description{
#  @classhierarchy
#
#  An RRspEngine is an @see "RspEngine" for the R language.
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
setConstructorS3("RRspEngine", function(...) {
  extend(RspEngine("R"), "RRspEngine");
})


#########################################################################/**
# @RdocMethod toR
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
setMethodS3("toR", "RRspEngine", function(object, expr, ...) {
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

    s <- RspString(lines);
    e <- parse(s);

    return(e);
  }

  throw("Unknown RspExpression: ", class(expr)[1L]);
}) # toR()


##############################################################################
# HISTORY:
# 2013-02-11
# o Added Rdoc help.
# 2013-02-10
# o Created.
##############################################################################
