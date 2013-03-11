###########################################################################/**
# @RdocClass RspDirective
#
# @title "The abstract RspDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspDirective is an @see "RspConstruct" that represents an
#  RSP preprocesing directive of format \code{<\%@ ... \%>}.
#  The directive is independent of the underlying programming language.
# }
# 
# @synopsis
#
# \arguments{
#   \item{directive}{A @character string.}
#   \item{attributes}{A named @list.}
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
setConstructorS3("RspDirective", function(directive=character(), attributes=list(), ...) {
  this <- extend(RspConstruct(directive), "RspDirective");
  for (key in names(attributes)) {
    attr(this, key) <- attributes[[key]];
  }
  this;
})


#########################################################################/**
# @RdocMethod "asRspString"
#
# @title "Recreates an RSP string from an RSP preprocessing directive"
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
#  Returns an @see "RspString".
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("asRspString", "RspDirective", function(object, ...) {
  body <- unclass(object);
  attrs <- getAttributes(object);
  if (length(attrs) == 0L) {
    attrs <- "";
  } else {
    attrs <- sprintf('%s="%s"', names(attrs), attrs);
    attrs <- paste(c("", attrs), collapse=" ");
  }
  fmtstr <- "<%%@%s%s%%>";
  s <- sprintf(fmtstr, body, attrs);
  RspString(s);
})


###########################################################################/**
# @RdocClass RspUnparsedDirective
#
# @title "The RspUnparsedDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspUnparsedDirective is an @see RspDirective that still has not
#  been parsed for its class and content.  After @see "parse":ing such
#  an object, the class of this RSP directive will be known.
# }
# 
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to @see "RspDirective".}
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
setConstructorS3("RspUnparsedDirective", function(...) {
  extend(RspDirective(...), "RspUnparsedDirective");
})



