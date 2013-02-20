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
setMethodS3("parseRaw", "RspString", function(object, ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local function
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  splitRspTags <- function(...) {
    bfr <- paste(..., collapse="\n", sep="");
  
    START <- 0L;
    STOP <- 1L;

    parts <- list();
    state <- START;
    while(TRUE) {
      if (state == START) {
        # The start tag may exists *anywhere* in static code
        pos <- regexpr("<%", bfr);
        if (pos == -1L)
          break;

        part <- list(text=substring(bfr, first=1L, last=pos-1L));
        bfr <- substring(bfr, first=pos+2L);
        state <- STOP;
      } else if (state == STOP) {

        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        # Is it an RSP comment?
        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        pos <- regexpr("^([-]+)", bfr);
        if (pos == 1L) {
          # Length in comment prefix
          nPrefix <- attr(pos, "match.length");
          bfrT <- substring(bfr, first=1L+nPrefix);

          if (nPrefix == 1L) {
            types <- c("empty")
          } else {
            types <- c("empty", "paired")
          }

          part <- NULL;
          for (type in types) {
            part <- NULL;
            if (type == "empty") {
              # <%-[{count}]%>, <%--[{count}]%>, <%---[{count}]%>, ...
              pattern <- "()()(\\[[^]]*\\])?(%>)(.*)";
            } else if (type == "paired") {
              # <%-{n} comment \n comment -{n}%>, where n >= 2
              pattern <- sprintf("^(|.*[^-])([-]{%d})(\\[[^]]*\\])?(%%>)(.*)", nPrefix);
            }

            pos <- regexpr(pattern, bfrT);
            if (pos == 1L) {
              comment <- gsub(pattern, "\\1", bfrT);

              suffix <- gsub(pattern, "\\2", bfrT);
              nSuffix <- nchar(suffix);

              suffixSpecs <- gsub(pattern, "\\3", bfrT);
              nSuffixSpecs <- nchar(suffixSpecs);

              tail <- gsub(pattern, "\\4", bfrT);
              nTail <- nchar(tail);

              # Regular expressions are greedy, so we might have
              # matched too far.  Does the comment contain a match?
              while ((posT <- regexpr(pattern, comment)) == 1L) {
                comment <- gsub(pattern, "\\1", comment);
              }
              nComment <- nchar(comment);

              prefix <- substring(bfr, first=1L, last=nPrefix);
              attr(comment, "delimiters") <- c(prefix, suffix);
              attr(comment, "suffixSpecs") <- suffixSpecs;

              part <- list(comment=comment);
              bfr <- substring(bfrT, first=nComment+nSuffix+nSuffixSpecs+nTail+1L);
              break;
            }
          } # for (type ...)

          # Found a comment?
          if (!is.null(part)) {
            state <- START;
            parts <- c(parts, part);
            next;
          }
        } # if (pos == 1L) # Is it an RSP comment?


        pos <- indexOfNonQuoted(bfr, "%>");
        if (pos == -1L)
          break;

        # Extract RSP body
        body <- substring(bfr, first=1L, last=pos-1L);

        # Check for suffix comment specifications, i.e. '-[{specs}]%>'
        patternR <- "(.*)-(\\[[^]]*\\])?$";
        if ((posR <- regexpr(patternR, body)) != -1L) {
          suffixSpecs <- gsub(patternR, "\\2", body);
          rsp <- gsub(patternR, "\\1", body);
          attr(rsp, "suffixSpecs") <- suffixSpecs;
        } else {
          rsp <- body;
        }
      
        part <- list(rsp=rsp);
        bfr <- substring(bfr, first=pos+2L);

        state <- START;
      } # if (state == ...)

      parts <- c(parts, part);
    } # while(TRUE);

    # Add the rest of the buffer as text
    parts <- c(parts, list(text=bfr));
  
    parts;
  } # splitRspTags() 

  code <- paste(object, collapse="\n");
  expr <- splitRspTags(code, ...);
  RspDocument(expr, type=getType(object), source=getSource(object));
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


##  object <- dropComments(object, envir=envir);
  doc <- parseRaw(object);
  doc <- coerceComments(doc);
  doc <- coerceText(doc);
  doc <- coerceRsp(doc);
  doc <- trim(doc);
  doc <- mergeTexts(doc);

  if (preprocess) {
    doc <- preprocess(doc, envir=envir, ...);
    doc <- mergeTexts(doc);
  }

  doc;
}, protected=TRUE) # parse()



##############################################################################
# HISTORY:
# 2013-02-19
# o Now RSP comments are parsed and part of the resulting RspDocument as
#   RspComment:s, which are RspExpression:s.  This was mainly done for
#   the purpose of generalizing white-space trimming after RspExpressions.
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
