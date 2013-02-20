###########################################################################/**
# @RdocClass RspDocument
#
# @title "The RspDocument class"
#
# \description{
#  @classhierarchy
#
#  An RspDocument represents a @list of @see "RspExpression":s.
# }
# 
# @synopsis
#
# \arguments{
#   \item{expressions}{A @list of @see "RspExpression":s and
#      @see "RspDocument":s.}
#   \item{type}{The content type of the RSP document.}
#   \item{source}{A reference to the source RSP document, iff any.}
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
setConstructorS3("RspDocument", function(expressions=list(), type=NA, source=NA, ...) {
  # Argument 'source':
  if (is.character(source)) {
    if (isUrl(source)) {
    } else {
      source <- getAbsolutePath(source);
    }
  }

  this <- extend(expressions, "RspDocument");
  attr(this, "type") <- as.character(type);
  attr(this, "source") <- source;
  this;
})



#########################################################################/**
# @RdocMethod print
#
# @title "Prints a summary of an RspDocument"
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
#  Returns nothing.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("print", "RspDocument", function(x, ...) {
  s <- sprintf("%s:", class(x)[1L]);
  s <- c(s, sprintf("Source: %s", getSource(x)));
  s <- c(s, sprintf("Total number of RSP expressions: %d", length(x)));
  types <- sapply(x, FUN=function(x) class(x)[1L]);
  tbl <- table(types);
  for (kk in seq_along(tbl)) {
    s <- c(s, sprintf("Number of %s(s): %d", names(tbl)[kk], tbl[kk]));
  }
  s <- c(s, sprintf("Content type: %s", getType(x)));
  s <- paste(s, collapse="\n");
  cat(s, "\n", sep="");
}, protected=TRUE)




#########################################################################/**
# @RdocMethod getType
#
# @title "Gets the type of the RspDocument"
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
setMethodS3("getType", "RspDocument", function(object, ...) {
  res <- attr(object, "type");
  if (is.null(res)) res <- as.character(NA);
  res;
}, protected=TRUE)



#########################################################################/**
# @RdocMethod getSource
#
# @title "Gets the source reference of an RSP document"
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
setMethodS3("getSource", "RspDocument", function(object, ...) {
  res <- attr(object, "source");
  if (is.null(res)) res <- as.character(NA);
  res;
}, protected=TRUE)



#########################################################################/**
# @RdocMethod getPath
#
# @title "Gets the path to the source reference of an RSP string"
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
setMethodS3("getPath", "RspDocument", function(object, ...) {
  pathname <- getSource(object, ...);
  if (is.na(pathname)) {
    path <- getwd();
  } else {
    path <- getParent(pathname);
  }
  path;
}, protected=TRUE)



#########################################################################/**
# @RdocMethod trim
#
# @title "Trims each of the RSP expressions"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{envir}{The @environment where the RSP document is evaluated.}
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
    endsWithNewline <- (regexpr("(\n|\r|\r\n)[ \t\v]*$", partsT[-length(partsT)]) != -1L);
    endsWithNewline <- which(endsWithNewline);

    # Any candidates?
    if (length(endsWithNewline) > 0L) {
      # Check the following text part
      nextT <- endsWithNewline + 1L;
      partsTT <- partsT[nextT];

      # Among those, which starts with a new line?
      startsWithNewline <- (regexpr("^[ \t\v]*(\n|\r|\r\n)", partsTT) != -1L);
      startsWithNewline <- nextT[startsWithNewline];

      # Any remaining candidates?
      if (length(startsWithNewline) > 0L) {
        # Trim matching text blocks
        endsWithNewline <- startsWithNewline - 1L;

        # Trim to the right (excluding new line because it belongs to text)
        partsT[endsWithNewline] <- sub("[ \t\v]*$", "", partsT[endsWithNewline]);

        # Trim to the left (drop also any new line because it then
        # belongs to preceeding RSP expression)
        partsT[startsWithNewline] <- sub("^[ \t\v]*(\n|\r|\r\n)", "", partsT[startsWithNewline]);

        for (kk in seq_along(partsT)) {
          value <- RspText(partsT[kk]);
          parts[[idxs[kk]]] <- value;
        }
      }
    }
    ## cat("TRIMMING...done\n");

    parts;
  } # trimTextParts()

  res <- trimTextParts(object);
##  class(res) <- class(object);

  res;
}, protected=TRUE) # trim()



