evalWithEcho <- function(expr, envir=parent.frame(), ..., trim=TRUE, prompt=getOption("prompt"), continue=getOption("continue"), capture=FALSE) {
  expr2 <- substitute(expr);
  code <- deparse(expr2);
  if (trim && length(code) > 1) {
    code <- code[-c(1, length(code))];
    code <- gsub("^    ", "", code);
  }
  prefix <- c(prompt, rep(continue, length=length(code)-1));
  code <- paste(prefix, code, sep="");
  code <- paste(code, collapse="\n");
  res <- withVisible(expr);
  value <- res$value;
  isVisible <- res$visible;
##print(isVisible);
  if (capture) {
    code <- paste(code, "\n", sep="");
    if (isVisible) {
      bfr <- capture.output({
        print(value);
        cat("\n");
      });
      bfr <- paste(bfr, collapse="\n");
      code <- paste(code, bfr, sep="");
    }
    res <- code;
  } else {
    cat(code, "\n", sep="");
    if (isVisible) print(value);
    res <- value;
  }

  invisible(res);
} # evalWithEcho()


##############################################################################
# HISTORY:
# 2011-03-15
# o Added evalWithEcho().
# o Created.
##############################################################################
