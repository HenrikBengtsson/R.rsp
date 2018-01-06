%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpDaemon.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{HttpDaemon$isStarted}
\alias{HttpDaemon$isStarted}
\alias{isStarted.HttpDaemon}
\alias{HttpDaemon.isStarted}
\alias{isStarted,HttpDaemon-method}

\title{Checks if the HTTP daemon is started}

\description{
 Checks if the HTTP daemon is started.
}

\usage{
## Static method (use this):
## HttpDaemon$isStarted(...)

## Don't use the below:
\method{isStarted}{HttpDaemon}(x, ...)
}

\arguments{
  \item{...}{Not used.}
}

\value{
 Returns \code{\link[base:logical]{TRUE}} if the server is started, otherwise \code{\link[base:logical]{FALSE}}.
}

\author{Henrik Bengtsson}

\seealso{
  \code{\link[R.rsp:start.HttpDaemon]{*start}()} and \code{\link[R.rsp:terminate.HttpDaemon]{*terminate}()}.
  For more information see \code{\link{HttpDaemon}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
