evalWithEcho <- function(..., envir=parent.frame()) {
  evalCapture(..., code=TRUE, output=TRUE, envir=envir);
}


##############################################################################
# HISTORY:
# 2011-11-07
# o BUG FIX: Although deprecated, the update to evalWithEcho() did not work.
# 2011-11-05
# o DEPRECATED: evalWithEcho(); use evalCapture().
# o Added evalCapture(..., code=TRUE, output=TRUE).
# o evalc() is an alias for evalCapture().
# 2011-03-28
# o Rewrote evalWithEcho() so that it utilizes source(..., echo=TRUE).
# o BUG FIX: evalWithEcho() would only add the prompt to the first line.
# 2011-03-15
# o Added evalWithEcho().
# o Created.
##############################################################################