#########################################################################/**
# @RdocMethod mergeTexts
#
# @title "Merge neighboring RspText:s"
#
# \description{
#  @get "title" by pasting them together.
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
# }
#
# \value{
#   Returns an @see "RspDocument" with equal or fever number of
#   @see "RspExpression":s.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("mergeTexts", "RspDocument", function(object, ...) {
  # All RSP text expressions
  isText <- sapply(object, FUN=inherits, "RspText");
  idxs <- which(isText);

  # Nothing todo?
  if (length(idxs) == 0L) {
    return(object);
  }

  # Locate neighboring RSP text expressions
  while (length(nidxs <- which(diff(idxs) == 1L)) > 0L) {
    idx <- idxs[nidxs[1L]];
    # Merge (idx,idx+1)
    texts <- object[c(idx,idx+1L)];
    text <- paste(texts, collapse="");
    class(text) <- class(texts[[1L]]);
    object[[idx]] <- text;

    # Drop
    object <- object[-(idx+1L)];
    isText <- isText[-(idx+1L)];
    idxs <- which(isText);
  }

  object;
}, protected=TRUE) # mergeTexts()



#########################################################################/**
# @RdocMethod flatten
#
# @title "Flattens an RspDocument"
#
# \description{
#  @get "title" by expanding and inserting the @list of 
#  @see "RspExpression"s for any @see "RspDocument".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns an @see "RspDocument" that contains only @see "RspExpression":s
#   (and no @see "RspDocument").
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("flatten", "RspDocument", function(object, ..., verbose=FALSE) {
  # Merge neighboring RspText objects
  object <- mergeTexts(object);

  # Nothing todo?
  idxs <- which(sapply(object, FUN=inherits, "RspDocument"));
  if (length(idxs) == 0L) {
    return(object);
  }

  res <- list();

  keys <- names(object);
  for (kk in seq_along(object)) {
    key <- keys[kk];
    expr <- object[[kk]];
    if (inherits(expr, "RspDocument")) {
      expr <- flatten(expr, ..., verbose=verbose);
    } else {
      expr <- list(expr);
      names(expr) <- key;
    }
    res <- append(res, expr);
  } # for (kk ...)

  class(res) <- class(object);
  attr(res, "type") <- getType(object);
  attr(res, "source") <- getSource(object);

  # Merge neighboring RspText objects
  res <- mergeTexts(res);

  res;
}, protected=TRUE) # flatten()



