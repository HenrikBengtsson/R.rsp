urlDecode <- function(url, ...) {
  .Defunct(new="utils::URLdecode()")
}

###############################################################################
# HISTORY:
# 2006-02-22
# o BUG FIX: urlDecode(NA) gave an error. Now it returns "".
# 2005-09-24
# o Created.
###############################################################################
