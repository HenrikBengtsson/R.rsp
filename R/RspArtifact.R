###########################################################################/**
# @RdocClass RspArtifact
#
# @title "The RspArtifact class"
#
# \description{
#  @classhierarchy
#
#  An RspArtifact object represents an RSP artifact produced by processing
#  an RSP document.
# }
# 
# @synopsis
#
# \arguments{
#   \item{object}{The RSP artifact.}
#   \item{type}{The content type of the RSP artifact.}
#   \item{...}{Not used.}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
# 
# @author
#*/###########################################################################
setConstructorS3("RspArtifact", function(object=NA, type=attr(object, "type"), ...) {
  # Argument 'type':
  if (is.null(type)) {
    type <- NA;
  }

  this <- extend(object, "RspArtifact");
  attr(this, "type") <- as.character(type);
  this;
})



#########################################################################/**
# @RdocMethod print
#
# @title "Prints a summary of an RSP artifact"
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
setMethodS3("print", "RspArtifact", function(x, ...) {
  s <- sprintf("%s:", class(x)[1L]);
  s <- c(s, sprintf("Content type: %s", getType(x)));
  s <- c(s, sprintf("Has postprocessor: %s", hasProcessor(x)));
  s <- paste(s, collapse="\n");
  cat(s, "\n", sep="");
}, protected=TRUE)



#########################################################################/**
# @RdocMethod getType
#
# @title "Gets the type of an RSP artifact"
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
setMethodS3("getType", "RspArtifact", function(object, ...) {
  type <- attr(object, "type");
  if (is.null(type)) type <- NA;
  type <- tolower(type);
  type;
}, protected=TRUE)



###########################################################################/**
# @RdocMethod hasProcessor
#
# @title "Checks whether a postprocessor exist or not for an RSP artifact"
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
#   Returns @TRUE if one exists, otherwise @FALSE.
# }
#
# @author
#
# @keyword file
# @keyword IO
#*/########################################################################### 
setMethodS3("hasProcessor", "RspArtifact", function(object, ...) {
  !is.null(findProcessor(object, ...));
}, protected=TRUE)



###########################################################################/**
# @RdocMethod findProcessor
#
# @title "Tries to locate a postprocessor for an RSP artifact"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{pathname}{The RSP artifact, e.g. a file.}
#   \item{type}{A @character string specifying the content type.}
#   \item{outPath}{The working directory.}
#   \item{...}{Not used.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns the postprocessed RSP artifact, e.g. the pathname to a PDF file.
# }
#
# @author
#
# @keyword file
# @keyword IO
#*/########################################################################### 
setMethodS3("findProcessor", "RspArtifact", function(object, ..., verbose=FALSE) {
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


  verbose && enter(verbose, "Locating document-type specific postprocessor");
  type <- getType(object);
  verbose && cat(verbose, "RSP artifact content type: ", type);

  # Nothing to do?
  if (is.na(type)) {
    verbose && cat(verbose, "Postprocessor found: <none>");
    verbose && exit(verbose);
    return(NULL);
  }


  # Find another RSP compiler
  postProcessors <- list(
    # RSP-embedded LaTeX documents:
    # *.tex => ... => *.dvi/*.pdf
    "tex" = compileLaTeX,
    "latex" = compileLaTeX,

    # RSP-embedded Sweave and Knitr Rnw documents:
    # *.Rnw => ... => *.tex => dvi/*.pdf
    "sweave" = compileSweave,

    # RSP-embedded Sweave and Knitr Rnw documents:
    # *.Rnw => ... => *.tex => dvi/*.pdf
    "knitr" = compileKnitr,

    # RSP-embedded Sweave and Knitr Rnw documents:
    # *.Rnw => ... => *.tex => dvi/*.pdf
    "rnw" = compileRnw
  );


  fcn <- NULL;
  for (key in names(postProcessors)) {
    pattern <- key;
    if (regexpr(pattern, type) != -1) {
      fcn <- postProcessors[[key]];
      verbose && cat(verbose, "Match: ", key);
      break;
    }
  } # for (key ...)

  if (is.null(fcn)) {
    verbose && cat(verbose, "Postprocessor found: <none>");
  } else {
    verbose && cat(verbose, "Postprocessor found: ", type);
  }

  verbose && exit(verbose);

  fcn;
}, protected=TRUE) # findProcessor()



