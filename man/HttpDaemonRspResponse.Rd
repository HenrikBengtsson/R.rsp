%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpDaemonRspResponse.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{HttpDaemonRspResponse}
\docType{class}
\alias{HttpDaemonRspResponse}


\title{The HttpDaemonRspResponse class}

\description{
 Package:  R.rsp \cr
\bold{Class HttpDaemonRspResponse}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspResponse}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{FileRspResponse}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{HttpDaemonRspResponse}\cr

\bold{Directly known subclasses:}\cr
\cr

public static class \bold{HttpDaemonRspResponse}\cr
extends \link[R.rsp]{FileRspResponse}\cr



 An instance of class HttpDaemonRspResponse, which extends the
 \code{\link{RspResponse}} class, is a buffer for output (response) sent to an
 \code{\link{HttpDaemon}}.  It provides a method \code{writeResponse()} for writing
 output and a method \code{flush()} for flush the written output to
 the HTTP daemon.
}

\usage{
HttpDaemonRspResponse(httpDaemon=NULL, ...)
}

\arguments{
  \item{httpDaemon}{An \code{\link{HttpDaemon}} object.}
  \item{...}{Not used.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{flush} \tab  -\cr
 \tab \code{writeResponse} \tab  -\cr
}


 \bold{Methods inherited from FileRspResponse}:\cr
flush, getAbsolutePath, getName, getOutput, getPath, writeResponse

 \bold{Methods inherited from RspResponse}:\cr
flush, write, writeResponse

 \bold{Methods inherited from Object}:\cr
$, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clearLookupCache, clone, detach, equals, extend, finalize, getEnvironment, getFieldModifier, getFieldModifiers, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, names, objectSize, print, save


}

\details{
 The purpose of this method is to provide partial writing of HTTP response
 such that, for instance, a web browser can display parts of an HTML page
 while the rest is generated.  Note that this is only supported by the
 HTTP v1.1 protocol.

 \emph{Note:
  The minimalistic HTTP daemon (written in Tcl) used internally
  currently only supports HTTP v1.0. In other words, although this class
  is used already, the output is only flushed at the end.
 }
}

\author{Henrik Bengtsson}

\seealso{
  \code{\link{HttpDaemon}}.
}



\keyword{classes}
\keyword{IO}
\keyword{internal}
