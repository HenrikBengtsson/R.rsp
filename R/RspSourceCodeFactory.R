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
#
# @keyword internal
#*/###########################################################################
setConstructorS3("RspSourceCodeFactory", function(language=NA, ...) {
  # Load the package (super quietly), in case R.rsp::nnn() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");

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
# @title "Makes a RspSourceCode object"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to the language-specific 
#              @see "RspSourceCode" constructor.}
# }
#
# \value{
#  Returns a @see "RspSourceCode" object.
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
  className <- sprintf("Rsp%sSourceCode", capitalize(lang));
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
#   \item{expr}{An @see "RspDocument" that has been preprocessed 
#               and flattened.}
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns the generated source code as a @see "RspSourceCode" object.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("toSourceCode", "RspSourceCodeFactory", function(object, doc, ...) {
  # Load the package (super quietly), in case R.rsp::nnn() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");

  # Argument 'doc':
  doc <- Arguments$getInstanceOf(doc, "RspDocument");


  # Assert that the RspDocument 'doc' contains no RspDocument:s
  if (any(sapply(doc, FUN=inherits, "RspDocument"))) {
    throw(sprintf("%s argument 'doc' contains other RspDocuments, which indicates that it has not been flattened.", class(doc)[1L]));
  }

  # Assert that the RspDocument 'doc' contains no RspDirective:s
  if (any(sapply(doc, FUN=inherits, "RspDirective"))) {
    throw(sprintf("%s argument 'doc' contains RSP preprocessing directives, which indicates that it has not been preprocessed.", class(doc)[1L]));
  }

  # Assert that 'doc' contains only RspText:s and RspExpression:s
  nok <- sapply(doc, FUN=function(expr) {
    if (inherits(expr, "RspText") || inherits(expr, "RspExpression")) {
      NA;
    } else {
      class(expr);
    }
  });
  nok <- nok[!is.na(nok)];
  nok <- unique(nok);
  if (length(nok) > 0L) {
    throw(sprintf("%s argument 'doc' contains RSP preprocessing directives, which indicates that it has not been preprocessed: %s", class(doc)[1L], hpaste(nok)));
  }

  # Unescape RspText
  isText <- sapply(doc, FUN=inherits, "RspText");
  doc[isText] <- lapply(doc[isText], FUN=function(expr) {
    RspText(getText(expr, unescape=TRUE));
  });

  # Coerce all RspConstruct:s to source code
  code <- vector("list", length=length(doc));
  for (kk in seq_along(doc)) {
    code[[kk]] <- exprToCode(object, doc[[kk]], index=kk);
  }
  code <- unlist(code, use.names=FALSE);

  makeSourceCode(object, code, type=getType(doc), metadata=getMetadata(doc));
}) # toSourceCode()


##############################################################################
# HISTORY:
# 2013-02-13
# o ROBUSTNESS: Now toSourceCode() for RspDocument asserts that the document
#   has been flattened and preprocessed.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-10
# o Created.
##############################################################################
