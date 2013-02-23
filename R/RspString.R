###########################################################################/**
# @RdocClass RspString
#
# @title "The RspString class"
#
# \description{
#  @classhierarchy
#
#  An RspString is a @character @vector with RSP markup.
# }
# 
# @synopsis
#
# \arguments{
#   \item{str, ...}{@character strings.}
#   \item{type}{The content type of the RSP string.}
#   \item{source}{A reference to the source RSP document, iff any.}
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
setConstructorS3("RspString", function(str=character(), ..., type=NA, source=NA) {
  # Argument 'source':
  if (is.character(source)) {
    if (isUrl(source)) {
    } else {
      source <- getAbsolutePath(source);
    }
  }

  this <- extend(c(str, ...), "RspString");
  attr(this, "type") <- as.character(type);
  attr(this, "source") <- source;
  this;
})


#########################################################################/**
# @RdocMethod getType
#
# @title "Gets the type of an RSP string"
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
setMethodS3("getType", "RspString", function(object, ...) {
  res <- attr(object, "type");
  if (is.null(res)) res <- as.character(NA);
  res;
}, protected=TRUE)



#########################################################################/**
# @RdocMethod getSource
#
# @title "Gets the source reference of an RSP string"
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
setMethodS3("getSource", "RspString", function(object, ...) {
  res <- attr(object, "source");
  if (is.null(res)) res <- as.character(NA);
  res;
}, protected=TRUE)



