###########################################################################/**
# @RdocFunction rspWeave
# @alias asisWeave
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
#   \item{postprocess}{If @TRUE, the compiled document is also post
#     processed, if possible.}
#   \item{clean}{If @TRUE, intermediate files are removed, otherwise not.}
#   \item{quiet}{If @TRUE, no verbose output is generated.}
#   \item{envir}{The @environment where the RSP document is
#         parsed and evaluated.}
#   \item{.engineName}{Internal only.}
# }
#
# \value{
#   Returns the absolute pathname of the generated RSP product.
#   The generated RSP product is postprocessed, if possible.
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
rspWeave <- function(file, ..., postprocess=TRUE, clean=TRUE, quiet=FALSE, envir=new.env(), .engineName="rsp") {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # WORKAROUND: 'R CMD build' seems to ignore the %\VignetteEngine{<engine>}
  # markup for R (>= 3.0.0 && <= 3.0.1 patched r63905) and only go by the
  # filename pattern.  If this is the case, then the incorrect engine may
  # have been called.  Below we check for this and call the proper one if
  # that is the case.
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (.engineName == "rsp") {
    weave <- .getRspWeaveTangle(file=file, what="weave")
  } else {
    weave <- NULL
  }

  # If no problems, use the default rfile() weaver.
  if (is.null(weave)) {
    weave <- function(..., quiet=FALSE) {
      rfile(..., workdir=".", postprocess=postprocess, clean=clean, verbose=!quiet)
    }
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Weave!
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  res <- weave(file, ..., quiet=quiet, envir=envir)


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Cleanup, i.e. remove intermediate RSP files, e.g. Markdown and TeX?
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (postprocess && clean) {
    tmp <- file_path_sans_ext(basename(file))
    if (tmp != basename(res) && tolower(file_ext(file)) == "rsp") {
      if (file_test("-f", tmp)) file.remove(tmp)
    }
  }

  # DEBUG: Store generated file? /HB 2013-09-17
  path <- Sys.getenv("RSP_DEBUG_PATH")
  if (nchar(path) > 0L) {
    R.utils::copyFile(res, file.path(path, basename(res)), overwrite=TRUE)
  }

  invisible(res)
} # rspWeave()


###########################################################################/**
# @RdocFunction rspTangle
# @alias asisTangle
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
#   \item{pattern}{A filename pattern used to identify the name.}
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
rspTangle <- function(file, ..., envir=new.env(), pattern="(|[.][^.]*)[.]rsp$") {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'file':
  file <- Arguments$getReadablePathname(file)

  # Setup output R file
  workdir <- "."
  filename <- basename(file)
  fullname <- gsub(pattern, "", filename)
  filenameR <- sprintf("%s.R", fullname)
  pathnameR <- Arguments$getWritablePathname(filenameR, path=workdir)
  pathnameR <- getAbsolutePath(pathnameR)

  # Translate RSP document to RSP code script
  rcode <- rcode(file=file, output=RspSourceCode(), ...)

  # Check if tangle is disabled by the vignette
  tangle <- getMetadata(rcode, "tangle")
  tangle <- tolower(tangle)
  tangle <- (length(tangle) == 0L) || !is.element(tangle, c("false", "no"))

  if (tangle) {
    rcode <- tangle(rcode)
  } else {
    ## As of R (> 3.3.2) all vignettes have to output at least one tangled file
    rcode <- NULL
  }

  # Create header
  hdr <- NULL
  hdr <- c(hdr, "This 'tangle' R script was created from an RSP document.")
  hdr <- c(hdr, sprintf("RSP source document: '%s'", file))
  md <- getMetadata(rcode, local=FALSE)
  for (key in names(md)) {
    value <- md[[key]]
    value <- gsub("\n", "\\n", value, fixed=TRUE)
    value <- gsub("\r", "\\r", value, fixed=TRUE)
    hdr <- c(hdr, sprintf("Metadata '%s': '%s'", key, value))
  }

  # Turn into header comments and prepend to code
  hdr <- sprintf("### %s", hdr)
  ruler <- paste(rep("#", times=75L), collapse="")
  rcode <- c(ruler, hdr, ruler, "", rcode)

  # Write R code
  writeLines(rcode, con=pathnameR)

  invisible(pathnameR)
} # rspTangle()


asisWeave <- function(file, ...) {
  output <- file_path_sans_ext(basename(file))

  # Make sure the output vignette exists
  if (!isFile(output)) {
    # It could be that we're here because 'R CMD check' runs the
    # 're-building of vignette outputs' step.  Then the output
    # file has already been moved to inst/doc/.  If so, grab it
    # from there instead.
    outputS <- file.path("..", "inst", "doc", output)
    if (isFile(outputS)) {
      file.copy(outputS, output, overwrite=TRUE)
      output <- outputS
    } else {
      path <- Sys.getenv("RSP_DEBUG_PATH")
      if (nchar(path) > 0L) {
        msg <- list(file=file, output=output, pwd=getwd(), files=dir())
        local({
          sink(file.path(path, "R.rsp.DEBUG"))
          on.exit(sink())
          print(msg)
        })
      }
      throw("No such output file: ", output)
    }
  }

  # Update the timestamp of the output file
  # (otherwise tools::buildVignettes() won't detect it)
  touchFile(output)

  # DEBUG: Store generated file? /HB 2013-09-17
  path <- Sys.getenv("RSP_DEBUG_PATH")
  if (nchar(path) > 0L) {
    copyFile(output, file.path(path, basename(output)), overwrite=TRUE)
  }

  output
} # asisWeave()

asisTangle <- function(file, ..., pattern="(|[.][^.]*)[.]asis$") {
  # Setup output R file
  workdir <- "."
  filename <- basename(file)
  fullname <- gsub(pattern, "", filename)
  filenameR <- sprintf("%s.R", fullname)
  pathnameR <- Arguments$getWritablePathname(filenameR, path=workdir)
  pathnameR <- getAbsolutePath(pathnameR)
  cat(sprintf("### This is an R script tangled from '%s'\n", filename), file=pathnameR)
  invisible(pathnameR)  
} # asisTangle()


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
  rver <- getRversion()
  if (rver < "3.0.0" || rver >= "3.0.2") {
    return(NULL) # Nope
  }

  # Fixed in R 3.0.1 patched (2013-09-11 r63906)
  rrev <- paste(R.version[["svn rev"]], "", sep="")
  if (rrev >= "63906") {
    return(NULL) # Nope
  }

  # If SVN revision is not recorded, then do one last check...
  ns <- getNamespace("tools")
  if (exists("engineMatches", envir=ns, mode="function")) {
    return(NULL) # Nope
  }

  # Does the vignette specify a particular vignette engine?
  content <- readLines(file, warn=FALSE)
  meta <- .parseRVignetteMetadata(content)
  engineName <- meta$engine
  if (is.null(engineName)) {
    return(NULL) # Nope
  }

  # Yes, it's possible that we have ran the incorrect vignette engine...
  # Find the intended vignette engine
  engine <- tryCatch({
    vignetteEngine <- get("vignetteEngine", envir=ns)
    vignetteEngine(engineName, package="R.rsp")
  }, error = function(engine) NULL)

  if (is.null(engine)) {
    throw(sprintf("No such vignette engine: %%\\VignetteEngine{%s}", engineName))
  }

  # Was the wrong vignette engine used?
  if (engine$name == "rsp") {
    return(NULL) # Nope
  }

  # Assert that the filename pattern is correct
  patterns <- engine$pattern
  if (length(patterns > 0L)) {
    ok <- any(sapply(patterns, FUN=regexpr, basename(file)) != -1L)
    if (!ok) {
      throw(sprintf("The filename pattern (%s) of the intended vignette engine ('%s::%s') does not match the file ('%s') to be processed.", paste(sQuote(patterns), collapse=", "), engine$package, engine$name, basename(file)))
    }
  }

  # Process the vignette using the intended vignette engine
  engine[[what]]
} # .getRspWeaveTangle()


