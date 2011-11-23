############################################################################
# Author: Henrik Bengtsson
############################################################################
parseVignette <- function(pathname, commentPrefix="^%[ \t]*", ...) {
  if (!file.exists(pathname)) {
    stop("Cannot build vignette. File not found: ", pathname);
  }

  bfr <- readLines(pathname);

  # Parse for "\Vignette" options
  pattern <- sprintf("%s\\\\Vignette(.*)\\{(.*)\\}", commentPrefix);
  keep <- (regexpr(pattern, bfr) != -1);
  opts <- grep(pattern, bfr, value=TRUE);
  keys <- gsub(pattern, "\\1", opts);
  values <- gsub(pattern, "\\2", opts);
  names(values) <- keys;
  opts <- as.list(values);

  opts;
} # parseVignette()


buildNonSweaveVignette <- function(pathname, ...) {
  opts <- parseVignette(pathname, ...);

  # Nothing do to, i.e. will R take care of it?
  if (is.null(opts$Build)) {
    return(NULL);
  }

  # Build vignette according to \VignetteBuild{} command
  cmd <- opts$Build;

  # No command, that is, no source, just leave as is?
  if (cmd == "") {
    return(NULL);
  }

  # Load required packages
  if (!is.null(opts$Depends)) {
    pkgNames <- opts$Depends;
    pkgNames <- unlist(strsplit(pkgNames, split=","));
    pkgNames <- gsub("(^[ \t]*|[ \t]*$)", "", pkgNames);
    for (pkgName in pkgNames) {
      library(pkgName, character.only=TRUE);
    }
  }

  # Parse \VignetteBuild{} command
  tryCatch({
    expr <- parse(text=cmd);
  }, error = function(ex) {
    stop(sprintf("Syntax error in \\VignetteBuild{%s}: %s", cmd, ex$message));
  });

  # Evaluate \VignetteBuild{} command
  eval(expr);
} # buildNonSweaveVignette()


buildNonSweaveVignettes <- function(path=".", pattern="[.]Rnw$", ...) {
  pathnames <- list.files(path=path, pattern=pattern, full.names=TRUE);
  for (pathname in pathnames) {
    buildNonSweaveVignette(pathname, ...);
  }
} # buildNonSweaveVignettes()


############################################################################
# HISTORY:
# 2011-11-23
# o Added parseVignette().
# o Added buildNonSweaveVignettes().
# o Added buildNonSweaveVignette().
# o Created.
############################################################################
