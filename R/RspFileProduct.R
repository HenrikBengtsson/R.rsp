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
setConstructorS3("RspFileProduct", function(pathname=NA, ...) {
  # Argument 'pathname':
  if (!is.null(pathname) && !is.na(pathname)) {
    Arguments$getReadablePathname(pathname);
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
setMethodS3("getType", "RspFileProduct", function(object, ...) {
  type <- NextMethod("getType");

  if (is.na(type)) {
    # Infer type from the filename extension?
    if (isFile(object)) {
      filename <- basename(object);
      type <- gsub(".*[.]([^.]+)$", "\\1", filename);
    }
  }
  tolower(type);
}, protected=TRUE)



###########################################################################/**
# @RdocMethod process
#
# @title "Processes an RSP file product"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{type}{A @character string specifying the content type.}
#   \item{workdir}{The working directory.}
#   \item{...}{Not used.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns the processed RSP product, e.g. the pathname to a PDF file.
# }
#
# @author
#
# @keyword file
# @keyword IO
#*/########################################################################### 
setMethodS3("process", "RspFileProduct", function(object, type=NULL, workdir=".", ..., verbose=FALSE) {
  # Load the package (super quietly), in case R.rsp::rsp() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Arguments 'pathname':
  pathname <- Arguments$getReadablePathname(object);

  # Arguments 'type':
  if (is.null(type)) {
    type <- getType(object);
  }
  type <- Arguments$getCharacter(type, length=c(1L,1L));
  type <- tolower(type);


  # Arguments 'workdir':
  if (is.null(workdir)) {
    workdir <- ".";
  } else {
    workdir <- Arguments$getWritablePath(workdir);
    if (is.null(workdir)) workdir <- getwd();
  }
  workdir <- getAbsolutePath(workdir);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "Processing RSP product");
  verbose && cat(verbose, "Pathname: ", pathname);
  verbose && cat(verbose, "Content type: ", type);

  processor <- findProcessor(object, verbose=verbose);

  # Nothing to do?
  if (is.null(processor)) {
    verbose && cat(verbose, "There is no known processor for this content type: ", type);
    verbose && exit(verbose);
    verbose && exit(verbose);
    return(NULL);
  }

  verbose && enter(verbose, "Processing");

  # Change working directory?
  opwd <- getwd();
  on.exit({ if (!is.null(opwd)) setwd(opwd) }, add=TRUE);
  setwd(workdir);

  pathnameR <- processor(pathname, ..., verbose=verbose);
  pathnameR <- getAbsolutePath(pathnameR);
  pathnameR <- RspFileProduct(pathnameR);
  verbose && print(verbose, pathname);

  # Reset working directory
  if (!is.null(opwd)) {
    setwd(opwd);
    opwd <- NULL;
  }
  verbose && exit(verbose);

  verbose && exit(verbose);

  invisible(pathnameR);
}) # process()


setConstructorS3("RspStringProduct", function(...) {
  extend(RspProduct(...), "RspStringProduct");
})

setMethodS3("as.character", "RspStringProduct", function(x, ...) {
  s <- unclass(x);
  attributes(s) <- NULL;
  s;
}, protected=TRUE)

setMethodS3("print", "RspStringProduct", function(x, ...) {
  print(as.character(x), ...);
}, protected=TRUE)


############################################################################
# HISTORY:
# 2013-02-13
# o Added RspProduct and RspFileProduct with corresponding 
#   process() methods.
# o Created.
############################################################################
