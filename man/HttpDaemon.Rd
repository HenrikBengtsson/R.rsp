%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpDaemon.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{HttpDaemon}
\docType{class}
\alias{HttpDaemon}


\title{The HttpDaemon class}

\description{
 Package:  R.rsp \cr
\bold{Class HttpDaemon}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{HttpDaemon}\cr

\bold{Directly known subclasses:}\cr
\cr

public static class \bold{HttpDaemon}\cr
extends \link[R.oo]{Object}\cr



 A minimalistic HTTP daemon (web server) that also preprocesses RSP.
}

\usage{
HttpDaemon(...)
}

\arguments{
  \item{...}{Not used.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{appendRootPaths} \tab  -\cr
 \tab \code{as.character} \tab  -\cr
 \tab \code{finalize} \tab  -\cr
 \tab \code{getConfig} \tab  -\cr
 \tab \code{getCount} \tab  -\cr
 \tab \code{getDefaultFilenamePattern} \tab  -\cr
 \tab \code{getHttpRequest} \tab  -\cr
 \tab \code{getPort} \tab  -\cr
 \tab \code{getRootPaths} \tab  -\cr
 \tab \code{insertRootPaths} \tab  -\cr
 \tab \code{isStarted} \tab  -\cr
 \tab \code{openUrl} \tab  -\cr
 \tab \code{processRsp} \tab  -\cr
 \tab \code{restart} \tab  -\cr
 \tab \code{setCount} \tab  -\cr
 \tab \code{setRootPaths} \tab  -\cr
 \tab \code{sourceTcl} \tab  -\cr
 \tab \code{start} \tab  -\cr
 \tab \code{startHelp} \tab  -\cr
 \tab \code{stop} \tab  -\cr
 \tab \code{writeResponse} \tab  -\cr
}


 \bold{Methods inherited from Object}:\cr
$, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clearLookupCache, clone, detach, equals, extend, finalize, getEnvironment, getFieldModifier, getFieldModifiers, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, save


}

\details{
 The actual server is written in Tcl such that it runs in a non-blocking
 mode, which means that the R prompt will be available for other things.
 This class is tightly coupled with the source code of the Tcl script.

 For security reasons, the server only accept connections from the
 local host (127.0.0.1).  This lowers the risk for external computers
 to gain access to the R session.
 This is asserted by the \code{accept_connect} Tcl procedure in
 r-httpd.tcl (located in \code{system("tcl/", package="R.rsp")}).
 If access from other hosts are wanted, then this procedure needs to
 be modified.

 The Tcl server was written by Steve Uhlers, and later adopted for R by
 Philippe Grosjean and Tom Short (Rpad package author) [1].
}

\examples{
if (interactive()) {
  if (!HttpDaemon$isStarted()) {
    # Start the web server
    rootPath <- system.file("rsp", package="R.rsp")
    HttpDaemon$start(rootPath=rootPath, port=8074, default="^index[.](html|.*)$")
  }
 
  browseURL("http://127.0.0.1:8074/")
}
}

\references{
  [1] Rpad package, Tom Short, 2005.\cr
}

\author{Henrik Bengtsson}



\keyword{classes}
\keyword{IO}
\keyword{internal}