#########################################################################/**
# @RdocMethod dropComments
#
# @title "Drops all RSP comments"
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
#  Returns an @see "RspString" without the RSP comments.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("dropComments", "RspString", function(object, envir=parent.frame(), ...) {
  dropRspEmptyComments <- function(rspCode, trimNewline=TRUE, ...) {
    pattern <- "<%[-]+%>";
    if (trimNewline) {
      pattern <- sprintf("%s(|[ \t\v]*(\n|\r|\r\n))", pattern);
    }
    gsub(pattern, "", rspCode);
  } # dropEmptyRspComments()

  ## <%-{n} comment \n comment -{n}%>, where n >= 2
  dropRspComments <- function(rspCode, trimNewline=TRUE, ...) {
    patternL <- "<%(-[-]+)";
    while ((posL <- regexpr(patternL, rspCode)) != -1L) {
      nL <- attr(posL, "match.length");

      patternR <- sprintf("[^-][-]{%d}%%>", nL-2L);
      if ((posR <- regexpr(patternR, rspCode)) == -1L) {
        break;
      }
      nR <- attr(posR, "match.length");


      head <- substring(rspCode, first=1L, last=posL-1L);
      comment <- substring(rspCode, first=posL+nL, last=posR);
##      printf("BEGIN COMMENT\n'''%s'''\nEND COMMENT\n", comment);
      tail <- substring(rspCode, first=posR+nR+1L, last=nchar(rspCode));

      if (trimNewline) {
        tail <- gsub("^[ \t\v]*(\n|\r|\r\n)", "", tail);
      }

      rspCode <- paste(c(head, tail), collapse="");
    } # while()
    rspCode;
  } # dropRspComments()


  ## <%[-]+[{count}]%>
  dropRspCountComments <- function(rspCode, envir=parent.frame(), ...) {
    pattern <- "<%[-]+(\\[([^]]*)\\])?%>";
    res <- NULL;
    while ((pos <- regexpr(pattern, rspCode)) != -1L) {
      if (pos > 1L) {
        res <- c(res, substring(rspCode, first=1L, last=pos-1L));
      }

      n <- attr(pos, "match.length");
      expr <- substring(rspCode, first=pos, last=pos+n-1L);
      rspCode <- substring(rspCode, first=pos+n);

      # Infer count pattern from count specifiers
      patternC <- "?"; # Exactly zero or one occurance.
      spec <- sub(pattern, "\\2", expr);
      if (nchar(spec) > 0L) {
        count <- gstring(spec, envir=envir);
        if (count == "") {
        } else if (count == "*") {
          patternC <- "*"; # Zero or more occurances.
        } else {
          count <- as.numeric(count);
          if (is.na(count)) {
            throw("Detected missing/NA count specifier in RSP comments: ", spec);
          }

          # Drop all but 'count' empty rows
          if (count < 0) {
            # Count max number of empty rows
            patternR <- sprintf("([ \t\v]*(\n|\r|\r\n))*", patternC);
            posT <- regexpr(patternR, rspCode);
            if (posT == 1L) {
              nT <- attr(posT, "match.length");
              bfrT <- substring(rspCode, first=1L, last=nT);
              bfrT <- gsub("[ \t\v]*", "", bfrT);
              bfrT <- gsub("\r\n", "\n", bfrT);
              max <- nchar(bfrT);
              count <- max + count;
              if (count < 0) count <- 0;
            } else {
              count <- 0;
            }
          }

          if (count == 0) {
            patternC <- NULL;
          } else if (count == 1) {
            patternC <- "?";
          } else if (is.infinite(count)) {
            patternC <- "*";
          } else if (count > 1) {
            patternC <- sprintf("{0,%d}", count);
          }
        }
      } # if (nchar(spec) > 0L)

      # Nothing drop?
      if (!is.null(patternC)) {
        # Row pattern
        patternR <- sprintf("([ \t\v]*(\n|\r|\r\n))%s", patternC);
        rspCode <- sub(patternR, "", rspCode);
      }
    } # while()

    # Append tail?
    if (nchar(rspCode) > 0L) {
      res <- c(res, rspCode);
    }

    paste(res, collapse="");
  } # dropRspCountComments()


  ## <%# comment \n comment %>
  dropBrewComments <- function(rspCode, trimNewline=FALSE, ...) {
    pattern <- "<%#.*%>";
    if (trimNewline) {
      pattern <- sprintf("%s(|[ \t\v]*(\n|\r|\r\n))", pattern);
    }
    gsub(pattern, "", rspCode);
  } # dropBrewComments()


  rspCode <- paste(object, collapse="\n");

  rspCode <- dropRspEmptyComments(rspCode, trimNewline=TRUE);
  rspCode <- dropRspComments(rspCode, trimNewline=TRUE);
  rspCode <- dropRspCountComments(rspCode, envir=envir);
  if (getOption("rsp/emulateBrew", FALSE)) {
    rspCode <- dropBrewComments(rspCode, trimNewline=TRUE);
  }

  class(rspCode) <- class(object);
  attr(rspCode, "type") <- getType(object);
  attr(rspCode, "source") <- getSource(object);

  rspCode;
}, protected=TRUE)


