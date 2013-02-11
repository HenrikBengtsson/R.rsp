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
#  Returns a named @list.
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
          part <- list(rsp=substring(bfr, first=1L, last=pos-2L));
          bfr <- substring(bfr, first=pos+2L);
          pattern <- "^[ \t\v]*(\n|\r|\r\n)";
          bfr <- gsub(pattern, "", bfr);
        } else {
          part <- list(rsp=substring(bfr, first=1L, last=pos-1L));
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
  object <- dropComments(object);
  expr <- parseRaw(object);
  expr <- trim(expr);
  expr <- parseText(expr);
  expr <- parseRsp(expr);
  expr;
}, protected=TRUE) # parse()



#########################################################################/**
# @RdocMethod toR
#
# @title "Parses and translates the RSP string into R code"
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
#  Returns the code as an @see "RCode".
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("toR", "RspString", function(object, ...) {
  expr <- parse(object);
  toR(expr);
}, protected=TRUE) # toR()



#########################################################################/**
# @RdocMethod evaluate
#
# @title "Parses, translates, and evaluates the RSP string"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{envir}{The @environment where the RSP string is evaluated.}
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns the last evaluated expression, iff any.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("evaluate", "RspString", function(object, envir=parent.frame(), ...) {
  rCode <- toR(object);
  # TO FIX!!!
  evaluate(rCode, envir=envir, ...);
}) # evaluate()



##############################################################################
# HISTORY:
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
