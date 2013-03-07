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
#   \item{annotation}{A named @list of other content annotations.}
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
setConstructorS3("RspString", function(str=character(), ..., type=NA, source=NA,  annotation=list()) {
  # Argument 'str':
  str <- paste(c(str, ...), collapse="\n");

  # Argument 'source':
  if (is.character(source)) {
    if (isUrl(source)) {
    } else {
      source <- getAbsolutePath(source);
    }
  }

  this <- extend(str, "RspString");
  attr(this, "type") <- as.character(type);
  attr(this, "source") <- source;
  attr(this, "annotation") <- annotation;
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
# @RdocMethod getAnnotation
#
# @title "Gets the annotation of the RspDocument"
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
setMethodS3("getAnnotation", "RspString", function(object, name=NULL, ...) {
  res <- attr(object, "annotation");
  if (is.null(res)) res <- list();
  if (!is.null(name)) {
    res <- res[[name]];
  }
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
#   \item{what}{A @character string specifying what type of RSP construct
#     to parse for.}
#   \item{commentLength}{Specify the number of hypens in RSP comments
#     to parse for.}
#   \item{...}{Not used.}
#   \item{verbose}{See @see "R.utils::Verbose".}
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
setMethodS3("parseRaw", "RspString", function(object, what=c("comment", "directive", "expression"), commentLength=-1L, ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'what':
  what <- match.arg(what);

  # Argument 'commentLength':
  commentLength <- as.integer(commentLength);
  stopifnot(is.finite(commentLength));
  stopifnot(commentLength == -1L || commentLength >= 2L);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "Raw parsing of RSP string");
  verbose && cat(verbose, "What to parse for: ", what);

  # Work with one large character string
  bfr <- paste(object, collapse="\n", sep="");

  verbose && cat(verbose, "Length of RSP string: ", nchar(bfr));

  # Pattern for suffix specification
  patternS <- "[-]+(\\[([^]]*)\\])?%>";

  # Setup the regular expressions for start and stop RSP constructs
  if (what == "comment") {
    if (commentLength == -1L) {
      patternL <- "<%([-]+(\\[[^]]*\\])?%>)()";
      patternR <- NULL;
    } else {
      patternL <- sprintf("<%%-{%d}()([^-])", commentLength);
      patternR <- sprintf("(|[^-])(-{%d}(\\[[^]]*\\])?)%%>", commentLength);
    }
    bodyClass <- RspComment;
  } else if (what == "directive") {
    patternL <- "<%@()()";
    patternR <- "()(|-(\\[[^]]*\\])?)%>";
    bodyClass <- RspUnparsedDirective;
  } else if (what == "expression") {
    patternL <- "<%()()";
    patternR <- "()(|-(\\[[^]]*\\])?)%>";
    bodyClass <- RspUnparsedExpression;
  }

  if (verbose) {
    cat(verbose, "Regular expression patterns to use:");
    str(verbose, list(patternL=patternL, patternR=patternR, patternS=patternS));
    cat(verbose, "Class to coerce to: ", class(bodyClass())[1L]);
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
      bfrX <- gsub(patternL, "\\4", tag);
      nL <- nL - nchar(bfrX);

      text <- substring(bfr, first=1L, last=posL-1L);
     
      # Add RSP text, unless empty.
      if (nchar(text) > 0L) {
        part <- list(text=RspText(text));
      } else {
        part <- NULL;
      }

      if (is.null(patternR)) {
        body <- "";

        # Extract the '<%...%>' part
        tail <- substring(bfr, first=posL, last=posL+nL-1L);
        # Extract the '...%>' part
        tail <- gsub(patternL, "\\1", tail);

        # Get optional suffix specifications, i.e. '-[{specs}]%>'
        if (regexpr(patternS, tail) != -1L) {
          suffixSpecs <- gsub(patternS, "\\2", tail);
          verbose && printf(verbose, "Identified suffix specification: '%s'\n", suffixSpecs);
          attr(body, "suffixSpecs") <- suffixSpecs;
        } else {
          verbose && cat(verbose, "Identified suffix specification: <none>");
        }

        if (what == "comment") {
          attr(body, "commentLength") <- commentLength;           
        }

        if (!is.null(bodyClass)) {
          body <- bodyClass(body);
        }
        part2 <- list(rsp=body);
        if (what != "expression") {
          names(part2)[1L] <- what;
        }
        part <- c(part, part2);
        state <- START;
      } else {
        state <- STOP;
      }
      bfr <- substring(bfr, first=posL+nL);
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
      if (regexpr(patternS, tail) == 1L) {
        suffixSpecs <- gsub(patternS, "\\2", tail);
        verbose && printf(verbose, "Identified suffix specification: '%s'\n", suffixSpecs);
        attr(body, "suffixSpecs") <- suffixSpecs;
      } else {
        verbose && cat(verbose, "Identified suffix specification: <none>");
      }

      if (what == "comment") {
        attr(body, "commentLength") <- commentLength;           
      }

      if (!is.null(bodyClass)) {
        body <- bodyClass(body);
      }

      part <- list(rsp=body);
      if (what != "expression") {
        names(part)[1L] <- what;
      }
      bfr <- substring(bfr, first=posR+nR);

      state <- START;
    } # if (state == ...)

    parts <- c(parts, part);
    verbose && cat(verbose, "Number of RSP constructs parsed: ", length(parts));
  } # while(TRUE);

  # Add the rest of the buffer as text, unless empty.
  if (nchar(bfr) > 0L) {
    text <- RspText(bfr);
    parts <- c(parts, list(text=text));
  }
  verbose && cat(verbose, "Total number of RSP constructs parsed: ", length(parts));

  # Setup results
  doc <- RspDocument(parts, type=getType(object), source=getSource(object), annotation=getAnnotation(object));
  attr(doc, "what") <- what;

  verbose && exit(verbose);

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
#   \item{envir}{The @environment where the RSP document is preprocessed.}
#   \item{...}{Passed to the processor in each step.}
#   \item{until}{Specifies how far the parse should proceed, which is useful
#      for troubleshooting and rebugging.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#  Returns a @see "RspDocument" (unless \code{until != "*"} in case it
#  returns a deparsed @see "RspString".)
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("parse", "RspString", function(object, envir=parent.frame(), ..., until=c("*", "end", "expressions", "directives", "comments"), verbose=FALSE) {
  # Load the package (super quietly), in case R.rsp::nnn() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'until':
  until <- match.arg(until);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "Parsing RSP string");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # (1a) Parse and drop "empty" RSP comments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  verbose && enter(verbose, "Dropping 'empty' RSP comments");
  verbose && cat(verbose, "Length of RSP string before: ", nchar(object));

  doc <- parseRaw(object, what="comment", commentLength=-1L, verbose=less(verbose, 50));

  idxs <- which(sapply(doc, FUN=inherits, "RspComment"));
  count <- length(idxs);

  # Empty comments found?
  if (count > 0L) {
    verbose && print(verbose, doc);

    # Preprocess, drop RspComments and adjust for empty lines
    doc <- preprocess(doc, verbose=less(verbose, 10));
    verbose && print(verbose, doc);

    verbose && cat(verbose, "Number of 'empty' RSP comments dropped: ", count);

    # Coerce to RspString
    object <- asRspString(doc);
    verbose && cat(verbose, "Length of RSP string after: ", nchar(object));
  } else {
    verbose && cat(verbose, "No 'empty' RSP comments found.");
  }

  verbose && exit(verbose);

  if (until == "comments") {
    verbose && exit(verbose);
    return(object);
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # (1b) Parse and drop RSP comments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  verbose && enter(verbose, "Dropping 'paired' RSP comments");
  verbose && cat(verbose, "Length of RSP string before: ", nchar(object));

  count <- 0L;
  posL <- -1L;
  while ((pos <- regexpr("<%[-]+", object)) != -1L) {
    # Nothing changed? (e.g. if there is an unclosed comment)
    if (identical(pos, posL)) {
      break;
    }

    # Identify the comment length of the first comment found
    n <- attr(pos, "match.length") - 2L;
    stopifnot(n >= 2L);

    verbose && printf(verbose, "Number of hypens of first comment found: %d\n", n);

    # Find all comments of this same length
    doc <- parseRaw(object, what="comment", commentLength=n, verbose=less(verbose, 50));

    idxs <- which(sapply(doc, FUN=inherits, "RspComment"));
    count <- count + length(idxs);

    # Preprocess (=drop RspComments and adjust for empty lines)
    doc <- preprocess(doc, verbose=less(verbose, 10));

    # Coerce to RspString
    object <- asRspString(doc);

    posL <- pos;
    rm(doc);
  }

  if (count > 0L) {
    verbose && cat(verbose, "Number of 'paired' RSP comments dropped: ", count);
    verbose && cat(verbose, "Length of RSP string after: ", nchar(object));
  } else {
    verbose && cat(verbose, "No 'paired' RSP comments found.");
  }

  verbose && exit(verbose);


  if (until == "directives") {
    verbose && exit(verbose);
    return(object);
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # (2a) Parse RSP preprocessing directive
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  verbose && enter(verbose, "Processing RSP preprocessing directives");
  verbose && cat(verbose, "Length of RSP string before: ", nchar(object));

  doc <- parseRaw(object, what="directive", verbose=less(verbose, 50));
  idxs <- which(sapply(doc, FUN=inherits, "RspUnparsedDirective"));
  if (length(idxs) > 0L) {
    verbose && cat(verbose, "Number of (unparsed) RSP preprocessing directives found: ", length(idxs));

    # Parse each of them
    for (idx in idxs) {
      doc[[idx]] <- parse(doc[[idx]]);
    }

    # Trim non-text RSP constructs
    doc <- trimNonText(doc, verbose=less(verbose, 10));
  
    # Process all RSP preprocessing directives, i.e. <%@...%>
    doc <- preprocess(doc, envir=envir, ..., verbose=less(verbose, 10));
    
    # Coerce to RspString
    object <- asRspString(doc);
    verbose && cat(verbose, "Length of RSP string after: ", nchar(object));
  } else {
    verbose && cat(verbose, "No RSP preprocessing directives found.");
  }
  rm(doc, idxs);

  verbose && exit(verbose);

  if (until == "expressions") {
    verbose && exit(verbose);
    return(object);
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # (3) Parse RSP expressions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  verbose && enter(verbose, "Processing RSP expressions");
  verbose && cat(verbose, "Length of RSP string before: ", nchar(object));

  doc <- parseRaw(object, what="expression", verbose=less(verbose, 50));
  idxs <- which(sapply(doc, FUN=inherits, "RspUnparsedExpression"));

  if (length(idxs) > 0L) {
    verbose && cat(verbose, "Number of (unparsed) RSP expressions found: ", length(idxs));

    # Parse them
    for (idx in idxs) {
      doc[[idx]] <- parse(doc[[idx]]);
    }

    # Trim non-text RSP constructs
    doc <- trimNonText(doc, verbose=less(verbose, 10));

    # Preprocess (=trim all empty lines)
    doc <- preprocess(doc, envir=envir, ..., verbose=less(verbose, 10));

    if (verbose && isVisible(verbose)) {
      object <- asRspString(doc);
      verbose && cat(verbose, "Length of RSP string after: ", nchar(object));
    }
  } else {
    verbose && cat(verbose, "No RSP expressions found.");
  }

  verbose && exit(verbose);

  if (until == "end") {
    object <- asRspString(doc);
    verbose && exit(verbose);
    return(object);
  }

  verbose && exit(verbose);

  doc;
}, protected=TRUE) # parse()



##############################################################################
# HISTORY:
# 2013-03-07
# o Added annotation attributes to RspString and RspDocument.
# 2013-02-23
# o Now parseRaw() always ignores empty text, i.e. it never adds an
#   empty RspText object.
# o Readded trim() at the end of parse().
# o Added verbose output to parse().
# o Replaced argument 'preprocess' with 'until' for parse().
# 2013-02-22
# o Major update of parse() for RspString to the state where RSP comments
#   can contain anything, RSP preprocessing directives can be located 
#   anywhere including inside RSP expressions (but not inside RSP comments).
#   This means that it is possible to for instance dynamically include code
#   into an RSP code expression using and <%@include ...%> directive.
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
