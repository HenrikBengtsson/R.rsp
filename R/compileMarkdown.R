###########################################################################/**
# @RdocDefault compileMarkdown
#
# @title "Compiles a Markdown file"
#
# \description{
#  @get "title" to HTML.
# }
#
# @synopsis
#
# \arguments{
#   \item{filename, path}{The filename and (optional) path of the
#      Markdown document to be compiled.}
#   \item{...}{Additional arguments passed to @see "markdown::markdownToHTML".}
#   \item{outPath}{The output and working directory.}
#   \item{header}{@character @vector of valid HTML strings that should be added to the HTML <head> section.}
#   \item{metadata}{A named @list with meta data that will add as <meta> tags in the HTML <head> section.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns the pathname of the generated HTML document.
# }
#
# \details{
#   The input encoding is based on \code{getOption("encoding")} and
#   the output encoding is \code{"UTF-8"}
#   (forced by @see "markdown::markdownToHTML").
# }
#
# @author
#
# \seealso{
#   Internally, @see "markdown::markdownToHTML" is used.
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/###########################################################################
setMethodS3("compileMarkdown", "default", function(filename, path=NULL, ..., outPath=".", header=NULL, metadata=getMetadata(filename), verbose=FALSE) {

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Arguments 'filename' & 'path':
  pathname <- if (is.null(path)) filename else file.path(path, filename)
  if (!isUrl(pathname)) {
    pathname <- Arguments$getReadablePathname(pathname)
  }

  # Arguments 'outPath':
  outPath <- Arguments$getWritablePath(outPath)
  if (is.null(outPath)) outPath <- "."

  # Argument 'metadata':
  if (is.null(metadata)) metadata <- list()
  stop_if_not(is.list(metadata))

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose)
  if (verbose) {
    pushState(verbose)
    on.exit(popState(verbose))
  }

  # Arguments '...':


  verbose && enter(verbose, "Compiling Markdown document")

  ## Incorporate meta data into HTML header?
  if (length(metadata) > 0L) {
    keywords <- metadata[["keywords"]]
    if (length(keywords) > 0L) {
      keywords <- paste(keywords, collapse=", ")
      headerT <- sprintf('<meta name="keywords" content="%s">', keywords)
      header <- c(header, headerT)
    }

    author <- metadata[["author"]]
    if (length(author) > 0L) {
      author <- paste(author, collapse=", ")
      headerT <- sprintf('<meta name="author" content="%s">', author)
      header <- c(header, headerT)
    }
  }
  header <- paste(header, collapse="\n")


  # Download URL?
  if (isUrl(pathname)) {
    verbose && enter(verbose, "Downloading URL")
    url <- pathname
    verbose && cat(verbose, "URL: ", url)
    pathname <- downloadFile(url, verbose=less(verbose,50))
    verbose && cat(verbose, "Local file: ", pathname)
    verbose && exit(verbose)
  }

  pathname <- getAbsolutePath(pathname)
  verbose && cat(verbose, "Markdown pathname (absolute): ", pathname)
  verbose && printf(verbose, "Input file size: %g bytes\n", file.info(pathname)$size)
  verbose && cat(verbose, "Output and working directory: ", getAbsolutePath(outPath))
  pattern <- "(.*)[.]([^.]+)$"
  replace <- "\\1.html"
  filenameOut <- gsub(pattern, replace, basename(pathname))
  pathnameOut <- filePath(outPath, filenameOut)
  pathnameOut <- getAbsolutePath(pathnameOut)
  verbose && cat(verbose, "Output pathname: ", pathnameOut)

  opwd <- "."
  on.exit(setwd(opwd), add=TRUE)
  if (!is.null(outPath)) {
    opwd <- setwd(outPath)
  }

  mdToHTML <- markdown::markdownToHTML
  fcnName <- "markdown::markdownToHTML()"

  verbose && enterf(verbose, "Calling %s", fcnName)
  pathnameR <- getRelativePath(pathname)
  pathnameOutR <- getRelativePath(pathnameOut)

  userArgs <- list(...)
  keep <- is.element(names(userArgs), names(formals(mdToHTML)))
  userArgs <- userArgs[keep]

  args <- c(list(pathnameR, output=pathnameOutR), userArgs, header=header)
  verbose && cat(verbose, "Arguments:")
  verbose && str(verbose, args)
  verbose && printf(verbose, "Input encoding: %s (from option 'encoding')\n", getOption("encoding"))
  verbose && printf(verbose, "Output encoding: UTF-8 (forced by %s)\n", fcnName)
  do.call(mdToHTML, args=args)

  verbose && exit(verbose)

  setwd(opwd); opwd <- "."
  verbose && printf(verbose, "Output file size: %g bytes\n", file.info(pathnameOut)$size)

  # Sanity check
  pathnameOut <- Arguments$getReadablePathname(pathnameOut)

  verbose && exit(verbose)

  pathnameOut
}) # compileMarkdown()
