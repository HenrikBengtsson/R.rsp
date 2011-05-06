setMethodS3("sourceWithTrim", "default", function(code, echo=TRUE, prompt=getOption('prompt'), ..., capture=TRUE, trim=TRUE) {
  con <- textConnection(code);
  on.exit({
    close(con);
  }, add=TRUE);

  magicPrompt <- "<RSP-MAGIC-RSP>";
  bfr <- capture.output(source(con, echo=echo, prompt.echo=magicPrompt));

  if (trim) {
    pattern <- sprintf("^%s", magicPrompt);
    idxs <- grep(pattern, bfr);
    if (length(idxs) > 0) {
      drop <- (idxs-1L)[nchar(bfr[idxs-1L]) == 0];
      if (length(drop) > 0) bfr <- bfr[-drop];
      bfr <- gsub(pattern, prompt, bfr);
    }
  }

  if (!capture) {
    cat(bfr, sep="\n");
  }

  invisible(bfr);
}) # sourceWithTrim()


##############################################################################
# HISTORY:
# 2011-05-05
# o Now using full 'prompt.echo' argument name in call to base:source().
# 2011-03-15
# o Added sourceWithTrim().
# o Created.
##############################################################################