#########################################################################/**
# @RdocMethod parse
#
# @title "Parses the unknown RSP directive for its class"
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
#  Returns an @see "RspDirective" of known class.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("parse", "RspUnparsedDirective", function(expr, ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local function
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  parseAttributes <- function(rspCode, known=mandatory, mandatory=NULL, ...) {
    bfr <- rspCode;
    
    # Argument 'known':
    known <- unique(union(known, mandatory));
  
    # Remove all leading white spaces
    pos <- regexpr("^[ \t\n\r]+", bfr);
    len <- attr(pos, "match.length");
    bfr <- substring(bfr, first=len+1L);

    attrs <- list();
    if (nchar(bfr) > 0L) {
      # Add a white space
      bfr <- paste(" ", bfr, sep="");
      while (nchar(bfr) > 0L) {
        # Read all (mandatory) white spaces
        pos <- regexpr("^[ \t\n\r]+", bfr);
        if (pos == -1L) {
          throw(Exception("Error when parsing attributes of RSP preprocessing directive. Expected white space: ", code=sQuote(rspCode)));
        }
        len <- attr(pos, "match.length");
        bfr <- substring(bfr, first=len+1L);

        # Nothing left?
        if (nchar(bfr) == 0L) {
          break;
        }

        # Read the attribute name
        pos <- regexpr("^[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ][abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0-9]*", bfr);
        if (pos == -1L) {
str(pos);
str(bfr);
          throw(Exception("Error when parsing attributes of RSP preprocessing directive. Expected an attribute name: ", code=sQuote(rspCode)));
        }
        len <- attr(pos, "match.length");
        name <- substring(bfr, first=1L, last=len);
        bfr <- substring(bfr, first=len+1L);
    
        # Read the '=' with optional white spaces around it
        pos <- regexpr("^[ \t\n\r]*=[ \t\n\r]*", bfr);
        if (pos == -1L) {
          throw(Exception("Error when parsing attributes of RSP preprocessing directive. Expected an equal sign: ", code=sQuote(rspCode)));
        }
        len <- attr(pos, "match.length");
        bfr <- substring(bfr, first=len+1L);
    
        # Read the value with mandatory quotation marks around it
        pos <- regexpr("^\"[^\"]*\"", bfr);
        if (pos == -1L) {
          pos <- regexpr("^'[^']*'", bfr);
          if (pos == -1L) {
            throw(Exception("Error when parsing attributes of RSP preprocessing directive. Expected a quoted attribute value string: ", code=sQuote(rspCode)));
          }
        }
        len <- attr(pos, "match.length");
        value <- substring(bfr, first=2L, last=len-1L);
        bfr <- substring(bfr, first=len+1L);
        names(value) <- name;
        attrs <- c(attrs, value);
      }
    } # if (nchar(bfr) > 0L)

    # Check for duplicated attributes  
    if (length(names(attrs)) != length(unique(names(attrs))))
        throw(Exception("Duplicated attributes in RSP preprocessing directive.", code=sQuote(rspCode)));
  
    # Check for unknown attributes
    if (!is.null(known)) {
      nok <- which(is.na(match(names(attrs), known)));
      if (length(nok) > 0L) {
        nok <- paste("'", names(attrs)[nok], "'", collapse=", ", sep="");
        throw(Exception("Unknown attribute(s) in RSP preprocessing directive: ", nok, code=sQuote(rspCode)));
      }
    }
  
    # Check for missing mandatory attributes
    if (!is.null(mandatory)) {
      nok <- which(is.na(match(mandatory, names(attrs))));
      if (length(nok) > 0L) {
        nok <- paste("'", mandatory[nok], "'", collapse=", ", sep="");
        throw(Exception("Missing attribute(s) in RSP preprocessing directive: ", nok, code=sQuote(rspCode)));
      }
    }
  
    # Return parsed attributes.
    attrs;
  } # parseAttributes()


  body <- expr;

  pattern <- "^[ ]*([abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ][abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0-9]*)([ \t\n\r]+(.*))*";

  # Sanity check
  if (regexpr(pattern, body) == -1L) {
    throw("Not an RSP preprocessing directive: ", body);
  }

  # <%@foo attr1="bar" attr2="geek"%> => ...
  directive <- gsub(pattern, "\\1", body);
  directive <- tolower(directive);

  # Parse the attributes
  attrs <- gsub(pattern, "\\2", body);
  attrs <- parseAttributes(attrs, known=NULL);

  # Infer the class name
  class <- sprintf("Rsp%sDirective", capitalize(directive));

  # Instantiate object
  res <- tryCatch({
    clazz <- Class$forName(class);
    newInstance(clazz, attributes=attrs);
  }, error = function(ex) {
    RspUnknownDirective(directive, attributes=attrs);
  })
  # Preserve attributes
  attr(res, "suffixSpecs") <- attr(expr, "suffixSpecs");

  res;
}) # parse()


#########################################################################/**
# @RdocMethod "asRspString"
#
# @title "Recreates an RSP string from an unparsed RSP preprocessing directive"
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
#  Returns an @see "RspString".
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("asRspString", "RspUnparsedDirective", function(object, ...) {
  body <- unclass(object);
  fmtstr <- "<%%@%s%%>";
  s <- sprintf(fmtstr, body);
  RspString(s);
})



###########################################################################/**
# @RdocClass RspIncludeDirective
#
# @title "The RspIncludeDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspIncludeDirective is an @see "RspDirective" that causes the
#  RSP parser to include (and parse) an external RSP file.
# }
# 
# @synopsis
#
# \arguments{
#   \item{attributes}{A named @list, which must contain either 
#      a 'file' or a 'text' element.}
#   \item{...}{Optional arguments passed to the constructor 
#              of @see "RspDirective".}
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
setConstructorS3("RspIncludeDirective", function(attributes=list(), ...) {
  # Argument 'attributes':
  if (!missing(attributes)) {
    keys <- names(attributes);
    if (!any(is.element(c("file", "text"), keys))) {
      throw("A RSP 'include' directive must contain either a 'file' or a 'text' attribute: ", hpaste(keys));
    }
  }

  extend(RspDirective("include", attributes=attributes, ...), "RspIncludeDirective")
})



