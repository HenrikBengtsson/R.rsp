###########################################################################/**
# @RdocFunction parseVignette
#
# @title "Parses an Rnw file"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{pathname}{The Rnw file to be parsed.}
#   \item{commentPrefix}{A regular expression specifying the prefix
#     pattern of vignette comments.}
#   \item{...}{Not used.}
# }
#
# \value{
#   Returns a named @list.
# }
#
# @author
#
# \seealso{
#   To build all non-Sweave vignettes, see @see "buildNonSweaveVignettes".
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/########################################################################### 
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



###########################################################################/**
# @RdocFunction buildNonSweaveVignette
#
# @title "Builds a non-Sweave Rnw vignette"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{pathname}{The Rnw file to be built.}
#   \item{...}{Not used.}
# }
#
# \value{
#   Returns (invisibly) what the vignette builder returns.
# }
#
# @author
#
# @keyword file
# @keyword IO
# @keyword internal
#*/########################################################################### 
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
  res <- eval(expr);

  # Was a function specified?
  if (is.function(res)) {
    fcn <- res;
    # ...then process the file specified by \VignetteSource{}
    file <- opts$Source;
    if (is.null(file)) {
      throw("If \\VignetteBuild{} specifies a function, then \\VignetteSource{} must specify the file to compile.");
    }
    res <- fcn(file);
  }

  invisible(res);
} # buildNonSweaveVignette()



###########################################################################/**
# @RdocFunction buildNonSweaveVignettes
#
# @title "Builds all non-Sweave Rnw vignette"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{path}{The directory where to search for non-Sweave vignettes.}
#   \item{pattern}{Filename pattern to locate non-Sweave vignettes.}
#   \item{...}{Additional arguments passed to @see "buildNonSweaveVignette".}
# }
#
# \value{
#   Returns (invisibly) a named @list with elements of what 
#   the vignette builder returns.
# }
#
# @author
#
# \seealso{
#   To build one non-Sweave vignette, see @see "buildNonSweaveVignette".
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/########################################################################### 
buildNonSweaveVignettes <- function(path=".", pattern="[.]Rnw$", ...) {
  pathnames <- list.files(path=path, pattern=pattern, full.names=TRUE);
  res <- list();
  for (pathname in pathnames) {
    res[[pathname]] <- buildNonSweaveVignette(pathname, ...);
  }
  invisible(res);
} # buildNonSweaveVignettes()




###########################################################################/**
# @RdocFunction buildPkgIndexHtml
#
# @title "Builds a package index HTML file"
#
# \description{
#  @get "title", iff missing.
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
# }
#
# \value{
#   Returns (invisibly) the absolute pathame to the built index.html file.
#   If an index.html file already exists, nothing is done and @NULL 
#   is returned.
# }
#
# @author
#
# @keyword file
# @keyword IO
# @keyword internal
#*/########################################################################### 
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
  rfile(filename);
} # buildPkgIndexHtml()


############################################################################
# HISTORY:
# 2013-02-14
# o Added Rdoc help for all functions.
# o Now buildNonSweaveVignette() also handles \VignetteBuild{R.rsp::rfile}
#   given that \VignetteSource{} is specified.
# 2011-11-23
# o Added buildPkgIndexHtml().
# o Added parseVignette().
# o Added buildNonSweaveVignettes().
# o Added buildNonSweaveVignette().
# o Created.
############################################################################
