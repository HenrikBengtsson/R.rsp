.parseRVignetteMetadata <- function(text, ...) {
  # Parse "\Vignette" directives into RSP metadata
  bfr <- unlist(strsplit(text, split="\n", fixed=TRUE), use.names=FALSE)

  pattern <- "[[:space:]]*%*[[:space:]]*\\\\Vignette(.*)\\{([^}]*)\\}"
  keep <- (regexpr(pattern, bfr) != -1L)
  bfr <- bfr[keep]

  # Nothing todo?
  if (length(bfr) == 0L) return(list())

  # Mapping from R vignette metadata to RSP metadata
  map <- c(
    # Official R vignette markup
    "IndexEntry"="title",
    "Keyword"="keyword",
    "Keywords"="keywords", ## Deprecated in R
    "Engine"="engine",
    # Custom
    "Subject"="subject",
    "Author"="author",
    "Date"="date",
    "Tangle"="tangle",
    "Compression"="compression"
  )

  metadata <- grep(pattern, bfr, value=TRUE)
  names <- gsub(pattern, "\\1", metadata)
  metadata <- gsub(pattern, "\\2", metadata)
  metadata <- trim(metadata)

  # Keep only known markup
  keep <- is.element(names, names(map))
  metadata <- metadata[keep]
  names <- names[keep]

  # Nothing todo?
  if (length(names) == 0L) return(list())

  # Rename
  names <- map[names]
  names(metadata) <- names
  metadata <- as.list(metadata)

  # Special: Merge all keyword meta data into one comma-separated entry
  idxs <- which(is.element(names(metadata), c("keyword", "keywords")))
  keywords <- unlist(metadata[idxs], use.names=FALSE)
  keywords <- paste(keywords, collapse=", ")
  metadata <- metadata[-idxs]
  metadata$keywords <- keywords

  metadata
} # .parseRVignetteMetadata()
