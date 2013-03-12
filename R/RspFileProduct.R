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
    Arguments$getReadablePathname(pathname, mustExist=mustExist);
  }

  extend(RspProduct(pathname, ...), "RspFileProduct");
})


#########################################################################/**
# @RdocMethod print
#
# @title "Prints a summary of an RSP file product"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns nothing.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("print", "RspFileProduct", function(x, ...) {
  s <- sprintf("%s:", class(x)[1L]);
  s <- c(s, sprintf("Pathname: %s", x));
  s <- c(s, sprintf("File size: %g bytes", file.info(x)$size));
  s <- c(s, sprintf("Content type: %s", getType(x)));
  s <- c(s, sprintf("Has processor: %s", hasProcessor(x)));
  s <- paste(s, collapse="\n");
  cat(s, "\n", sep="");
}, protected=TRUE)



#########################################################################/**
# @RdocMethod getType
#
# @title "Gets the type of an RSP file product"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns a @character string.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("getType", "RspFileProduct", function(object, as=c("text", "IMT"), ...) {
  as <- match.arg(as);
  res <- NextMethod("getType");

  if (is.na(res)) {
    # Infer type from the filename extension?
    if (isFile(object)) {
      res <- extentionToIMT(object);
    }
  }

  if (as == "IMT" && !is.na(res)) {
    res <- parseInternetMediaType(res);
  }

  res;
}, protected=TRUE)



###########################################################################/**
# @RdocMethod findProcessor
#
# @title "Locates a processor for an RSP file product"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns a @function that takes an @see "RspFileProduct" as input,
#   or @NULL if no processor was found.
# }
#
# @author
#
# @keyword file
# @keyword IO
#*/########################################################################### 
setMethodS3("findProcessor", "RspFileProduct", function(object, ..., verbose=FALSE) {
  # Load the package (super quietly), in case R.rsp::rsp() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");


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

  # Find another RSP compiler
  fcn <- switch(type,
    # RSP-embedded LaTeX documents:
    # *.tex => ... => *.dvi/*.pdf
    "application/x-tex" = compileLaTeX,
    "application/x-latex" = compileLaTeX,

    # RSP-embedded Sweave and Knitr Rnw documents:
    # *.Rnw => ... => *.tex => dvi/*.pdf
    "application/x-sweave" = compileSweave,

    # RSP-embedded Sweave and Knitr Rnw documents:
    # *.Rnw => ... => *.tex => dvi/*.pdf
    "application/x-knitr" = compileKnitr,

    # RSP-embedded Sweave and Knitr Rnw documents:
    # *.Rnw => ... => *.tex => dvi/*.pdf
    "application/x-rnw" = compileRnw
  );

  if (is.null(fcn)) {
    verbose && cat(verbose, "Processor found: <none>");
  } else {
    # Make sure the processor returns an RspFileProduct
    processor <- fcn;
    fcn <- function(pathname, ..., fake=FALSE) {
      # Arguments 'pathname':
      pathname <- Arguments$getReadablePathname(object, mustExist=!fake);
      pathnameR <- processor(pathname, ..., fake=fake);
      pathnameR <- getAbsolutePath(pathnameR);
      pathnameR <- RspFileProduct(pathnameR, mustExist=FALSE);
    } # fcn()
    verbose && cat(verbose, "Processor found: ", type);
  }

  verbose && exit(verbose);

  fcn;
}, protected=TRUE) # findProcessor()



############################################################################
# HISTORY:
# 2013-02-18
# o Added argument 'fake' to the returned processor.
# 2013-02-13
# o Added RspProduct and RspFileProduct with corresponding 
#   process() methods.
# o Created.
############################################################################
