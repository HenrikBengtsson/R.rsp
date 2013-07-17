.readText <- function(con, ...) {
  if (is.character(con)) {
    # (a) Try to open file connection
    con <- tryCatch({
      suppressWarnings({
        file(con, open="rb");
      });
    }, error = function(ex) {
      # (b) If failed, try to download file first
      if (regexpr("^https://", con, ignore.case=TRUE) == -1L) {
        throw(ex);
      }
      url <- con;
      pathname <- downloadFile(url, path=tempdir());
      file(pathname, open="rb");
    });
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
# 2013-07-17
# o CLEANUP: The downloadUrl(..., username="", password="") workaround
#   is no longer needed.
# o CLEANUP: .readText() no longer gives a warnings for http:// URLs.
# 2013-03-29
# o Now .readText() can also read https://, which is done by downloading
#   the file via R.utils::downloadFile().
# 2013-03-27
# o Added .readText() because with readLines() it is not possible to
#   know whether the last line had a newline or not.
##############################################################################