#########################################################################/**
# @RdocMethod getFile
#
# @title "Gets the file attribute"
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
#  Returns a @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getFile", "RspIncludeDirective", function(directive, ...) {
  attr(directive, "file");
})

#########################################################################/**
# @RdocMethod getText
#
# @title "Gets the text"
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
#  Returns a @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getText", "RspIncludeDirective", function(directive, ...) {
  attr(directive, "text");
})


#########################################################################/**
# @RdocMethod getVerbatim
#
# @title "Checks if verbatim include should be used or not"
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
#  Returns a @logical.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getVerbatim", "RspIncludeDirective", function(directive, ...) {
  res <- attr(directive, "verbatim");
  if (is.null(res)) res <- FALSE;
  res <- as.logical(res);
  res <- isTRUE(res);
  res;
})


#########################################################################/**
# @RdocMethod getWrap
#
# @title "Get the wrap length"
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
#  Returns an @integer, or @NULL.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getWrap", "RspIncludeDirective", function(directive, ...) {
  res <- attr(directive, "wrap");
  if (!is.null(res)) {
    res <- as.integer(res);
  }
  res;
})




###########################################################################/**
# @RdocClass RspDefineDirective
#
# @title "The RspDefineDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspDefineDirective is an @see "RspDirective" that causes the
#  RSP parser to assign the value of an attribute to an R object of
#  the same name as the attribute at the time of parsing.
# }
# 
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to the constructor of @see "RspDirective".}
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
setConstructorS3("RspDefineDirective", function(...) {
  extend(RspDirective("define", ...), "RspDefineDirective")
})




###########################################################################/**
# @RdocClass RspEvalDirective
#
# @title "The RspEvalDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspEvalDirective is an @see "RspDirective" that causes the
#  RSP parser to evaluate a piece of R code (either in a text string
#  or in a file) as it is being parsed.
# }
# 
# @synopsis
#
# \arguments{
#   \item{attributes}{A named @list, which must contain a 'file' 
#      or a 'text' element.}
#   \item{...}{Optional arguments passed to the constructor 
#              of @see "RspDirective".}
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
setConstructorS3("RspEvalDirective", function(attributes=list(), ...) {
  # Argument 'attributes':
  if (!missing(attributes)) {
    keys <- names(attributes);
    if (!any(is.element(c("file", "text"), keys))) {
      throw("Either attribute 'file' or 'text' for the RSP 'eval' directive must be given: ", hpaste(keys));
    }

    # Default programming language is "R".
    if (is.null(attributes$language)) attributes$language <- "R";
  }

  extend(RspDirective("eval", attributes=attributes, ...), "RspEvalDirective")
})


#########################################################################/**
# @RdocMethod getFile
#
# @title "Gets the file attribute"
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
#  Returns a @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getFile", "RspEvalDirective", function(directive, ...) {
  attr(directive, "file");
})


#########################################################################/**
# @RdocMethod getText
#
# @title "Gets the text"
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
#  Returns a @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getText", "RspEvalDirective", function(directive, ...) {
  attr(directive, "text");
})

#########################################################################/**
# @RdocMethod getLanguage
#
# @title "Gets the programming language"
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
#  Returns a @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getLanguage", "RspEvalDirective", function(directive, ...) {
  res <- attr(directive, "language");
  if (is.null(res)) res <- as.character(NA);
  res;
})


###########################################################################/**
# @RdocClass RspPageDirective
#
# @title "The RspPageDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspPageDirective is an @see "RspDirective" that annotates the
#  content of the RSP document, e.g. the content type.
# }
# 
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to the constructor of @see "RspDirective".}
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
setConstructorS3("RspPageDirective", function(...) {
  extend(RspDirective("page", ...), "RspPageDirective")
})


