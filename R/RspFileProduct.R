###########################################################################/**
# @RdocClass RspFileProduct
#
# @title "The RspFileProduct class"
#
# \description{
#  @classhierarchy
#
#  An RspFileProduct is an @see RspProduct that represents an
#  RSP product in form of a file, e.g. LaTeX, Sweave and knitr documents.
# }
#
# @synopsis
#
# \arguments{
#   \item{pathname}{An existing file.}
#   \item{...}{Additional arguments passed to @see "RspProduct".}
#   \item{mustExist}{If @TRUE, it is asserted that the file exists.}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
#
# @author
#
# @keyword internal
#*/###########################################################################
setConstructorS3("RspFileProduct", function(pathname=NA, ..., mustExist=TRUE) {
  # Argument 'pathname':
  if (!is.null(pathname) && !is.na(pathname)) {
    withoutGString({
      pathname <- Arguments$getReadablePathname(pathname, mustExist=mustExist);
    })
  }

  extend(RspProduct(pathname, ...), "RspFileProduct");
})


setMethodS3("print", "RspFileProduct", function(x, ...) {
  s <- sprintf("%s:", class(x)[1L]);

  s <- c(s, sprintf("Pathname: %s", x));

  # File size
  fileSize <- getFileSize(x, "units");
  if (!is.na(fileSize)) {
    fileSizeB <- sprintf("%.0f bytes", getFileSize(x, "numeric"));
    if (fileSizeB != fileSize) {
      fileSize <- sprintf("%s (%s)", fileSize, fileSizeB);
    }
  }
  s <- c(s, sprintf("File size: %s", fileSize));

  s <- c(s, sprintf("Content type: %s", getType(x)));

  md <- getMetadata(x);
  for (key in names(md)) {
    s <- c(s, sprintf("Metadata '%s': '%s'", key, md[[key]]));
  }

  s <- c(s, sprintf("Has processor: %s", hasProcessor(x)));

  s <- paste(s, collapse="\n");
  cat(s, "\n", sep="");
}, protected=TRUE)



setMethodS3("view", "RspFileProduct", function(object, ...) {
  browseURL(object, ...);
  invisible(object);
}, proctected=TRUE)



setMethodS3("getType", "RspFileProduct", function(object, as=c("text", "IMT"), ...) {
  as <- match.arg(as);
  res <- NextMethod("getType");

  if (is.na(res)) {
    # Infer type from the filename extension?
    if (isFile(object) || isUrl(object)) {
      res <- extensionToIMT(object);
    }
  }

  if (as == "IMT" && !is.na(res)) {
    res <- parseInternetMediaType(res);
  }

  res;
}, protected=TRUE)


setMethodS3("getFileSize", "RspFileProduct", function(object, what=c("numeric", "units"), sep="", ...) {
  # Argument 'what':
  what <- match.arg(what);

  pathname <- object
  if (is.null(pathname)) {
    fileSize <- NA_real_;
  } else {
    fileSize <- file.info2(pathname)$size;
  }

  if (what == "numeric")
    return(fileSize);

  if (is.na(fileSize))
    return(fileSize);

  units <- c("bytes", "kB", "MB", "GB", "TB");
  scale <- 1;
  for (kk in seq_along(units)) {
    unit <- units[kk];
    if (fileSize < 1000)
      break;
    fileSize <- fileSize/1024;
  }
  fileSize <- sprintf("%.2f %s%s", fileSize, sep, unit);
  fileSize <- gsub(".00 bytes", " bytes", fileSize, fixed=TRUE);

  fileSize;
})



setMethodS3("findProcessor", "RspFileProduct", function(object, ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "Locating document-type specific processor");
  type <- getType(object);
  verbose && cat(verbose, "RSP product content type: ", type);

  # Nothing to do?
  if (is.na(type)) {
    verbose && cat(verbose, "Processor found: <none>");
    verbose && exit(verbose);
    return(NULL);
  }
  type <- parseInternetMediaType(type)$contentType;

  # Find a down-stream compiler/processor:
  fcn <- switch(type,
    # RSP documents:
    # *<ext>.rsp => *.<ext>
    "application/x-rsp" = function(...) { compileRsp(..., postprocess=FALSE) },

    # LaTeX documents:
    # *.tex => ... => *.pdf
    "application/x-tex" = compileLaTeX,
    "application/x-latex" = compileLaTeX,

    # Markdown documents:
    # *.md => *.html
    "application/x-markdown" = compileMarkdown,

    # Markdown documents:
    # *.txt => *.html, ...
    "application/x-asciidoc" = function(...) { compileAsciiDoc(..., postprocess=FALSE) },

    # Sweave Rnw documents:
    # *.Rnw => *.tex
    "application/x-sweave" = function(...) { compileSweave(..., postprocess=FALSE) },

    # Knitr Rnw documents:
    # *.Rnw => *.tex
    "application/x-knitr" = function(...) { compileKnitr(..., postprocess=FALSE) },

    # Knitr Rmd documents:
    # *.Rmd => *.html
    "application/x-rmd" = function(...) { compileKnitr(..., postprocess=FALSE) },
    # Knitr Rhtml documents:
    # *.Rhtml => *.html
    "application/x-rhtml" = function(...) { compileKnitr(..., postprocess=FALSE) },

    # Knitr Rtex documents:
    # *.Rtex => *.tex
    "application/x-rtex" = function(...) { compileKnitr(..., postprocess=FALSE) },

    # Knitr Rrst documents:
    # *.Rrst => *.rst
    "application/x-rrst" = function(...) { compileKnitr(..., postprocess=FALSE) },

    # AsciiDoc Rnw documents:
    # *.Rnw => *.txt
    "application/x-asciidoc-noweb" = function(...) { compileAsciiDocNoweb(..., postprocess=FALSE) },

    # Sweave or Knitr Rnw documents:
    # *.Rnw => *.tex
    "application/x-rnw" = function(...) { compileRnw(..., postprocess=FALSE) }
  );

  if (is.null(fcn)) {
    verbose && cat(verbose, "Processor found: <none>");
  } else {
    # Get the metadata attributes
    metadata <- getMetadata(object);

    # Make sure the processor returns an RspFileProduct
    fcnT <- fcn
    processor <- function(...) {
       do.call(fcnT, args=c(list(...), metadata));
    }
    fcn <- function(pathname, ...) {
      # Arguments 'pathname':
      withoutGString({
        pathname <- Arguments$getReadablePathname(pathname);
      })

      pathnameR <- processor(pathname, ...);
      pathnameR <- getAbsolutePath(pathnameR);
      RspFileProduct(pathnameR, attrs=list(metadata=metadata), mustExist=FALSE);
    } # fcn()
    verbose && cat(verbose, "Processor found: ", type);
  }

  verbose && exit(verbose);

  fcn;
}, protected=TRUE) # findProcessor()



############################################################################
# HISTORY:
# 2014-02-07
# o Now print() for RspFileProduct reports the file size also in units
#   of kB, MB, GB, etc.
# o Added getFileSize() for RspFileProduct.  Taken from R.filesets.
# 2013-12-14
# o Now getType() for RspFileProduct works also for URLs.
# 2013-03-29
# o Added view().
# 2013-03-25
# o Added Markdown processor.
# 2013-02-18
# o Added argument 'fake' to the returned processor.
# 2013-02-13
# o Added RspProduct and RspFileProduct with corresponding
#   process() methods.
# o Created.
############################################################################
