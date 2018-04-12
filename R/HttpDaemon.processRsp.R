#########################################################################/**
# @set "class=HttpDaemon"
# @RdocMethod processRsp
#
# @title "Processes an RSP page"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{pathname}{The RSP file to be processed.}
#   \item{version}{The version of the RSP processor to use.}
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns nothing.
# }
#
# \section{Settings}{
#   The \pkg{R.rsp} package implements different RSP engines.
#   It is possible to specify which version the Tcl HTTP daemon
#   should use via the option \code{R.rsp/HttpDaemon/RspVersion}.
#   The default is now to use the new RSP engine, which corresponds
#   \code{options("R.rsp/HttpDaemon/RspVersion"="1.0.0")}.
#   The old legacy RSP engine \code{"0.1.0"} is defunct.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#
# @keyword IO
#*/#########################################################################
setMethodS3("processRsp", "HttpDaemon", function(static=getStaticInstance(HttpDaemon), pathname=tcltk::tclvalue("mypath"), version=getOption("R.rsp/HttpDaemon/RspVersion", "1.0.0"), ...) {
  # If processRsp() was called from Tcl, then it is called without
  # arguments, which is why we need this rather ad hoc solution to
  # default 'static' to getStaticInstance().
  daemon <- static


  # Use a "global" tryCatch() to catch and respond to RSP processing errors
  tryCatch({

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'pathname':
  pathname <- as.character(pathname)

  # Validate pathname
  pathname <- Arguments$getReadablePathname(pathname)

  # Argment 'version':
  if (!is.element(version, c("0.1.0", "1.0.0"))) {
    throw("Unknown HttpDaemon RSP version: ", version)
  }

  if (version == "0.1.0") {
    .Defunct(msg = "RSP HTTP daemon v0.1.0 is defunct, because it relies on an old legacy RSP engine, which has been removed. Use v1.0.0 instead, by removing options 'R.rsp/HttpDaemon/RspVersion' or setting it to '1.0.0'.")
  }

  debug <- isTRUE(daemon$.debug)

  if (debug) {
    mcat("DEBUG: RSP version: ", version, "\n", sep="")
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Setup
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  path <- getParent(pathname)
  filename <- basename(pathname)

  # Record the current directory
  opwd <- getwd()
  on.exit(setwd(opwd))

  # Set the current working directory of the HTTP daemon
  daemon$pwd <- opwd
  setwd(path)

  # Get the HTTP request information
  request <- getHttpRequest(daemon)

  if (debug) {
    mcat("DEBUG: RSP file: ", pathname, "\n", sep="")
    mcat("DEBUG: Working directory: ", path, "\n", sep="")
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Process RSP file
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (version == "1.0.0") {
    response <- HttpDaemonRspResponse(httpDaemon=daemon)
    page <- RspPage(pathname)
    pathnameR <- rfile(file=filename, workdir=opwd, args=list(page=page, request=request, response=response))
    s <- readLines(pathnameR, warn=FALSE)
    s <- paste(s, collapse="\n")
    if (nchar(s) > 0L) writeResponse(daemon, s)
  }

  }, error = function(ex) {
    mcat("ERROR:")
    mprint(ex)
    writeResponse(daemon, as.character(ex))
    if (!is.null(ex$code)) {
      code <- paste(ex$code, collapse="\n")
      mcat(code, "\n")
      mprint(ex)
      writeResponse(daemon, code)
    }
  }) # tryCatch()
}, static=TRUE, protected=TRUE)
