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
#   \item{...}{Not used.}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
# 
# @author
#*/###########################################################################
setConstructorS3("RspDocument", function(expressions=list(), ...) {
  extend(expressions, "RspDocument");
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
  s <- c(s, sprintf("Total number of RSP expressions: %d", length(x)));
  types <- sapply(x, FUN=function(x) class(x)[1L]);
  tbl <- table(types);
  for (kk in seq_along(tbl)) {
    s <- c(s, sprintf("Number of %s(s): %d", names(tbl)[kk], tbl[kk]));
  }
  s <- paste(s, collapse="\n");
  cat(s, "\n", sep="");
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
  readFile <- function(file, envir=parent.frame(), ..., directive=NA, index=NA) {
    # Support @(include|eval) file="$VAR"
    # Note that 'VAR' must exist when parsing the RSP string.
    # In other words, it cannot be set from within the RSP string!
    pattern <- "^[$]([abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0-9]*)$";
    if (regexpr(pattern, file) != -1L) {
      key <- gsub(pattern, "\\1", file);
      if (exists(key, mode="character", envir=envir)) {
        file <- get(key, mode="character", envir=envir);
        if (nchar(file) == 0L) {
          throw(sprintf("RSP '%s' preprocessing directive (#%d) has a 'file' attribute given by an R variable ('$%s') that is empty.", directive, kk, key));
        }
      } else {
        file <- Sys.getenv(key);
        if (nchar(file) == 0L) {
          throw(sprintf("RSP '%s' preprocessing directive (#%d) has a 'file' attribute that specifies ('$%s') neither an existing R character variable nor an existing system environment variable.", directive, kk, key));
        }
      }
    }

    if (isUrl(file)) {
      fh <- url(file);
      lines <- readLines(fh);
    } else {
      file <- getAbsolutePath(file);
      if (!isFile(file)) {
        throw(sprintf("RSP '%s' preprocessing directive (#%d) specifies an non-existing file: %s", directive, kk, file));
      }
      lines <- readLines(file); 
    }

    lines;
  } # readFile()


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

  for (kk in seq_along(idxs)) {
    idx <- idxs[kk];
    expr <- object[[idx]];
    verbose && enter(verbose, sprintf("RSP directive #%d ('%s') of %d", kk, class(expr)[1L], length(idxs)));

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # RspIncludeDirective => ...
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspIncludeDirective")) {
      file <- getFile(expr);
  
      lines <- readFile(file, envir=envir, directive="include", index=idx);
  
      # Parse RSP string to RSP document
      rstr <- RspString(lines);
      doc <- parse(rstr);
      verbose && printf(verbose, "Included RSP document with %d RSP expressions.\n", length(doc));
  
      if (recursive) {
        verbose && enter(verbose, "Recursively preprocessing included RSP document");
        doc <- preprocess(doc, recursive=TRUE, flatten=flatten, envir=envir, ..., verbose=verbose);
        verbose && exit(verbose);
      }
  
      # Replace RSP directive with imported RSP document
      object[[idx]] <- doc;
  
      # Not needed anymore
      rm(rstr, lines, doc);
  
      verbose && exit(verbose);
      next;
    } # RspIncludeDirective
  
  
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # RspDefineDirective => ...
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if (inherits(expr, "RspDefineDirective")) {
      attrs <- getAttributes(expr);
      for (key in names(attrs)) {
        assign(key, attrs[[key]], envir=envir);
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
        text <- readFile(file, envir=envir, directive="include", index=idx);
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

  
    throw(sprintf("Unknown type of RSP preprocessing directive (#%d): %s",
                                                       idx, class(expr)[1L]));
  } # for (kk ...)

  # Cleanup
  excl <- which(sapply(object, FUN=identical, NA));
  if (length(excl) > 0L) {
    class <- class(object);
    object <- object[-excl];
    class(object) <- class;
  }

  if (flatten) {
    verbose && enter(verbose, "Flatten RSP document");
    object <- flatten(object, verbose=less(verbose, 10));
    verbose && exit(verbose);
  }

  verbose && printf(verbose, "Returning RSP document with %d RSP expression.\n", length(object));

  verbose && exit(verbose);

  object;
}, protected=TRUE) # preprocess()



##############################################################################
# HISTORY:
# 2013-02-13
# o Added support for language:s 'system' and 'shell' for RspEvalDirective.
# o Added print(), preprocess() and flatten() for RspDocument.
# 2013-02-09
# o Created.
##############################################################################