#########################################################################/**
# @RdocMethod preprocess
#
# @title "Processes all RSP preprocessing directives"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{recursive}{If @TRUE, any @see "RspDocument"s introduced via
#      preprocessing directives are recursively preprocessed as well.}
#   \item{flatten}{If @TRUE, any @see "RspDocument" introduced is
#      replaced (inserted and expanded) by its @list of 
#      @see "RspExpression"s.}
#   \item{envir}{The @environment where the preprocessing is evaluated.}
#   \item{...}{Not used.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#  Returns an @see "RspDocument".
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("preprocess", "RspDocument", function(object, recursive=TRUE, flatten=TRUE, envir=parent.frame(), ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local function
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  suffixSpecToCounts <- function(spec, ...) {
    if (is.null(spec)) {
      count <- 0L;
    } else if (spec == "") {
      count <- 1L;
    } else if (spec == "*") {
      count <- Inf;
    } else {
      count <- as.numeric(spec);
      if (is.na(count)) {
        throw(sprintf("Invalid count specifier in RSP comment (#%d): ", idx, spec));
      }
    }
    count;
  } # suffixSpecToCounts()

  getFileT <- function(expr, path=".", ..., index=NA, verbose=FALSE) {
    file <- getFile(expr);
    verbose && cat(verbose, "Attribute 'file': ", file);

    # URL?
    if (isUrl(file)) {
      verbose && cat(verbose, "URL: ", file);
      fh <- url(file);
      return(fh);
    }

    if (isAbsolutePath(file)) {
      pathname <- file;
    } else {
      verbose && cat(verbose, "Path: ", path);
      file <- file.path(path, file);
      verbose && cat(verbose, "File: ", file);
    }

    if (isUrl(file)) {
    } else {
      tryCatch({
        file <- Arguments$getReadablePathname(file);
      }, error = function(ex) {
        throw(sprintf("RSP '%s' preprocessing directive (#%d) specifies an non-existing 'file' (%s): %s", expr, index, file, gsub("Pathname not found: ", "", ex$message)));
      });
    }

    verbose && cat(verbose, "File: ", file);

    file;
  } # getFileT()


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'envir':
  stopifnot(!is.null(envir));

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "Preprocessing RSP document");
  verbose && cat(verbose, "Number of RSP expressions: ", length(object));

  # Identifying RSP preprocessing directives
  idxs <- which(sapply(object, FUN=inherits, "RspDirective"));
  verbose && cat(verbose, "Number of RSP preprocessing directives: ", length(idxs));

  # Number of empty lines to drop from RSP texts
  nbrOfEmptyTextLinesToDropNext <- 0L;
  
  untilStack <- list();
  for (idx in seq_along(object)) {
    expr <- object[[idx]];
    verbose && enter(verbose, sprintf("RSP expresson #%d ('%s') of %d", idx, class(expr)[1L], length(object)));

    if (verbose) {
      cat(verbose, "Number of if rules: ", length(untilStack));
      if (length(untilStack) > 0L) {
        rule <- untilStack[[1L]];
        until <- rule$until;
        include <- rule$include;
        if (include) {
          cat(verbose, "Including until ", until);
        } else {
          cat(verbose, "Excluding until ", until);
        }
      }
    } # if (verbose)


    # Number of empty lines to drop from RSP texts
    nbrOfEmptyTextLinesToDrop <- 0L;
    if (nbrOfEmptyTextLinesToDropNext != 0L) {
      nbrOfEmptyTextLinesToDrop <- nbrOfEmptyTextLinesToDropNext;
      nbrOfEmptyTextLinesToDropNext <- 0L;
    }


    # Get the suffix specifications
    spec <- getSuffixSpecs(expr);
    verbose && cat(verbose, "Suffix specifications: ", spec);
    if (!is.null(spec)) {
      # Expand specifications
      specT <- gstring(spec, envir=envir);
      if (specT != spec) {
        verbose && cat(verbose, "Expanded suffix specifications: ", specT);
        spec <- specT;
      }

      # Trim following RSP 'text' expression according to suffix specs?
      nbrOfEmptyTextLinesToDropNext <- suffixSpecToCounts(spec);
    }


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Exclude until a particular RspDirective, e.g. RspEndifDirective
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (length(untilStack) > 0L) {
      rule <- untilStack[[1L]];
      until <- rule$until;
      include <- rule$include;
      useElse <- rule$useElse;

      if (inherits(expr, "RspElseDirective")) {
        if (useElse) {
          verbose && printf(verbose, "Got %s directive.\n", until);
          # Reverse include rule
          rule$include <- !include;
          # No more RSP 'else' directive are allowed
          rule$useElse <- FALSE;
          untilStack[[1L]] <- rule;
          # Drop
          object[[idx]] <- NA;

          verbose && exit(verbose);
          next;
        }

        throw(sprintf("Detected a stray RSP 'else' directive (#%d) within RSP '%s' directive: %s", idx, rule$clause, as.character(expr)[1L]));
      }

      if (!include) {
        verbose && enter(verbose, sprintf("Excluding until %s", until));

        if (inherits(expr, until)) {
          verbose && printf(verbose, "Got %s directive.\n", until);
          untilStack <- untilStack[-1L];
        } else {
          verbose && printf(verbose, "Ignoring %s.\n", class(expr)[1L]);
        }

        # Drop
        object[[idx]] <- NA;
        verbose && exit(verbose);

        verbose && exit(verbose);
        next;
      }
    } # if (length(untilStack) > 0L)


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # RSP comments
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspComment")) {
      # Drop comment
      object[[idx]] <- NA;
      verbose && exit(verbose);
      next;
    } # RspComment



    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Keep RSP code expression as is
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspCode")) {
      verbose && exit(verbose);
      next;
    } # RspCode


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Keep RSP text as is, unless empty lines should be dropped
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspText")) {
      # Drop empty lines?
      if (nbrOfEmptyTextLinesToDrop != 0L) {
        text <- getText(expr);

        count <- nbrOfEmptyTextLinesToDrop;

        # Drop all but 'count' empty rows
        if (count < 0) {
          verbose && cat(verbose, "Number of empty lines to drop from the end: ", -count);
          # Count max number of empty rows
          patternR <- "([ \t\v]*(\n|\r|\r\n))*";
          posT <- regexpr(patternR, text);
          if (posT == 1L) {
            nT <- attr(posT, "match.length");
            bfrT <- substring(text, first=1L, last=nT);
            bfrT <- gsub("[ \t\v]*", "", bfrT);
            bfrT <- gsub("\r\n", "\n", bfrT);
            max <- nchar(bfrT);
          } else {
            max <- 0L;
          }

          count <- max + count;
          if (count < 0) count <- 0;
        }

        verbose && cat(verbose, "Number of empty lines to drop: ", count);

        # Drop lines?
        if (count != 0) {
          if (count == 1) {
            patternC <- "?";
          } else if (is.infinite(count)) {
            patternC <- "*";
          } else if (count > 1) {
            patternC <- sprintf("{0,%d}", count);
          }

          # Row pattern
          patternR <- sprintf("([ \t\v]*(\n|\r|\r\n))%s", patternC);

          # Drop empty lines
          text <- sub(patternR, "", text);
          # Update RspText object
          expr2 <- text;
          class(expr2) <- class(expr);
          object[[idx]] <- expr2;
        }
      } # if (nbrOfEmptyTextLinesToDrop != 0L)

      verbose && exit(verbose);
      next;
    } # RspText & RspCode


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Support GString-style attribute values for all RSP directives.
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspDirective")) {
      attrs <- getAttributes(expr);
      for (key in names(attrs)) {
        value <- attrs[[key]];
        value <- gstring(value, envir=envir);
        attr(expr, key) <- value;
      }
    }


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # RspIncludeDirective => ...
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspIncludeDirective")) {
      text <- getText(expr);
      if (is.null(text)) {
        file <- getFileT(expr, path=getPath(object), index=idx, verbose=verbose);
        text <- readLines(file, warn=FALSE);
      } else {
        file <- getSource(object);
      }
  
      # Parse RSP string to RSP document
      rstr <- RspString(text, type=getType(object), source=file);

      doc <- parse(rstr, envir=envir, verbose=verbose);

      verbose && cat(verbose, "Included RSP document:");
      verbose && print(verbose, doc);
  
      if (recursive) {
        verbose && enter(verbose, "Recursively preprocessing included RSP document");
        doc <- preprocess(doc, recursive=TRUE, flatten=flatten, envir=envir, ..., verbose=verbose);
        verbose && exit(verbose);
      }
  
      # Replace RSP directive with imported RSP document
      object[[idx]] <- doc;
  
      # Not needed anymore
      rm(rstr, text, doc);
  
      verbose && exit(verbose);
      next;
    } # RspIncludeDirective
  
  
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # RspDefineDirective => ...
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspDefineDirective")) {
      attrs <- getAttributes(expr);
      keys <- names(attrs);

      # Special case: Assign on variable with a default value
      n <- length(attrs);
      if (n == 2L && keys[2L] == "default") {

        default <- attrs[["default"]];
        key <- keys[1L];
        value <- attrs[[key]];
        if (is.na(value) || nchar(value) == 0L || value == "NA") {
          value <- default;
        }
        assign(key, value, envir=envir);
      } else {
        for (key in keys) {
          assign(key, attrs[[key]], envir=envir);
        }
      }
  
      # Drop RSP expression
      object[[idx]] <- NA;

      verbose && exit(verbose);
      next;
    } # RspDefineDirective
  
  
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # RspEvalDirective => ...
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspEvalDirective")) {
      language <- getLanguage(expr);
      file <- getFile(expr);
      text <- getText(expr);
      if (is.null(text) && is.null(file)) {
        throw(sprintf("RSP 'eval' preprocessing directive (#%d) requires either attribute 'file' or 'text'.", idx));
      }

      if (!is.null(file)) {
        file <- getFileT(expr, path=getPath(object), index=idx, verbose=verbose);
        text <- readLines(file, warn=FALSE);
      }

      verbose && print(verbose, getAttributes(expr));
  
      if (language == "R") {
        # Parse
        tryCatch({
          expr <- base::parse(text=text);
        }, error = function(ex) {
          throw("Failed to parse RSP 'eval' directive (language='R'): ", ex$message);
        })
  
        # Evaluate
        tryCatch({
          value <- eval(expr, envir=envir);
        }, error = function(ex) {
          throw("Failed to processes RSP 'eval' directive (language='R'): ", ex$message);
        })

        # Drop RSP expression
        object[[idx]] <- NA;

        verbose && exit(verbose);
        next;
      } # if (language == "R")


      if (language == "system") {
        # Evaluate code using system()
        tryCatch({
          value <- system(text, intern=TRUE);
        }, error = function(ex) {
          throw("Failed to processes RSP 'eval' directive (language='system'): ", ex$message);
        })

        # Drop RSP expression
        object[[idx]] <- NA;

        verbose && exit(verbose);
        next;
      } # if (language == "system")


      if (language == "shell") {
        # Evaluate code using shell()
        tryCatch({
          value <- shell(text, intern=TRUE);
        }, error = function(ex) {
          throw("Failed to processes RSP 'eval' directive (language='shell'): ", ex$message);
        })

        # Drop RSP expression
        object[[idx]] <- NA;

        verbose && exit(verbose);
        next;
      } # if (language == "shell")

    
      throw("Unsupported 'language' for RSP 'eval' directive: ", language);
    } # RspEvalDirective


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # RspPageDirective => ...
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspPageDirective")) {
      type <- getType(expr);

      # Set the type of the RSP document
      attr(object, "type") <- type;
  
      # Drop RSP expression
      object[[idx]] <- NA;

      verbose && exit(verbose);
      next;
    } # RspPageDirective


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Stray RSP 'else' directive?
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspElseDirective")) {
      throw(sprintf("Detected a stray RSP 'else' directive (#%d): %s", idx, as.character(expr)[1L]));
    }


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # RspIfDirective => ...
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspIfDirective")) {
      attrs <- getAttributes(expr);

      n <- length(attrs);
      if (n != 1L) {
        throw("RSP 'if' preprocessing directive must take exactly one attribute: ", hpaste(names(attrs)));
      }

      name <- names(attrs)[1L];
      gname <- sprintf("${%s}", name);
      value <- gstring(gname, envir=envir);
      target <- gstring(attrs[[1L]], envir=envir);

      if (inherits(expr, "RspIfeqDirective")) {
        include <- identical(value, target);
      } else if (inherits(expr, "RspIfneqDirective")) {
        include <- !identical(value, target);
      } else {
        throw(sprintf("Unknown RSP 'if' directive (#%d): %s", idx, as.character(expr)[1L]));
      }

      rule <- list(clause=expr, until="RspEndifDirective", include=include, useElse=TRUE);
      untilStack <- c(list(rule), untilStack);
  
      # Drop RSP expression
      object[[idx]] <- NA;

      verbose && exit(verbose);
      next;
    } # RspIfeqDirective
  

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Stray RSP 'unknown' directive?
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspUnknownDirective")) {
      throw(sprintf("Detected a stray RSP 'unknown' directive (#%d): %s", idx, as.character(expr)[1L]));
    }


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Including until a particular RspDirective, e.g. RspEndifDirective
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (length(untilStack) > 0L) {
      rule <- untilStack[[1L]];
      until <- rule$until;
      include <- rule$include;
      stopifnot(include);  # Sanity check

      if (inherits(expr, until)) {
        verbose && printf(verbose, "Got %s directive.\n", until);
        untilStack <- untilStack[-1L];
      }

      # Drop
      object[[idx]] <- NA;

      verbose && exit(verbose);
      next;
    }


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Stray RSP 'endif' directive?
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspEndifDirective")) {
      throw("Detected a stray RSP 'endif' preprocessing directive.");
    }
  

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Unknown RSP directive?
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspDirective")) {
      throw(sprintf("Unknown type of RSP preprocessing directive (#%d): %s", idx, class(expr)[1L]));
    }

    verbose && exit(verbose);
  } # for (idx ...)

  # Cleanup
  excl <- which(sapply(object, FUN=identical, NA));
  if (length(excl) > 0L) {
    object <- object[-excl];
  }

  # Merge neighboring RspText objects
  object <- mergeTexts(object);

  if (flatten) {
    verbose && enter(verbose, "Flatten RSP document");
    object <- flatten(object, verbose=less(verbose, 10));
    verbose && exit(verbose);
  }

  verbose && printf(verbose, "Returning RSP document with %d RSP expression.\n", length(object));

  verbose && exit(verbose);

  object;
}, protected=TRUE) # preprocess()



#########################################################################/**
# @RdocMethod "["
#
# @title "Subsets an RspDocument"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{i}{Indices of the RSP elements to extract.}
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns an @see "RspDocument".
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("[", "RspDocument", function(x, i) {
  # Preserve the class and other attributes
  res <- .subset(x, i);
  class(res) <- class(x);
  attr(res, "type") <- getType(x);
  attr(res, "source") <- getSource(x);
  res;
}, protected=TRUE)


##############################################################################
# HISTORY:
# 2013-02-19
# o Now support suffix comment specifications for all RSP expressions.
# o Added mergeTexts() for RspDocument.
# o Added support for <%@ifeq ...%> ... <%@else%> ... <%@endif%> directives.
# 2013-02-14
# o Now RspDocument can include URLs as well.
# 2013-02-13
# o Added getType() for RspDocument.
# o Added support for language:s 'system' and 'shell' for RspEvalDirective.
# o Added print(), preprocess() and flatten() for RspDocument.
# 2013-02-09
# o Created.
##############################################################################
