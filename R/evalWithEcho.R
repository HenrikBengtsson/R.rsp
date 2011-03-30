evalWithEcho <- function(expr, ..., envir=parent.frame(), trim=TRUE, collapse="\n") {
  # Get code/expression without evaluating it
  expr2 <- substitute(expr);
  code <- capture.output(print(expr2));

  # Trim of surrounding { ... }
  if (code[1] == "{") {
    code <- code[-c(1, length(code))];
  }

  # Evaluate the code via source()
  con <- textConnection(code, open="r");
  res <- capture.output({
    sourceTo(file=con, echo=TRUE, ..., envir=envir);
  });

  # Drop empty lines
  if (trim) {
    res <- res[nchar(res) > 0];
  }

  if (!is.null(collapse)) {
    res <- c(res, "");
    res <- paste(res, collapse=collapse);
  }

  invisible(res);
} # evalWithEcho()


##############################################################################
# HISTORY:
# 2011-03-28
# o Rewrote evalWithEcho() so that it utilizes source(..., echo=TRUE).
# o BUG FIX: evalWithEcho() would only add the prompt to the first line.
# 2011-03-15
# o Added evalWithEcho().
# o Created.
##############################################################################
