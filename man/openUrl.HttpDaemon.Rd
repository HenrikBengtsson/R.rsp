%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpDaemon.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{openUrl.HttpDaemon}
\alias{openUrl.HttpDaemon}
\alias{HttpDaemon.openUrl}
\alias{openUrl.HttpDaemon}
\alias{openUrl,HttpDaemon-method}


\title{Starts the HTTP daemon and launches the specified URL}

\description{
 Starts the HTTP daemon and launches the specified URL.
}

\usage{\method{openUrl}{HttpDaemon}(static, url=sprintf("http://\%s:\%d/\%s", host, port, path), host="127.0.0.1", port=8074, path="", ...)}

\arguments{
  \item{url}{The URL to be opened.}
  \item{host}{The host where the HTTP server is running.}
  \item{port}{The port to be used.}
  \item{path}{The path to the document to be opened.}
  \item{...}{Not used.}
}

\value{
 Returns nothing.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  Called by for instance \code{\link[R.rsp:startHelp.HttpDaemon]{*startHelp}()}.
  For more information see \code{\link{HttpDaemon}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
