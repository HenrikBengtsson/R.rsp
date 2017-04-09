%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpDaemon.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{HttpDaemon$appendRootPaths}
\alias{HttpDaemon$appendRootPaths}
\alias{appendRootPaths.HttpDaemon}
\alias{HttpDaemon.appendRootPaths}
\alias{appendRootPaths,HttpDaemon-method}
\alias{HttpDaemon.insertRootPaths}
\alias{insertRootPaths.HttpDaemon}
\alias{insertRootPaths,HttpDaemon-method}


\title{Appends and inserts new paths to the list of known root directories}

\description{
 Appends and inserts new paths to the list of known root directories, if started.
}

\usage{
## Static method (use this):
## HttpDaemon$appendRootPaths(paths, ...)

## Don't use the below:
\method{appendRootPaths}{HttpDaemon}(static, paths, ...)
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
  For more information see \code{\link{HttpDaemon}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
