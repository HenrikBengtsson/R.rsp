%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpDaemon.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{setRootPaths.HttpDaemon}
\alias{setRootPaths.HttpDaemon}
\alias{HttpDaemon.setRootPaths}
\alias{setRootPaths.HttpDaemon}
\alias{setRootPaths,HttpDaemon-method}


\title{Sets a new set of root directories for the HTTP daemon}

\description{
 Sets a new set of root directories for the HTTP daemon, if started.
}

\synopsis{setRootPaths.HttpDaemon(static, paths, ...)}
\usage{HttpDaemon$setRootPaths(paths, ...)}

\arguments{
  \item{paths}{A \code{\link[base]{vector}} of paths.}
  \item{...}{Not used.}
}

\value{
 Returns (invisibly) the previously known root directories.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  \code{\link[R.rsp:getRootPaths.HttpDaemon]{*getRootPaths}()}
  \code{\link[R.rsp:appendRootPaths.HttpDaemon]{*appendRootPaths}()}
  For more information see \code{\link{HttpDaemon}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
