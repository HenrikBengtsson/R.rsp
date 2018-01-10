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
 \tab \code{\link[R.rsp:appendRootPaths.HttpDaemon]{appendRootPaths}} \tab Appends and inserts new paths to the list of known root directories.\cr
 \tab \code{\link[R.rsp:as.character.HttpDaemon]{as.character}} \tab Returns a short string describing the HTTP daemon.\cr
 \tab \code{finalize} \tab  -\cr
 \tab \code{\link[R.rsp:getConfig.HttpDaemon]{getConfig}} \tab Retrieves the server's 'config' structure from Tcl.\cr
 \tab \code{getCount} \tab  -\cr
 \tab \code{\link[R.rsp:getDefaultFilenamePattern.HttpDaemon]{getDefaultFilenamePattern}} \tab Gets the default filename pattern to be loaded by the HTTP daemon.\cr
 \tab \code{\link[R.rsp:getHttpRequest.HttpDaemon]{getHttpRequest}} \tab Gets the HTTP request.\cr
 \tab \code{\link[R.rsp:getPort.HttpDaemon]{getPort}} \tab Gets the socket port of the HTTP daemon.\cr
 \tab \code{\link[R.rsp:getRootPaths.HttpDaemon]{getRootPaths}} \tab Gets the root directories of the HTTP daemon.\cr
 \tab \code{insertRootPaths} \tab  -\cr
 \tab \code{\link[R.rsp:isStarted.HttpDaemon]{isStarted}} \tab Checks if the HTTP daemon is started.\cr
 \tab \code{\link[R.rsp:openUrl.HttpDaemon]{openUrl}} \tab Starts the HTTP daemon and launches the specified URL.\cr
 \tab \code{\link[R.rsp:processRsp.HttpDaemon]{processRsp}} \tab Processes an RSP page.\cr
 \tab \code{\link[R.rsp:restart.HttpDaemon]{restart}} \tab Restarts the HTTP daemon.\cr
 \tab \code{setCount} \tab  -\cr
 \tab \code{\link[R.rsp:setRootPaths.HttpDaemon]{setRootPaths}} \tab Sets a new set of root directories for the HTTP daemon.\cr
 \tab \code{\link[R.rsp:sourceTcl.HttpDaemon]{sourceTcl}} \tab Loads the Tcl source for the HTTP daemon into R.\cr
 \tab \code{\link[R.rsp:start.HttpDaemon]{start}} \tab Starts the HTTP daemon.\cr
 \tab \code{\link[R.rsp:startHelp.HttpDaemon]{startHelp}} \tab Starts the HTTP daemon and launches the help page.\cr
 \tab \code{\link[R.rsp:terminate.HttpDaemon]{terminate}} \tab Terminates the HTTP daemon.\cr
 \tab \code{\link[R.rsp:writeResponse.HttpDaemon]{writeResponse}} \tab Writes a string to the HTTP output connection.\cr
}


 \bold{Methods inherited from Object}:\cr
$, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clearLookupCache, clone, detach, equals, extend, finalize, getEnvironment, getFieldModifier, getFieldModifiers, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, names, objectSize, print, save


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
