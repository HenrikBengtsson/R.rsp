setMethodS3("sourceWithTrim", "default", function(code, echo=TRUE, prompt=getOption('prompt'), ..., capture=TRUE, trim=TRUE) {
  con <- textConnection(code)
  on.exit({
    close(con)
  }, add=TRUE)

  file <- rawConnection(raw(0L), open="w")
  on.exit({
    if (!is.null(file)) close(file)
  }, add=TRUE)
  magicPrompt <- "<RSP-MAGIC-RSP>"
  capture.output(source(con, echo=echo, prompt.echo=magicPrompt), file=file)
  bfr <- rawToChar(rawConnectionValue(file))
  close(file); file <- NULL
  bfr <- unlist(strsplit(bfr, split="\n", fixed=TRUE), use.names=FALSE)

  if (trim) {
    pattern <- sprintf("^%s", magicPrompt)
    idxs <- grep(pattern, bfr)
    if (length(idxs) > 0L) {
      drop <- (idxs-1L)[nchar(bfr[idxs-1L]) == 0L]
      if (length(drop) > 0L) bfr <- bfr[-drop]
      bfr <- gsub(pattern, prompt, bfr)
    }
  }

  if (!capture) {
    cat(bfr, sep="\n")
  }

  invisible(bfr)
}) # sourceWithTrim()
