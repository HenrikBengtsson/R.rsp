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
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
# 
# @author
#*/###########################################################################
setConstructorS3("RspString", function(str=character(), ...) {
  extend(c(str, ...), "RspString");
})



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
setMethodS3("dropComments", "RspString", function(object, ...) {
  ## <%-- comment \n comment --%>
  dropRspComments <- function(rspCode, trimNewline=TRUE, ...) {
    pattern <- "<%--.*?--%>";
    if (trimNewline) {
      pattern <- sprintf("%s(|[ \t\v]*(\n|\r|\r\n))", pattern);
    }
    gsub(pattern, "", rspCode, ...);
  } # dropRspComments()

  ## <%-%>
  dropRspEmptyComments <- function(rspCode, trimNewline=TRUE, ...) {
    pattern <- "<%-%>";
    if (trimNewline) {
      pattern <- sprintf("%s(|[ \t\v]*(\n|\r|\r\n))", pattern);
    }
    gsub(pattern, "", rspCode, ...);
  } # dropRspComments()

  ## <%# comment \n comment %>
  dropBrewComments <- function(rspCode, trimNewline=FALSE, ...) {
    pattern <- "<%#.*%>";
    if (trimNewline) {
      pattern <- sprintf("%s(|[ \t\v]*(\n|\r|\r\n))", pattern);
    }
    gsub(pattern, "", rspCode, ...);
  } # dropBrewComments()

  rspCode <- paste(object, collapse="\n");
  rspCode <- dropRspComments(rspCode, trimNewline=TRUE, ...);
  rspCode <- dropRspEmptyComments(rspCode, trimNewline=TRUE, ...);

  if (getOption("rsp/emulateBrew", FALSE)) {
    rspCode <- dropBrewComments(rspCode, trimNewline=TRUE, ...);
  }

  class(rspCode) <- class(object);
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
        pos <- indexOfNonQuoted(bfr, "%>");
        if (pos == -1L)
          break;

        trimNewline <- FALSE;
        if (getOption("rsp/emulateBrew", FALSE)) {
          trimNewline <- (substring(bfr, first=pos-1L, last=pos-1L) == "-");
        }

        # Trim trailing white space and newline from RSP tag?
        if (trimNewline) {
          rsp <- substring(bfr, first=1L, last=pos-2L);
          part <- list(rsp=trim(rsp));
          bfr <- substring(bfr, first=pos+2L);
          pattern <- "^[ \t\v]*(\n|\r|\r\n)";
          bfr <- gsub(pattern, "", bfr);
        } else {
          rsp <- substring(bfr, first=1L, last=pos-1L);
          part <- list(rsp=trim(rsp));
          bfr <- substring(bfr, first=pos+2L);
        }

        state <- START;
      }

      parts <- c(parts, part);
    } # while(TRUE);

    # Add the rest of the buffer as text
    parts <- c(parts, list(text=bfr));
  
    parts;
  } # splitRspTags() 

  code <- paste(object, collapse="\n");
  expr <- splitRspTags(code, ...);
  RspDocument(expr);
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
setMethodS3("parse", "RspString", function(object, ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local function
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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
      if (nchar(bfr) >= 0L) {
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
        part <- RspCodeChunkWithReturn(code);
        object[[kk]] <- part;
        next;
      } 
  
  
      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      # RSP Directives
      #
      # <%@directive attr1="foo" attr2="bar" ...%>
      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      pattern <- "^@[ ]*([abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ][abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0-9]*)[ ]+(.*)$";
      if (regexpr(pattern, part) != -1L) {
        # <%@foo attr1="bar" attr2="geek"%> => ...
        directive <- gsub(pattern, "\\1", part);
        attrs <- gsub(pattern, "\\2", part);
        attrs <- parseAttributes(attrs, known=NULL);
        class <- sprintf("Rsp%sDirective", capitalize(tolower(directive)));
        clazz <- Class$forName(class);
        part <- newInstance(clazz, attributes=attrs);
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
      part <- RspCode(rspCode);
      object[[kk]] <- part;
    } # for (kk ...)
  
    object; 
    } # coerceRsp()


  object <- dropComments(object);
  expr <- parseRaw(object);
  expr <- coerceText(expr);
  expr <- coerceRsp(expr);
  expr <- trim(expr);

  expr;
}, protected=TRUE) # parse()



##############################################################################
# HISTORY:
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
