extentionToIMT <- function(filename) {
  ext <- gsub(".*[.]([^.]+)$", "\\1", filename);
  ext <- tolower(ext);
  map <- c(
    "txt" = "text/plain",
    "tex" = "application/x-latex",
    "rsp" = "application/x-rsp"
  );
  map[ext];
} # extentionToIMT()


escapeRspContent <- function(s, srcCT, targetCT, verbose=FALSE) {
  ct <- list(src=srcCT, target=targetCT);

  if (!is.list(ct$src)) {
    ct$src <- parseInternetMediaType(ct$src);
  }
  if (!is.list(ct$target)) {
    ct$target <- parseInternetMediaType(ct$target);
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # (1a) Validate the source content type
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  knownSourceTypes <- c("text/plain", "application/x-rsp", "application/x-latex", "application/x-tex");
  if (!is.element(ct$src$contentType, knownSourceTypes)) {
    msg <- sprintf("Source content type '%s' is unknown.  Will use 'text/plain' for escaping.", ct$src$contentType);
    warning(msg);
    verbose && cat(verbose, msg);
    ct$src <- parseInternetMediaType("text/plain");
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # (1b) Validate the target content type
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  knownTargetTypes <- c("text/plain", "application/x-latex", "application/x-tex");
  if (!is.element(ct$target$contentType, knownTargetTypes)) {
    msg <- sprintf("Target content type '%s' is unknown.  Will use 'text/plain' for escaping.", ct$target$contentType);
    warning(msg);
    verbose && cat(verbose, msg);
    ct$target <- parseInternetMediaType("text/plain");
  }

  
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # (2) "Merge" content types with the same escape rules
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  for (key in names(ct)) {
    type <- ct[[key]]$contentType;
    type <- sub("application/x-latex", "application/x-tex", type);
    ct[[key]]$contentType <- type;
  }



  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # (3) Escape text from source to target content type
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  srcArgs <- ct$src$args;
  srcArgsS <- paste(paste(names(srcArgs), srcArgs, sep="="), collapse=" ");
  targetArgs <- ct$target$args;
  targetArgsS <- paste(paste(names(targetArgs), targetArgs, sep="="), collapse=" ");

  verbose && printf(verbose, "Translating content of type '%s' (%s) into type '%s' (%s).\n", ct$src$contentType, srcArgsS, ct$target$contentType, targetArgsS);


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 'text/plain' -> ...
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (ct$src$contentType == "text/plain") {
    if (ct$target$contentType == "text/plain") {
      s <- gsub("<%", "<%%", s, fixed=TRUE);
      s <- gsub("%>", "%%>", s, fixed=TRUE);
    } else if (ct$target$contentType == "application/x-tex") {
      env <- ct$src$args["environment"];
      if (is.null(env) || is.na(env)) env <- "";
      env <- unlist(strsplit(env, split=",", fixed=TRUE));
      env <- trim(env);
      if (is.element("math", env)) {
      }
      replace <- c("&"="\\&", "%"="\\%", "$"="\\$", "#"="\\#", 
                   "_"="\\_", "{"="\\{", "}"="\\}", 
                   "~"="\\~", "^"="\\^", "\\"="\\\\");  # <== ?
      search <- names(replace);
      for (ii in seq_along(replace)) {
        s <- gsub(search[ii], replace[ii], s, fixed=TRUE);
      }
    }
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # 'application/x-rsp' -> ...
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (ct$src$contentType == "application/x-rsp") {
    escaped <- identical(unname(ct$src$args["escaped"]), "TRUE");
    if (escaped) {
      s <- gsub("<%%", "<%", s, fixed=TRUE);
      s <- gsub("%%>", "%>", s, fixed=TRUE);
    }
    if (ct$target$contentType == "text/plain") {
    } else if (ct$target$contentType == "application/x-tex") {
    }
  }

  as.character(s);
} # escapeRspContent()

 
# \references{
#   [1] \emph{Internet Media Type},
#       \url{http://www.wikipedia.org/wiki/Internet_media_type}
# }
parseInternetMediaType <- function(s, ...) {
  # Example e.g. "text/html; charset=UTF-8"
  s <- trim(s);
  pattern <- "^([^/]*)/([^;]*)(|;[ ]*(.*))$";
  if (regexpr(pattern, s) == -1L) {
    throw("Syntax error: Not an internet media type: ", sQuote(s));
  }

  # Extract: <type>/<subtype>
  type <- gsub(pattern, "\\1", s);
  subtype <- gsub(pattern, "\\2", s);

  # Extract: <name>=<value>*
  argsS <- gsub(pattern, "\\4", s);
  patternS <- "^([^=]*)=([^ ]*)(.*)";
  args <- NULL;
  while(nchar(argsS <- trim(argsS)) > 0L) {
    if (regexpr(patternS, argsS) == -1L) {
      throw("Syntax error: Invalid internet media type argument: ", sQuote(argsS));
    }
    name <- gsub(patternS, "\\1", argsS);
    value <- gsub(patternS, "\\2", argsS);
    names(value) <- name;
    args <- c(args, value);
    argsS <- gsub(patternS, "\\3", argsS);
  }

  list(
    contentType=sprintf("%s/%s", type, subtype),
    type=type,
    subtype=subtype,
    args=args
  );
} # parseInternetMediaType()


##############################################################################
# HISTORY:
# 2013-03-11
# o Added escapeRspContent().
# o Added extentionToIMT().
# o Added parseInternetMediaType().
# o Created.
##############################################################################
