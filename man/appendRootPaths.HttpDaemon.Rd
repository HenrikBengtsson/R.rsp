%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpDaemon.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{appendRootPaths.HttpDaemon}
\alias{appendRootPaths.HttpDaemon}
\alias{HttpDaemon.appendRootPaths}
\alias{appendRootPaths.HttpDaemon}
\alias{appendRootPaths,HttpDaemon-method}

\alias{HttpDaemon.insertRootPaths}
\alias{insertRootPaths.HttpDaemon}
\alias{insertRootPaths,HttpDaemon-method}


\title{Appends and inserts new paths to the list of known root directories}

\description{
 Appends and inserts new paths to the list of known root directories, if started.
}

\synopsis{appendRootPaths.HttpDaemon(static, paths, ...)}
\usage{HttpDaemon$appendRootPaths(paths, ...)}

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
  For more information see \code{\link{HttpDaemon}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
