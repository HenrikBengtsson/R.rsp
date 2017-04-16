%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpDaemon.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{HttpDaemon$setRootPaths}
\alias{HttpDaemon$setRootPaths}
\alias{setRootPaths.HttpDaemon}
\alias{HttpDaemon.setRootPaths}
\alias{setRootPaths,HttpDaemon-method}

\title{Sets a new set of root directories for the HTTP daemon}

\description{
 Sets a new set of root directories for the HTTP daemon, if started.
}

\usage{
## Static method (use this):
## HttpDaemon$setRootPaths(paths, ...)

## Don't use the below:
\method{setRootPaths}{HttpDaemon}(static, paths, ...)
}

\arguments{
  \item{paths}{A \code{\link[base]{vector}} of paths.}
  \item{...}{Not used.}
}

\value{
 Returns (invisibly) the previously known root directories.
}

\author{Henrik Bengtsson}

\seealso{
  \code{\link[R.rsp:getRootPaths.HttpDaemon]{*getRootPaths}()}
  \code{\link[R.rsp:appendRootPaths.HttpDaemon]{*appendRootPaths}()}
  For more information see \code{\link{HttpDaemon}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
