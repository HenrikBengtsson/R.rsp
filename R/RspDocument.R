setConstructorS3("RspDocument", function(expressions=list(), ...) {
  extend(expressions, "RspDocument");
})

setMethodS3("evaluate", "RspDocument", function(object, envir=parent.frame(), ...) {
  rCode <- toR(object);
  evaluate(rCode, envir=envir, ...);
}) # evaluate()


setMethodS3("trim", "RspDocument", function(object, ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local function
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  trimTextParts <- function(parts, ...) {
    ## cat("TRIMMING...\n");
    # Identify RSP-only lines by looking at the preceeding
    # and succeeding text parts of each RSP part

    # This code assumes that the first and the last part in 'parts'
    # is always a "text" part.
    stopifnot(names(parts)[1] == "text");
    stopifnot(names(parts)[length(parts)] == "text");

    # Identify all text parts
    idxs <- which(names(parts) == "text");
    partsT <- unlist(parts[idxs], use.names=FALSE);

    # Find text parts that ends with a new line
    endsWithNewline <- (regexpr("(\n|\r|\r\n)[ \t\v]*$", partsT[-length(partsT)]) != -1);
    endsWithNewline <- which(endsWithNewline);

    # Any candidates?
    if (length(endsWithNewline) > 0) {
      # Check the following text part
      nextT <- endsWithNewline + 1L;
      partsTT <- partsT[nextT];

      # Among those, which starts with a new line?
      startsWithNewline <- (regexpr("^[ \t\v]*(\n|\r|\r\n)", partsTT) != -1);
      startsWithNewline <- nextT[startsWithNewline];

      # Any remaining candidates?
      if (length(startsWithNewline) > 0) {
        # Trim matching text blocks
        endsWithNewline <- startsWithNewline - 1L;

        # Trim to the right (excluding new line because it belongs to text)
        partsT[endsWithNewline] <- sub("[ \t\v]*$", "", partsT[endsWithNewline]);

        # Trim to the left (including new line because it belongs to RSP)
        partsT[startsWithNewline] <- sub("^[ \t\v]*(\n|\r|\r\n)", "", partsT[startsWithNewline]);

        parts[idxs] <- partsT;
      }
    }
    ## cat("TRIMMING...done\n");

    parts;
  } # trimTextParts()


  trimRspParts <- function(parts, ...) {
    idxs <- which(names(parts) == "rsp");
    parts[idxs] <- lapply(parts[idxs], FUN=trim);
    parts;
  } # trimRspParts()

  object <- trimTextParts(object);
  object <- trimRspParts(object);

}, protected=TRUE) # trim()


setMethodS3("parseText", "RspDocument", function(object, ...) {
  idxs <- which(names(object) == "text");
  for (kk in idxs) {
    part <- object[[kk]];
    part <- RspText(part);
    object[[kk]] <- part;
  }
  object;
}, protected=TRUE) # parseText()


setMethodS3("parseRsp", "RspDocument", function(object, ...) {
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
      part <- RspEqualExpression(code);
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
}, protected=TRUE) # parseRsp()



setMethodS3("toR", "RspDocument", function(object, engine=RRspEngine(), ...) {
  # Argument 'engine':
  engine <- Arguments$getInstanceOf(engine, "RspEngine");

  # Coerce all RspExpression:s to R code
  code <- lapply(object, FUN=function(expr) {
    res <- toR(engine, expr);
    # Was an RspDocument inserted/added?
    if (inherits(res, "RspDocument")) {
      res <- toR(res, engine=engine, ...);
    }
    res;
  });
  code <- unlist(code, use.names=FALSE);
  RCode(code);
}) # toR()


##############################################################################
# HISTORY:
# 2013-02-09
# o Created.
##############################################################################
