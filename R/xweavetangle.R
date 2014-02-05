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
rspWeave <- function(file, ..., postprocess=TRUE, quiet=FALSE, envir=new.env(), .engineName="rsp") {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # WORKAROUND: 'R CMD build' seems to ignore the %\VignetteEngine{<engine>}
  # markup for R (>= 3.0.0 && <= 3.0.1 patched r63905) and only go by the
  # filename pattern.  If this is the case, then the incorrect engine may
  # have been called.  Below we check for this and call the proper one if
  # that is the case.
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (.engineName == "rsp") {
    weave <- .getRspWeaveTangle(file=file, what="weave");
  } else {
    weave <- NULL;
  }

  # If no problems, use the default rfile() weaver.
  if (is.null(weave)) {
    weave <- function(..., quiet=FALSE) {
      rfile(..., workdir=".", postprocess=postprocess, verbose=!quiet);
    }
  }

  # Weave!
  res <- weave(file, ..., quiet=quiet, envir=envir);


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



# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# WORKAROUND: 'R CMD build' seems to ignore the %\VignetteEngine{<engine>}
# markup for R (>= 3.0.0 && <= 3.0.1 patched r63905) and only go by the
# filename pattern.  If this is the case, then the incorrect engine may
# have been called.  Below we check for this and call the proper one if
# that is the case.
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.getRspWeaveTangle <- function(file, ..., what=c("weave", "tangle")) {
  # Are we using an R version that does not acknowledge the
  # %\VignetteEngine{<engine>} markup?
  rver <- getRversion();
  if (rver < "3.0.0" || rver >= "3.0.2") {
    return(NULL); # Nope
  }

  # Fixed in R 3.0.1 patched (2013-09-11 r63906)
  rrev <- paste(R.version[["svn rev"]], "", sep="");
  if (rrev >= "63906") {
    return(NULL); # Nope
  }

  # If SVN revision is not recorded, then do one last check...
  ns <- getNamespace("tools");
  if (exists("engineMatches", envir=ns, mode="function")) {
    return(NULL); # Nope
  }

  # Does the vignette specify a particular vignette engine?
  content <- readLines(file, warn=FALSE);
  meta <- .parseRVignetteMetadata(content);
  engineName <- meta$engine;
  if (is.null(engineName)) {
    return(NULL); # Nope
  }

  # Yes, it's possible that we have ran the incorrect vignette engine...
  # Find the intended vignette engine
  engine <- tryCatch({
    vignetteEngine <- get("vignetteEngine", envir=ns);
    vignetteEngine(engineName, package="R.rsp");
  }, error = function(engine) NULL);

  if (is.null(engine)) {
    throw(sprintf("No such vignette engine: %%\\VignetteEngine{%s}", engineName));
  }

  # Was the wrong vignette engine used?
  if (engine$name == "rsp") {
    return(NULL); # Nope
  }

  # Assert that the filename pattern is correct
  patterns <- engine$pattern;
  if (length(patterns > 0L)) {
    ok <- any(sapply(patterns, FUN=regexpr, basename(file)) != -1L);
    if (!ok) {
      throw(sprintf("The filename pattern (%s) of the intended vignette engine ('%s::%s') does not match the file ('%s') to be processed.", paste(sQuote(patterns), collapse=", "), engine$package, engine$name, basename(file)));
    }
  }

  # Process the vignette using the intended vignette engine
  engine[[what]];
} # .getRspWeaveTangle()


# The weave function of vignette engine 'md.rsp+knitr:pandoc'
`.weave_md.rsp+knitr:pandoc` <- function(file, ..., envir=new.env()) {
  # Process *.md.rsp to *.md
  md <- rspWeave(file, ..., postprocess=FALSE, envir=envir,
                      .engineName="R.rsp::md.rsp+knitr:pandoc");

  # Is Pandoc and DZSlides fully supported?
  dzslides <- isCapableOf(R.rsp, "pandoc (>= 1.9.2)");
  if (dzslides) {
    # Pandoc *.md to *.html
    format <- Sys.getenv("R.rsp/pandoc/args/format", "html");
    suppressMessages({
      html <- knitr::pandoc(md, format=format);
    })
    html <- RspFileProduct(html);
  } else {
    if (isTRUE(Sys.getenv("RSP_REQ_PANDOC"))) {
      # Silently ignore if 'R CMD check' is "re-building of vignette outputs"
      pathname <- getAbsolutePath(md);
      path <- dirname(pathname);
      parts <- strsplit(path, split=c("/", "\\"), fixed=TRUE);
      parts <- unlist(parts, use.names=FALSE);
      vignetteTests <- any(parts == "vign_test");
      if (vignetteTests) {
        throw("External 'pandoc' executable is not available on this system: ", pathname);
      }
    }

    warning("Could not find external executable 'pandoc' v1.9.2 or newer on this system while running 'R CMD check' on the vignettes. Will run the default post-processor instead: ", basename(md));

    # If running R CMD check, silently accept that Pandoc is not
    # available.  Instead, just run it through the regular
    # Markdown to HTML postprocessor.
    html <- process(md);
  } # if (dzslides)

  # Remove *.md
  file.remove(md);

  invisible(html);
} # `.weave_md.rsp+knitr:pandoc`()



.registerVignetteEngines <- function(pkgname) {
  # Are vignette engines supported?
  if (getRversion() < "3.0.0") return(); # Nope!

  # Register vignette engines
  vignetteEngine <- get("vignetteEngine", envir=asNamespace("tools"));

  # (1) Skip engine
  vignetteEngine("skip_Rnw", package=pkgname,
    pattern="[.]Rnw$",
    weave=NA
  );

  # (2) RSP engine
  vignetteEngine("rsp", package=pkgname,
    pattern="[.][^.]*[.]rsp$",
    weave=rspWeave,
    tangle=rspTangle
  );

  # (3) Markdown RSP + knitr::pandoc engine (non-offical trial version)
  vignetteEngine("md.rsp+knitr:pandoc", package=pkgname,
    pattern="[.]md[.]rsp$",
    weave=`.weave_md.rsp+knitr:pandoc`,
    tangle=rspTangle
  );

##    # "as-is" engine
##    vignetteEngine("asis", package=pkgname, pattern="[.](pdf|html)[.]asis$",
##                    weave=asisWeave, tangle=function(...) NULL);
##
##    # LaTeX engine
##    vignetteEngine("tex", package=pkgname, pattern="[.]tex$",
##                    weave=texWeave, tangle=function(...) NULL);
##
##    # Markdown engine
##    vignetteEngine("markdown", package=pkgname, pattern="[.]md$",
##                    weave=markdownWeave, tangle=function(...) NULL);
} # .registerVignetteEngines()


###############################################################################
# HISTORY:
# 2013-12-12
# o BUG FIX: The 'rsp::.weave_md.rsp+knitr:pandoc' vignette engine did not
#   explicitly disable RSP postprocessing as intended due to a typo.
# o SIMPLIFICATION: Now rspWeave() postprocess by default.
# 2013-11-03
# o CLEANUP: Now the 'md.rsp+knitr:pandoc' vignette engine suppresses
#   messages generated by knitr::pandoc().
# 2013-09-19
# o Extracted .registerVignetteEngines() from .onLoad() in zzz.R.
# 2013-09-18
# o Added the 'md.rsp+knitr:pandoc' engine.
# o WORKAROUND: Added internal .getRspWeaveTangle().
# o Now the 'md.rsp+knitr:pandoc' weaver will not give a NOTE in
#   'R CMD check' if 'pandoc' executable is not available.
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
# o Added the 'R.rsp::skip_Rnw' engine.
# o CLEANUP: Dropped 'fake' processing again.
# 2013-03-01
# o BUG FIX: rspTangle() assumed R.utils is loaded.
# 2013-02-18
# o Added argument 'fake' to rspSweave() and rspTangle().
# 2013-02-14
# o Created.
###############################################################################