#########################################################################/**
# @RdocMethod parseRaw
#
# @title "Parses the string into blocks of text and RSP"
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
#  Returns a named @list with elements named "text" and "rsp".
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("parseRaw", "RspString", function(object, what=c("comment", "directive", "expression"), commentLength=2L, ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'what':
  what <- match.arg(what);

  # Argument 'commentLength':
  commentLength <- as.integer(commentLength);
  stopifnot(is.finite(commentLength));
  stopifnot(commentLength >= 2L);


  # Work with one large character string
  bfr <- paste(object, collapse="\n", sep="");

  # Setup the regular expressions for start and stop RSP constructs
  if (what == "comment") {
    patternL <- sprintf("<%%-{%d}([^-])", commentLength);
    patternR <- sprintf("(|[^-])(-{%d}(\\[[^]]*\\]))?%%>", commentLength);
  } else if (what == "directive") {
    patternL <- "<%@()";
    patternR <- "()(|-(\\[[^]]*\\])?)%>";
  } else if (what == "expression") {
    patternL <- "<%()";
    patternR <- "()(|-(\\[[^]]*\\])?)%>";
  }

  # Constants
  START <- 0L;
  STOP <- 1L;

  parts <- list();
  state <- START;
  while(TRUE) {
    if (state == START) {
      # The start tag may exists *anywhere* in static code
      posL <- regexpr(patternL, bfr);
      if (posL == -1L)
        break;

      nL <- attr(posL, "match.length");
      stopifnot(is.integer(nL));

      # Adjust if parsed into the tailing text
      tag <- substring(bfr, first=posL, posL+nL-1L);
      bfrX <- gsub(patternL, "\\1", tag);
      nL <- nL - nchar(bfrX);

      part <- list(text=substring(bfr, first=1L, last=posL-1L));
      bfr <- substring(bfr, first=posL+nL);
      state <- STOP;
    } else if (state == STOP) {
      posR <- indexOfNonQuoted(bfr, patternR);
      if (posR == -1L)
        break;

      # Extract RSP tail
      nR <- attr(posR, "match.length");
      stopifnot(is.integer(nR));
      tail <- substring(bfr, first=posR, last=posR+nR-1L);

      # Adjust for tail parsed into preceeding body?
      bodyX <- gsub(patternR, "\\1", tail);
      posR <- posR + nchar(bodyX);

      # Extract body
      body <- substring(bfr, first=1L, last=posR-1L);

      # Get optional suffix specifications, i.e. '-[{specs}]%>'
      suffixSpecs <- gsub(patternR, "\\3", tail);
      # Trim?
      if (nchar(suffixSpecs > 0L)) {
        suffixSpecs <- gsub("^\\[[ \t\v]*", "", suffixSpecs);
        suffixSpecs <- gsub("[ \t\v]*\\]$", "", suffixSpecs);
      }
      attr(body, "suffixSpecs") <- suffixSpecs;

      if (what == "comment") {
        attr(body, "commentLength") <- commentLength;           
      }

      part <- list(rsp=body);
      if (what != "expression") {
        names(part)[1L] <- what;
      }
      bfr <- substring(bfr, first=posR+nR);

      state <- START;
    } # if (state == ...)

    parts <- c(parts, part);
  } # while(TRUE);

  # Add the rest of the buffer as text
  parts <- c(parts, list(text=bfr));

  # Setup results
  doc <- RspDocument(parts, type=getType(object), source=getSource(object));
  attr(doc, "what") <- what;

  doc;
}, protected=TRUE) # parseRaw()



