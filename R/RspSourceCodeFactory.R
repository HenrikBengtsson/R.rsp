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
#   \item{...}{Arguments passed to the language-specific 
#              @see "SourceCode" constructor.}
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
setMethodS3("makeSourceCode", "RspSourceCodeFactory", function(this, ...) {
  lang <- getLanguage(this);
  className <- sprintf("%sSourceCode", capitalize(lang));
  clazz <- Class$forName(className);
  clazz(...);
}, protected=TRUE)




#########################################################################/**
# @RdocMethod exprToCode
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
setMethodS3("exprToCode", "RspSourceCodeFactory", abstract=TRUE);



#########################################################################/**
# @RdocMethod toSourceCode
#
# @title "Translates an RSP document to source code"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{expr}{An @see "RspDocument".}
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns the generated source code as a @see "SourceCode" object.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
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
