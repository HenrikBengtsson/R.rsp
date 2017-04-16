%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpDaemon.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{HttpDaemon$getRootPaths}
\alias{HttpDaemon$getRootPaths}
\alias{getRootPaths.HttpDaemon}
\alias{HttpDaemon.getRootPaths}
\alias{getRootPaths,HttpDaemon-method}

\title{Gets the root directories of the HTTP daemon}

\description{
 Gets the root directories of the HTTP daemon.
}

\usage{
## Static method (use this):
## HttpDaemon$getRootPaths(...)

## Don't use the below:
\method{getRootPaths}{HttpDaemon}(static, ...)
}

\arguments{
  \item{...}{Not used.}
}

\value{
 Returns a \code{\link[base]{vector}} of \code{\link[base]{character}} string if started, otherwise \code{\link[base]{NA}}.
}

\author{Henrik Bengtsson}

\seealso{
  \code{\link[R.rsp:setRootPaths.HttpDaemon]{*setRootPaths}()}
  \code{\link[R.rsp:appendRootPaths.HttpDaemon]{*appendRootPaths}()}
  For more information see \code{\link{HttpDaemon}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