#########################################################################/**
# @RdocMethod getType
#
# @title "Gets the content type"
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
#  Returns a @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getType", "RspPageDirective", function(directive, ...) {
  res <- attr(directive, "type");
  if (is.null(res)) res <- as.character(NA);
  res;
})


#########################################################################/**
# @RdocMethod getTitle
#
# @title "Gets the title"
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
#  Returns a @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getTitle", "RspPageDirective", function(directive, ...) {
  res <- attr(directive, "title");
  if (is.null(res)) res <- as.character(NA);
  res;
})


#########################################################################/**
# @RdocMethod getKeywords
#
# @title "Gets the keywords"
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
#  Returns a @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getKeywords", "RspPageDirective", function(directive, ...) {
  res <- attr(directive, "keywords");
  if (is.null(res)) res <- "";
  res;
})

###########################################################################/**
# @RdocClass RspTitleDirective
#
# @title "The RspTitleDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspTitleDirective is an @see "RspDirective" that represents
#  the title of the RSP document.
# }
# 
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to the constructor of @see "RspDirective".}
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
setConstructorS3("RspTitleDirective", function(...) {
  extend(RspDirective("title", ...), "RspTitleDirective")
})



###########################################################################/**
# @RdocClass RspKeywordsDirective
#
# @title "The RspKeywordsDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspKeywordsDirective is an @see "RspDirective" that represents
#  the keywords of the RSP document.
# }
# 
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to the constructor of @see "RspDirective".}
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
setConstructorS3("RspKeywordsDirective", function(...) {
  extend(RspDirective("keywords", ...), "RspKeywordsDirective")
})


###########################################################################/**
# @RdocClass RspIfDirective
# @alias RspIfeqDirective
# @alias RspIfneqDirective
# @alias RspElseDirective
# @alias RspEndifDirective
#
# @title "The RspIfeqDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspIfDirective is an @see "RspDirective" that will include or
#  exclude all @see "RspConstruct":s until the next @see "RspEndifDirective"
#  based on the preprocessing value of the particular if clause.
#  Inclusiion/exclusion can be reverse via an @see "RspElseDirective".
# }
# 
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to the constructor of @see "RspDirective".}
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
setConstructorS3("RspIfDirective", function(...) {
  extend(RspDirective("if", ...), "RspIfDirective")
})

setConstructorS3("RspIfeqDirective", function(...) {
  extend(RspIfDirective("ifeq", ...), "RspIfeqDirective")
})

setConstructorS3("RspIfneqDirective", function(...) {
  extend(RspIfDirective("ifneq", ...), "RspIfneqDirective")
})

setConstructorS3("RspElseDirective", function(...) {
  extend(RspDirective("else", ...), "RspElseDirective")
})

setConstructorS3("RspEndifDirective", function(...) {
  extend(RspDirective("endif", ...), "RspEndifDirective")
})


###########################################################################/**
# @RdocClass RspUnknownDirective
#
# @title "The RspUnknownDirective class"
#
# \description{
#  @classhierarchy
#
#  An RspUnknownDirective is an @see "RspDirective" that is unknown.
# }
# 
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to the constructor of @see "RspDirective".}
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
setConstructorS3("RspUnknownDirective", function(...) {
  extend(RspDirective(...), "RspUnknownDirective")
})



##############################################################################
# HISTORY:
# 2013-02-23
# o Added asRspString() for RspDirective and RspUnparsedDirective.
# 2013-02-22
# o Added RspUnparsedDirective.
# 2013-02-19
# o Added support for attribute 'text' of RspIncludeDirective:s.
# 2013-02-18
# o Added RspIfeqDirective, RspElseDirective, and RspEndifDirective.
# 2013-02-13
# o Added RspPageDirective.
# o Added 'language' attribute to RspEvalDirective.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
