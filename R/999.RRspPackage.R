###########################################################################/**
# @RdocClass RRspPackage
#
# @title "The RRspPackage class"
#
# \description{
#  @classhierarchy
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
# }
#
# \section{Fields and Methods}{
#  @allmethods "public"
# }
#
# @author "HB"
#
# @keyword internal
#*/###########################################################################
setConstructorS3("RRspPackage", function(...) {
  extend(Package(...), "RRspPackage");
})



###########################################################################/**
# @RdocMethod capabilitiesOf
# @aliasmethod isCapableOf
#
# @title "Checks which tools are supported"
#
# \description{
#   @get "title".
# }
#
# @synopsis
#
# \arguments{
#  \item{what}{Optional @character @vector of which tools to check.}
#  \item{force}{If @TRUE, cached results are ignored, otherwise not.}
#  \item{...}{Not used.}
# }
#
# \value{
#   Returns a @logical named @character @vector.
# }
#
# \examples{
#   # Display which tools are supported by the package
#   print(capabilitiesOf(R.rsp))
#
#   # Check whether AsciiDoc is supported
#   print(isCapableOf(R.rsp, "asciidoc"))
# }
#
# @author "HB"
#
#*/###########################################################################
setMethodS3("capabilitiesOf", "RRspPackage", function(static, what=NULL, force=FALSE, ...) {
  res <- static$.capabilities;
  if (force || is.null(res)) {
    res <- list();

    # Check software
    res$asciidoc <- !is.null(findAsciiDoc(mustExist=FALSE));
    res$knitr <- !is.null(isPackageInstalled("knitr"));
    res$markdown <- !is.null(isPackageInstalled("markdown"));
    res$pandoc <- !is.null(findPandoc(mustExist=FALSE));
    res$sweave <- !is.null(isPackageInstalled("utils"));

    # Check LaTeX
    path <- system.file("rsp_LoremIpsum", package="R.rsp");
    pathname <- file.path(path, "LoremIpsum.tex");
    res$latex <- tryCatch({
      pathnameR <- compileLaTeX(pathname, outPath=tempdir());
      isFile(pathnameR);
    }, error = function(ex) FALSE);

    # Order lexicographically
    o <- order(names(res));
    res <- res[o];

    # Coerce into a named character vector
    res <- unlist(res);

    # Record
    static$.capabilities <- res;
  }

  if (!is.null(what)) {
    res <- res[what];
  }

  res;
}, static=TRUE)


setMethodS3("isCapableOf", "RRspPackage", function(static, what, ...) {
  capabilitiesOf(static, what=what, ...);
})


############################################################################
# HISTORY:
# 2013-07-19
# o Created from AromaSeq.R in aroma.seq.
############################################################################