# The weave function of vignette engine 'md.rsp+knitr:pandoc'
`.weave_md.rsp+knitr:pandoc` <- function(file, ..., envir=new.env()) {
  # Process *.md.rsp to *.md
  md <- rspWeave(file, ..., postprocess=FALSE, envir=envir,
                      .engineName="R.rsp::md.rsp+knitr:pandoc")

  # Is Pandoc and DZSlides fully supported?
  dzslides <- isCapableOf(R.rsp, "pandoc (>= 1.9.2)")
  if (dzslides) {
    # Pandoc *.md to *.html
    format <- Sys.getenv("R.rsp/pandoc/args/format", "html")
    use("knitr", quietly=TRUE)
    # To please R CMD check
    pandoc <- NULL; rm(list="pandoc")
    suppressMessages({
      html <- pandoc(md, format=format)
    })

    ## WORKAROUND: Did knitr::pandoc() append '_utf8' to the full name?
    html0 <- file_path_sans_ext(basename(html))
    if (grepl("_utf8$", html0)) {
      html1 <- gsub("_utf8.", ".", html, fixed=TRUE)
      renameFile(html, html1)
      html <- html1
    }
    html <- RspFileProduct(html)
  } else {
    if (isTRUE(Sys.getenv("RSP_REQ_PANDOC"))) {
      # Silently ignore if 'R CMD check' is "re-building of vignette outputs"
      pathname <- getAbsolutePath(md)
      path <- dirname(pathname)
      parts <- strsplit(path, split=c("/", "\\"), fixed=TRUE)
      parts <- unlist(parts, use.names=FALSE)
      vignetteTests <- any(parts == "vign_test")
      if (vignetteTests) {
        throw("External 'pandoc' executable is not available on this system: ", pathname)
      }
    }

    warning("Could not find external executable 'pandoc' v1.9.2 or newer on this system while running 'R CMD check' on the vignettes. Will run the default post-processor instead: ", basename(md))

    # If running R CMD check, silently accept that Pandoc is not
    # available.  Instead, just run it through the regular
    # Markdown to HTML postprocessor.
    html <- process(md)
  } # if (dzslides)

  # Remove *.md
  file.remove(md)

  invisible(html)
} # `.weave_md.rsp+knitr:pandoc`()



# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# REGISTER VIGNETTE ENGINES
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
.registerVignetteEngines <- function(pkgname) {
  # Are vignette engines supported?
  if (getRversion() < "3.0.0") return() # Nope!

  # Register vignette engines
  vignetteEngine <- get("vignetteEngine", envir=asNamespace("tools"))
  
  # RSP engine
  vignetteEngine("rsp", package=pkgname,
    pattern="[.][^.]*[.]rsp$",
    weave=rspWeave,
    tangle=rspTangle
  )

  # "asis" engine
  vignetteEngine("asis", package=pkgname,
    pattern="[.](pdf|html)[.]asis$",
    weave=asisWeave,
    tangle=asisTangle
  )

  # TeX engine
  vignetteEngine("tex", package=pkgname,
    pattern="[.](tex|ltx)$",
    weave=rspWeave,
    tangle=function(file, ..., pattern="[.](tex|ltx)$") asisTangle(file, ..., pattern=pattern)
  )

  # Markdown engine
  vignetteEngine("md", package=pkgname,
    pattern="[.]md$",
    weave=rspWeave,
    tangle=function(file, ..., pattern="[.]md$") asisTangle(file, ..., pattern=pattern)
  )

  # Markdown RSP + knitr::pandoc engine (non-offical trial version)
  vignetteEngine("md.rsp+knitr:pandoc", package=pkgname,
    pattern="[.]md[.]rsp$",
    weave=`.weave_md.rsp+knitr:pandoc`,
    tangle=rspTangle
  )
} # .registerVignetteEngines()
