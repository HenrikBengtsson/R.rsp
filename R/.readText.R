.readText <- function(con, ...) {
  if (is.character(con)) {
    con <- file(con, open="rb");
    on.exit(close(con));
  }

  bfr <- NULL;
  while (TRUE) {
    bfrT <- readChar(con, nchars=1e6);
    if (length(bfrT) == 0L) break;
    bfrT <- gsub("\r\n", "\n", bfrT, fixed=TRUE);
    bfrT <- gsub("\r", "\n", bfrT, fixed=TRUE);
    bfr <- c(bfr, bfrT);
  }
  bfr <- paste(bfr, collapse="");
  if (FALSE) {
    bfr <- strsplit(bfr, split="\n", fixed=TRUE);
    bfr <- unlist(bfr, use.names=FALSE);
  }
  bfr;
} # .readText()

##############################################################################
# HISTORY:
# 2013-03-28
# o Added .readText() because with readLines() it is not possible to
#   know whether the last line had a newline or not.
##############################################################################
