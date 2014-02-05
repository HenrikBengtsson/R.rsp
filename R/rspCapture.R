rspCapture <- function(..., wrapAt=80, collapse="\n") {
  x <- .captureViaRaw(print(...));

  # Wrap long lines?
  if (!is.null(wrapAt)) {
    nok <- (nchar(x) > wrapAt);
    if (any(nok)) {
      x <- as.list(x);
      x[nok] <- lapply(x[nok], FUN=function(s) {
        res <- NULL;
        while(nchar(s) > 0L) {
          res <- c(res, substr(s, start=1L, stop=wrapAt));
          s <- substr(s, start=wrapAt+1L, stop=nchar(s));
        }
        res;
      });
      x <- unlist(x, use.names=FALSE);
    }
  }

  # Concatenate rows?
  if (!is.null(collapse)) {
    x <- paste(x, collapse=collapse);
  }

  x;
} # rspCapture()


###############################################################################
# HISTORY:
# 2014-02-04
# o SPEEDUP: Now rspCapture() captures output via a raw connection.
# 2009-02-25
# o Created.
###############################################################################