#########################################################################/**
# @RdocMethod parse
#
# @title "Parses the RSP string"
#
# \description{
#  @get "title" with RSP comments dropped.
# }
#
# @synopsis
#
# \arguments{
#   \item{preprocess}{If @TRUE, all RSP preprocessing directives
#      are processed after the RSP string is parsed, otherwise not.}
#   \item{envir}{The @environment where the RSP document is preprocessed.}
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns a @see "RspDocument".
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("parse", "RspString", function(object, preprocess=TRUE, envir=parent.frame(), ...) {
  # Load the package (super quietly), in case R.rsp::nnn() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local function
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  coerceComments <- function(object, ...) {
    idxs <- which(names(object) == "comment");
    for (kk in idxs) {
      part <- object[[kk]];
      part <- RspComment(part);
      object[[kk]] <- part;
    }
    object;
  } # coerceComments()


  coerceText <- function(object, ...) {
    idxs <- which(names(object) == "text");
    for (kk in idxs) {
      part <- object[[kk]];
      part <- RspText(part);
      object[[kk]] <- part;
    }
    object;
  } # coerceText()


  coerceRsp <- function(object, ...) {
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Local function
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    parseAttributes <- function(rspCode, known=mandatory, mandatory=NULL, ...) {
      bfr <- rspCode;
      
      # Argument 'known':
      known <- unique(union(known, mandatory));
    
      # Remove all leading white spaces
      pos <- regexpr("^[ \t]+", bfr);
      len <- attr(pos, "match.length");
      bfr <- substring(bfr, first=len+1L);

      attrs <- list();
      if (nchar(bfr) > 0L) {
        # Add a white space
        bfr <- paste(" ", bfr, sep="");
        while (nchar(bfr) > 0L) {
          # Read all (mandatory) white spaces
          pos <- regexpr("^[ \t]+", bfr);
          if (pos == -1L) {
            throw(Exception("Error when parsing attributes. Expected a white space: ", code=rspCode));
          }
          len <- attr(pos, "match.length");
          bfr <- substring(bfr, first=len+1L);
          # Read the attribute name
          pos <- regexpr("^[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ][abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0-9]*", bfr);
          if (pos == -1L) {
            throw(Exception("Error when parsing attributes. Expected an attribute name: ", code=rspCode));
          }
          len <- attr(pos, "match.length");
          name <- substring(bfr, first=1L, last=len);
          bfr <- substring(bfr, first=len+1L);
      
          # Read the '=' with optional white spaces around it
          pos <- regexpr("^[ ]*=[ ]*", bfr);
          if (pos == -1L) {
            throw(Exception("Error when parsing attributes. Expected an equal sign: ", code=rspCode));
          }
          len <- attr(pos, "match.length");
          bfr <- substring(bfr, first=len+1L);
      
          # Read the value with mandatory quotation marks around it
          pos <- regexpr("^\"[^\"]*\"", bfr);
          if (pos == -1L) {
            pos <- regexpr("^'[^']*'", bfr);
            if (pos == -1L) {
              throw(Exception("Error when parsing attributes. Expected a quoted attribute value string: ", code=rspCode));
            }
          }
          len <- attr(pos, "match.length");
          value <- substring(bfr, first=2L, last=len-1L);
          bfr <- substring(bfr, first=len+1L);
          names(value) <- name;
          attrs <- c(attrs, value);
        }
      } # if (nchar(bfr) > 0)

      # Check for duplicated attributes  
      if (length(names(attrs)) != length(unique(names(attrs))))
          throw(Exception("Duplicated attributes.", code=rspCode));
    
      # Check for unknown attributes
      if (!is.null(known)) {
        nok <- which(is.na(match(names(attrs), known)));
        if (length(nok) > 0) {
          nok <- paste("'", names(attrs)[nok], "'", collapse=", ", sep="");
          throw(Exception("Unknown attribute(s): ", nok, code=rspCode));
        }
      }
    
      # Check for missing mandatory attributes
      if (!is.null(mandatory)) {
        nok <- which(is.na(match(mandatory, names(attrs))));
        if (length(nok) > 0) {
          nok <- paste("'", mandatory[nok], "'", collapse=", ", sep="");
          throw(Exception("Missing attribute(s): ", nok, code=rspCode));
        }
      }
    
      # Return parsed attributes.
      attrs;
    } # parseAttributes()
  
  
    idxs <- which(names(object) == "rsp");
    for (kk in idxs) {
      part <- object[[kk]];
      rspCode <- part;

      suffixSpecs <- attr(part, "suffixSpecs");

      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      # RSP Scripting Elements and Variables
      #
      # <%--[comment]--%>
      #
      # NOTE: With dropRspComments() above, this will never occur here.
      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      pattern <- "^--(.*)--$";
      if (regexpr(pattern, part) != -1L) {
        comment <- gsub(pattern, "\\1", part);
        part <- RspComment(comment);
        attr(part, "suffixSpecs") <- suffixSpecs;
        object[[kk]] <- part;
        next;
      }
  
      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      # RSP Scripting Elements and Variables
      #
      # <%=[expression]%>
      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      pattern <- "^=(.*)$";
      if (regexpr(pattern, part) != -1L) {
        code <- gsub(pattern, "\\1", part);
        code <- trim(code);
        part <- RspCodeChunk(code, return=TRUE);
        attr(part, "suffixSpecs") <- suffixSpecs;
        object[[kk]] <- part;
        next;
      } 


      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      # RSP Scripting Elements and Variables
      #
      # <%:[expression]%>
      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      pattern <- "^:(|[ \t\v]*(\n|\r|\r\n))(.*)$";
      if (regexpr(pattern, part) != -1L) {
        code <- gsub(pattern, "\\3", part);
        part <- RspCode(code, echo=TRUE);
        attr(part, "suffixSpecs") <- suffixSpecs;
        object[[kk]] <- part;
        next;
      } 
  
  
      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      # RSP Directives
      #
      # <%@directive attr1="foo" attr2="bar" ...%>
      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      pattern <- "^@[ ]*([abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ][abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0-9]*)([ ]+(.*))*$";
      if (regexpr(pattern, part) != -1L) {
        # <%@foo attr1="bar" attr2="geek"%> => ...
        directive <- gsub(pattern, "\\1", part);
        directive <- tolower(directive);
        attrs <- gsub(pattern, "\\2", part);
        attrs <- parseAttributes(attrs, known=NULL);
        class <- sprintf("Rsp%sDirective", capitalize(directive));
        part <- tryCatch({
          clazz <- Class$forName(class);
          newInstance(clazz, attributes=attrs);
        }, error = function(ex) {
          RspUnknownDirective(directive, attributes=attrs);
        })
        attr(part, "suffixSpecs") <- suffixSpecs;
        object[[kk]] <- part;
        next;
      }
   
  
      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      # RSP Scripting Elements and Variables
      #
      # <% [expressions] %>
      #
      # This applies to anything not recognized above.
      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      part <- RspCode(trim(rspCode));
        attr(part, "suffixSpecs") <- suffixSpecs;
      object[[kk]] <- part;
    } # for (kk ...)
  
    object; 
    } # coerceRsp()

  # RSP comment must be dropped by the parser so that they can be
  # nested, because all other RSP expressions must not be nested.
  object <- dropComments(object, envir=envir);

  for (n in 2:10) {
    docC <- parseRaw(object, what="comment", commentLength=n);
    docC <- docC[names(docC) != "comment"];
    text <- unlist(docC, use.names=FALSE);
    text <- paste(text, collapse="");
    text <- RspString(text, type=getType(object));
    class(text) <- class(object);
    object <- text;
  } # for (n ...)

  # Split RSP text into non-nested blocks of RSP 'text' and 'rsp' chunks.
  doc <- parseRaw(object, what="expression");

  # Turn 'text' chunks into RspTexts
  doc <- coerceText(doc);

  # Turn 'text' chunks into RspExpressions
  doc <- coerceRsp(doc);

  # Turn 'comment' chunks into RspComments (which should be none!)
  doc <- coerceComments(doc);

  # Trim RspTexts
  doc <- trim(doc);

  # Merge any neighboring RspTexts
  doc <- mergeTexts(doc);

  # Process the RSP preprocessing directives, i.e. <%@...%>
  if (preprocess) {
    doc <- preprocess(doc, envir=envir, ...);
    doc <- mergeTexts(doc);
  }

  doc;
}, protected=TRUE) # parse()



##############################################################################
# HISTORY:
# 2013-02-19
# o RSP comments must be dropped by the RSP parser at the very beginning,
#   otherwise they cannot be nested.  All other RSP constructs must not
#   be nested.
# o Added support for RSP comments of format <%-+[{count}]%>', where {count}
#   specifies the maximum number of empty lines to drop after the comment,
#   including the trailing whitespace and newline of the current line.
#   If {count} is negative, it drops all but the last {count} empty rows.
#   If {count} is zero, nothing is dropped.
# 2013-02-18
# o BUG FIX: Preprocessing directives without attributes where not recognized.
# 2013-02-13
# o Added getType() for RspString.
# 2013-02-12
# o Added support for nested RSP comments, by introducing "different" RSP
#   comment styles: <%-- --%>, <%--- ---%>, <%---- ----%>, and so on.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