###########################################################################/**
# @RdocMethod postprocess
#
# @title "Postprocesses an RSP artifact"
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
#   Returns @NULL.
# }
#
# @author
#
# @keyword file
# @keyword IO
#*/########################################################################### 
setMethodS3("postprocess", "RspArtifact", function(object, ...) {
  NULL;
}, protected=TRUE)



###########################################################################/**
# @RdocClass RspFileArtifact
#
# @title "The RspFileArtifact class"
#
# \description{
#  @classhierarchy
#
#  An RspFileArtifact is an @see RspFileArtifact that represents an
#  RSP file artifact, e.g. LaTeX, Sweave and knitr documents.
# }
# 
# @synopsis
#
# \arguments{
#   \item{pathname}{An existing file.}
#   \item{...}{Additional arguments pass to @see "RspArtifact".}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
# 
# @author
#*/###########################################################################
setConstructorS3("RspFileArtifact", function(pathname=NA, ...) {
  # Argument 'pathname':
  if (!is.null(pathname) && !is.na(pathname)) {
    Arguments$getReadablePathname(pathname);
  }

  extend(RspArtifact(pathname, ...), "RspFileArtifact");
})


#########################################################################/**
# @RdocMethod print
#
# @title "Prints a summary of an RSP file artifact"
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
setMethodS3("print", "RspFileArtifact", function(x, ...) {
  s <- sprintf("%s:", class(x)[1L]);
  s <- c(s, sprintf("Pathname: %s", x));
  s <- c(s, sprintf("File size: %g bytes", file.info(x)$size));
  s <- c(s, sprintf("Content type: %s", getType(x)));
  s <- c(s, sprintf("Has postprocessor: %s", hasProcessor(x)));
  s <- paste(s, collapse="\n");
  cat(s, "\n", sep="");
}, protected=TRUE)



#########################################################################/**
# @RdocMethod getType
#
# @title "Gets the type of an RSP file artifact"
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
setMethodS3("getType", "RspFileArtifact", function(object, ...) {
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
# @RdocMethod postprocess
#
# @title "Postprocesses an RSP file artifact"
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
#   Returns the postprocessed RSP artifact, e.g. the pathname to a PDF file.
# }
#
# @author
#
# @keyword file
# @keyword IO
#*/########################################################################### 
setMethodS3("postprocess", "RspFileArtifact", function(object, type=NULL, workdir=".", ..., verbose=FALSE) {
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


  verbose && enter(verbose, "Postprocessing RSP artifact");
  verbose && cat(verbose, "Pathname: ", pathname);
  verbose && cat(verbose, "Content type: ", type);

  postProcessor <- findProcessor(object, verbose=verbose);

  # Nothing to do?
  if (is.null(postProcessor)) {
    verbose && cat(verbose, "There is no known postprocessor for this content type: ", type);
    verbose && exit(verbose);
    verbose && exit(verbose);
    return(NULL);
  }

  verbose && enter(verbose, "Postprocessing");

  # Change working directory?
  opwd <- getwd();
  on.exit({ if (!is.null(opwd)) setwd(opwd) }, add=TRUE);
  setwd(workdir);

  pathnameR <- postProcessor(pathname, ..., verbose=verbose);
  pathnameR <- getAbsolutePath(pathnameR);
  pathnameR <- RspFileArtifact(pathnameR);
  verbose && print(verbose, pathname);

  # Reset working directory
  if (!is.null(opwd)) {
    setwd(opwd);
    opwd <- NULL;
  }
  verbose && exit(verbose);

  verbose && exit(verbose);

  invisible(pathnameR);
}) # postprocess()



############################################################################
# HISTORY:
# 2013-02-13
# o Added RspArtifact and RspFileArtifact with corresponding 
#   postprocess() methods.
# o Created.
############################################################################
