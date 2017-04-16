%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpDaemon.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{HttpDaemon$getPort}
\alias{HttpDaemon$getPort}
\alias{getPort.HttpDaemon}
\alias{HttpDaemon.getPort}
\alias{getPort,HttpDaemon-method}

\title{Gets the socket port of the HTTP daemon}

\description{
 Gets the socket port of the HTTP daemon, if started.
}

\usage{
## Static method (use this):
## HttpDaemon$getPort(...)

## Don't use the below:
\method{getPort}{HttpDaemon}(static, ...)
}

\arguments{
  \item{...}{Not used.}
}

\value{
 Returns an \code{\link[base]{integer}} if started, otherwise \code{\link[base]{NA}}.
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{HttpDaemon}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
