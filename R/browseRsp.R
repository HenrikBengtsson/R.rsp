###########################################################################/**
# @RdocDefault browseRsp
# @alias browseRsp.Package
#
# @title "Starts the internal web browser and opens the URL in the default web browser"
#
# \description{
#  @get "title".
#  From this page you access not only help pages and demos on how to use
#  RSP, but also other package RSP pages.
# }
#
# @synopsis
#
# \arguments{
#   \item{url}{A @character string for the URL to be viewed.  
#     By default the URL is constructed from the \code{host}, \code{port},
#     and the \code{path} parameters.
#   }
#   \item{host}{An optional @character string for the host of the URL.}
#   \item{port}{An optional @integer for the port of the URL.}
#   \item{path}{An optional @character string for the context path of the URL.}
#   \item{start}{If @TRUE, the internal \R web server is started if not
#     already started, otherwise not.}
#   \item{stop}{If @TRUE, the internal \R web server is stopped, if started.}
#   \item{...}{Not used.}
# }
#
# \value{
#   Returns nothing.
# }
#
# @author
#
# \seealso{
#   @see "utils::browseURL".
# }
#
# @keyword file
# @keyword IO
#*/###########################################################################
setMethodS3("browseRsp", "default", function(url=sprintf("http://%s:%d/%s", host, port, path), host="127.0.0.1", port=8074, path="", start=TRUE, stop=FALSE, ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'port':
  port <- Arguments$getInteger(port, range=c(0,65535));

  # Argument 'stop':
  stop <- Arguments$getLogical(stop);


  # Get the/a HTTP daemon
  httpDaemon <- getStaticInstance(HttpDaemon);

  # Stop HTTP server?
  if (stop) {
    if (isStarted(httpDaemon))
      stop(httpDaemon);
    return(!isStarted(httpDaemon));
  }

  # Start HTTP server?
  if (start) {
    # Add the parent of all library paths to the list of known root paths
    paths <- dirname(.libPaths());
    # Add /library/R.rsp/rsp/ as a root path too.
    paths <- c(paths, system.file("rsp", package="R.rsp"));
    appendRootPaths(httpDaemon, paths);

    if (!isStarted(httpDaemon)) {
      # Start the web server
      start(httpDaemon, port=port, default="index.rsp")
    }
  }

  if (!is.null(url)) {
    browseURL(url);
  }
})


setMethodS3("browseRsp", "Package", function(this, ..., path=sprintf("library/%s/rsp/", getName(this))) {
  browseRsp(..., path=path);
})


############################################################################
# HISTORY:
# 2011-03-12
# o Replaced all references to static class HttpDaemon by a single one.
#   This will make it easier to generalize the code in the future.
# 2007-07-19
# o Added Rdoc comments.
# 2007-07-11
# o Added browseRsp() for the Package too, e.g. browseRsp(aroma.light).
# o Now (the parents of) all library paths are added to the root paths.
# o Now the root paths are updated each time browseRsp(start=TRUE) is
#   called, even if the HTTP daemon is already started.
# 2005-10-18
# o Created.
############################################################################
