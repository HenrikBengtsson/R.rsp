###########################################################################/**
# @RdocClass HttpDaemonRspResponse
#
# @title "The HttpDaemonRspResponse class"
#
# \description{
#  @classhierarchy
#
#  An instance of class HttpDaemonRspResponse, which extends the
#  @see "RspResponse" class, is a buffer for output (response) sent to an
#  @see "HttpDaemon".  It provides a method \code{writeResponse()} for writing
#  output and a method \code{flush()} for flush the written output to
#  the HTTP daemon.
# }
#
# @synopsis
#
# \arguments{
#   \item{httpDaemon}{An @see "HttpDaemon" object.}
#   \item{...}{Not used.}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
#
# \details{
#  The purpose of this method is to provide partial writing of HTTP response
#  such that, for instance, a web browser can display parts of an HTML page
#  while the rest is generated.  Note that this is only supported by the
#  HTTP v1.1 protocol.
#
#  \emph{Note:
#   The minimalistic HTTP daemon (written in Tcl) used internally
#   currently only supports HTTP v1.0. In other words, although this class
#   is used already, the output is only flushed at the end.
#  }
# }
#
# @author
#
# \seealso{
#   @see "HttpDaemon".
# }
#
# @keyword IO
# @keyword internal
#*/###########################################################################
setConstructorS3("HttpDaemonRspResponse", function(httpDaemon=NULL, ...) {
  if (!is.null(httpDaemon)) {
    if (!inherits(httpDaemon, "HttpDaemon")) {
      throw("Argument 'httpDaemon' is not an HttpDaemon object: ",
                                                       class(httpDaemon)[1]);
    }
  }

  extend(FileRspResponse(), "HttpDaemonRspResponse",
    .httpDaemon = httpDaemon,
    .bfr = NULL,
    ...
  )
})


setMethodS3("writeResponse", "HttpDaemonRspResponse", function(this, ..., collapse="", sep="") {
  version <- getOption("R.rsp/HttpDaemon/RspVersion", "0.1.0");
  # Argment 'version':
  if (!is.element(version, c("0.1.0", "1.0.0"))) {
    throw("Unknown HttpDaemon RSP version: ", version);
  }

  # String to output
  msg <- paste(..., collapse=collapse, sep=sep);
  msg <- as.character(GString(msg));

  if (version == "0.1.0") {
    this$.bfr <- c(this$.bfr, msg);
  } else if (version == "1.0.0") {
    cat(msg);
  }
})



setMethodS3("flush", "HttpDaemonRspResponse", function(con) {
  # To please R CMD check.
  this <- con;

  # Get the content of the buffer
  bfr <- this$.bfr;

  if (is.null(bfr))
    return(invisible(as.integer(0)));

  # Write buffer
  len <- writeResponse(this$.httpDaemon, bfr);

  # Clear buffer
  this$.bfr <- NULL;

  invisible(len);
}, appendVarArgs=FALSE)
