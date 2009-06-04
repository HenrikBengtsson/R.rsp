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
#  @see "HttpDaemon".  It provides a method \code{write()} for writing
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



#########################################################################/**
# @RdocMethod write
#
# @title "Writes strings to an HttpDaemonRspResponse buffer"

# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{One or several strings, which will be concatenated.}
#   \item{sep}{The string to used for concatenating several strings.}
#   \item{collapse}{The string to used collapse vectors together.}
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
#
# @keyword IO
#*/######################################################################### 
setMethodS3("write", "HttpDaemonRspResponse", function(this, ..., collapse="", sep="") {
  msg <- paste(..., collapse="", sep="");  
  msg <- as.character(GString(msg));
  this$.bfr <- c(this$.bfr, msg);
})



#########################################################################/**
# @RdocMethod flush
#
# @title "Flushes the buffer of an HttpDaemonRspResponse to the HttpDaemon"

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
#  Returns (invisibly) the number of characters flushed.
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
setMethodS3("flush", "HttpDaemonRspResponse", function(con, ...) {
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
})



##############################################################################
# HISTORY:
# 2006-07-04
# o Renamed from HttpDaemonResponse to HttpDaemonRspResponse.
# 2006-01-21
# o Made the class independent of the Tcl source code.  Now it is simply
#   flushing output to writeResponse() of the HttpDaemon object.
# o Added Rdoc comments.
# 2005-11-30
# o Created.
##############################################################################
