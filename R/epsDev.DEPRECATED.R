epsDev <- function(label, width=6, height=aspect*width, aspect=1, ..., path="figures", safe=TRUE, force=FALSE) {
  .Deprecated("R.devices::toEPS");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'path':
  path <- Arguments$getWritablePath(path);

  # Argument 'label':
  label <- Arguments$getCharacter(label);

  fullname <- label;
  # Encode?
  if (safe) {
    fullname <- gsub(".", "_", label, fixed=TRUE);
  }

  filename <- sprintf("%s.eps", fullname);
  pathname <- Arguments$getWritablePathname(filename, path=path);
  res <- FALSE;
  if (force || !isFile(pathname)) {
    devNew(eps, pathname, width=width, height=height, ..., label=label);
    res <- TRUE;
  }

  res <- Object(res);
  res$label <- label;
  res$fullname <- fullname;
  res$pathname <- pathname;

  invisible(res);
} # epsDev()


##############################################################################
# HISTORY:
# 2013-05-06
# o CLEANUP: Formally deprecated epsDev().
##############################################################################
