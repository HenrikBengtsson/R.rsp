# \references{
#  [1] R-devel thread 'capture.output(): Using a rawConnection() [linear]
#      instead of textConnection() [exponential]?', 2014-02-03.
#      \url{https://stat.ethz.ch/pipermail/r-devel/2014-February/068349.html}
# }
.captureViaRaw <- function(expr, collapse=NULL) {
  eval({
    # Capture output to a raw connection
    file <- rawConnection(raw(0L), open="w");
    on.exit({
      if (!is.null(file)) close(file);
    })

    capture.output(expr, file=file);

    res <- rawConnectionValue(file);
    close(file);
    file <- NULL;
    res <- rawToChar(res);

    # Return line by line or one long string?
    if (is.null(collapse)) {
      res <- unlist(strsplit(res, split="\n", fixed=TRUE), use.names=FALSE);
    } else if (collapse != "\n") {
      res <- unlist(strsplit(res, split="\n", fixed=TRUE), use.names=FALSE);
      res <- paste(res, collapse=collapse);
    }

    res
  }, envir=parent.frame(), enclos=baseenv());
} # .captureViaRaw()

##############################################################################
# HISTORY:
# 2014-02-03
# o Added .captureViaRaw().
# o Created.
##############################################################################
