###########################################################################/**
# @RdocFunction rspWeave
#
# @title "A weave function for RSP documents"
#
# \description{
#  @get "title".
#  This function is for RSP what @see "utils::Sweave" is for Sweave documents.
# }
#
# @synopsis
#
# \arguments{
#   \item{file}{The file to be weaved.}
#   \item{...}{Not used.}
#   \item{quiet}{If @TRUE, no verbose output is generated.}
#   \item{envir}{The @environment where the RSP document is
#         parsed and evaluated.}
#   \item{.engineName}{Internal only.}
# }
#
# \value{
#   Returns the absolute pathname of the generated RSP product.
#   The generated RSP product is not postprocessed.
# }
#
# @author
#
# \seealso{
#   @see "rspTangle"
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/###########################################################################
rspWeave <- function(file, ..., postprocess=FALSE, quiet=FALSE, envir=new.env(), .engineName="rsp") {
  res <- rfile(file, ..., workdir=".", postprocess=postprocess, envir=envir, verbose=!quiet);

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # WORKAROUND: 'R CMD build' seems to ignore the %\VignetteEngine{<engine>}
  # markup for early 3.0.x versions.  If this is the case, then make sure
  # we used the correct engine ('R.rsp::rsp') here.
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (.engineName == "rsp") {
    engineName <- getMetadata(res, "engine");
    if (!is.null(engineName)) {
      rver <- getRversion();
      rrev <- paste(R.version[["svn rev"]], "", sep="");
      isBuggy <- ("3.0.0" <= rver && rver < "3.0.2" && rrev < "63932");
      if (isBuggy) {
        # Find the vignette engine
        engine <- tryCatch({
          vignetteEngine <- get("vignetteEngine", envir=asNamespace("tools"));
          vignetteEngine(engineName, package="R.rsp");
        }, error = function(engine) NULL);
        if (is.null(engine)) {
          throw(sprintf("No such vignette engine: %%\\VignetteEngine{%s}", engineName));
        }

        # Was another vignette engine than 'rsp' intended?
        if (engine$name != "rsp") {
          # Assert that the filename pattern is correct
          if (regexpr(engine$pattern, basename(file)) == -1L) {
            throw(sprintf("The filename pattern ('%s') of the intended vignette engine ('%s::%s') does not match the file ('%s') to be processed.", engine$pattern, engine$package, engine$name, basename(file)));
          }
          # Use the proper vignette engine
          res <- engine$weave(file, ..., envir=envir);
        } # if (engine$name != "rsp")
      } # if (isBuggy)
    } # if (!is.null(engineName))
  } # if (.engineName == "rsp")

  # DEBUG: Store generated file? /HB 2013-09-17
  path <- Sys.getenv("RSP_DEBUG_PATH");
  if (nchar(path) > 0L) {
    R.utils::copyFile(res, file.path(path, basename(res)), overwrite=TRUE);
  }

  invisible(res);
} # rspWeave()



###########################################################################/**
# @RdocFunction rspTangle
#
# @title "A tangle function for RSP documents"
#
# \description{
#  @get "title".
#  This function is for RSP what @see "utils::Stangle" is for Sweave documents.
# }
#
# @synopsis
#
# \arguments{
#   \item{file}{The file to be tangled.}
#   \item{...}{Not used.}
#   \item{envir}{The @environment where the RSP document is parsed.}
# }
#
# \value{
#   Returns the absolute pathname of the generated R source code file.
# }
#
# @author
#
# \seealso{
#   @see "rspWeave"
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/###########################################################################
rspTangle <- function(file, ..., envir=new.env()) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'file':
  file <- Arguments$getReadablePathname(file);

  # Setup output R file
  workdir <- ".";
  filename <- basename(file);
  pattern <- "(|[.][^.]*)[.]rsp$";
  fullname <- gsub(pattern, "", filename);
  filenameR <- sprintf("%s.R", fullname);
  pathnameR <- Arguments$getWritablePathname(filenameR, path=workdir);
  pathnameR <- getAbsolutePath(pathnameR);

  # Translate RSP document to RSP code script
  rcode <- rscript(file=file);
  rcode <- tangle(rcode);

  # Create header
  hdr <- NULL;
  hdr <- c(hdr, "This 'tangle' R script was created from an RSP document.");
  hdr <- c(hdr, sprintf("RSP source document: '%s'", file));
  md <- getMetadata(rcode);
  for (key in names(md)) {
    value <- md[[key]];
    value <- gsub("\n", "\\n", value, fixed=TRUE);
    value <- gsub("\r", "\\r", value, fixed=TRUE);
    hdr <- c(hdr, sprintf("Metadata '%s': '%s'", key, value));
  }

  # Turn into header comments and prepend to code
  hdr <- sprintf("## %s", hdr);
  ruler <- paste(rep("#", times=75L), collapse="");
  rcode <- c(ruler, hdr, ruler, "", rcode);

  # Write R code
  writeLines(rcode, con=pathnameR);

  invisible(pathnameR);
} # rspTangle()


## asisWeave <- function(file, ...) {
##   fileR <- gsub("[.]asis$", "", file);
##   fileR;
## } # asisWeave()
##
##
## texWeave <- function(file, ...) {
##   file <- RspFileProduct(file);
##   process(file);
## } # texWeave()



###############################################################################
# HISTORY:
# 2013-03-27
# o Now rspTangle() uses rscript().
# 2013-03-26
# o Now rspTangle() adds a header with metadata information.
# 2013-03-25
# o ROBUSTNESS: Now rspWeave() and rspTangle() process the RSP document
#   in a separate environment.  This used to be the parent environment,
#   which made it possible for the vignette to modify the variables of
#   the function that called rspWeave(), e.g. buildVignette() and
#   tools::buildVignettes().
# 2013-03-07
# o CLEANUP: Dropped 'fake' processing again.
# 2013-03-01
# o BUG FIX: rspTangle() assumed R.utils is loaded.
# 2013-02-18
# o Added argument 'fake' to rspSweave() and rspTangle().
# 2013-02-14
# o Created.
###############################################################################
