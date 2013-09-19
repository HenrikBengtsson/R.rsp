.parseRVignetteMetadata <- function(text, ...) {
  # Parse "\Vignette" directives into RSP metadata
  bfr <- unlist(strsplit(text, split="\n", fixed=TRUE));

  pattern <- "[[:space:]]*%*[[:space:]]*\\\\Vignette(.*)\\{([^}]*)\\}";
  keep <- (regexpr(pattern, bfr) != -1L);
  bfr <- bfr[keep];

  # Nothing todo?
  if (length(bfr) == 0L) {
    return(list());
  }

  # Mapping from R vignette metadata to RSP metadata
  map <- c(
    # Official R vignette markup
    "IndexEntry"="title",
    "Keyword"="keywords", "Keywords"="keywords",
    "Engine"="engine",
    # Custom
    "Subject"="subject",
    "Author"="author",
    "Date"="date",
    "Tangle"="tangle"
  );

  metadata <- grep(pattern, bfr, value=TRUE);
  names <- gsub(pattern, "\\1", metadata);
  metadata <- gsub(pattern, "\\2", metadata);
  metadata <- trim(metadata);

  # Keep only known markup
  keep <- is.element(names, names(map));
  metadata <- metadata[keep];
  names <- names[keep];

  # Nothing todo?
  if (length(names) == 0L) {
    return(list());
  }

  # Rename
  names <- map[names];
  names(metadata) <- names;
  metadata <- as.list(metadata);

  metadata;
} # .parseRVignetteMetadata()


##############################################################################
# HISTORY:
# 2013-09-18
# o Now .parseRVignetteMetadata() also records R vignette meta data
#   'engine' (from %\VignetteEngine{}) and RSP custom 'tangle' (from
#   %\VignetteTangle{}).
# o Added .parseRVignetteMetadata().  Was an internal function of the
#   preprocess() method for RspDocument.
##############################################################################


