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


buildPkgIndexHtml <- function(...) {
  # Nothing to do?
  if (file.exists("index.html")) {
    return(NULL);
  }

  library("R.rsp");

  filename <- "index.html.rsp";
  if (!file.exists(filename)) {
    # If not custom index.html.rsp exists, use the one of the R.rsp package
    path <- system.file("doc/templates", package="R.rsp");
    pathname <- file.path(path, filename);
    file.copy(pathname, to=".");
    on.exit({
      file.remove(filename);
    });
  }

  # Sanity check
  stopifnot(file.exists(filename));

  # Build index.html
  rsp(filename);
} # buildPkgIndexHtml()


############################################################################
# HISTORY:
# 2011-11-23
# o Added buildPkgIndexHtml().
# o Added parseVignette().
# o Added buildNonSweaveVignettes().
# o Added buildNonSweaveVignette().
# o Created.
############################################################################
