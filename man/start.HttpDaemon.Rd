%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpDaemon.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{HttpDaemon$start}
\alias{HttpDaemon$start}
\alias{start.HttpDaemon}
\alias{HttpDaemon.start}
\alias{start,HttpDaemon-method}

\title{Starts the HTTP daemon}

\description{
 Starts the HTTP daemon.  Currently, only one HTTP daemon can run at each time,
 regardless of port used.
}

\usage{
## Static method (use this):
## HttpDaemon$start(rootPaths=NULL, port=8080, default="^index[.](html|.*)$", ...)

## Don't use the below:
\method{start}{HttpDaemon}(x, rootPaths=NULL, port=8080, default="^index[.](html|.*)$", ...)
}

\arguments{
  \item{rootPaths}{The path(s) to act as the root of the webserver file
      system.  Files in parent directories of the root, will not be
      accessable.  If \code{\link[base]{NULL}}, the preset paths will be used,
      cf. \code{\link[R.rsp:setRootPaths.HttpDaemon]{*setRootPaths}()}.}
  \item{port}{The socket port the server listens to.}
  \item{default}{The default filename pattern to be retrieved if
      not specified.}
  \item{...}{Not used.}
}

\value{
 Returns nothing.
}

\author{Henrik Bengtsson}

\seealso{
  \code{\link[R.rsp:setRootPaths.HttpDaemon]{*setRootPaths}()}.
  \code{\link[R.rsp:isStarted.HttpDaemon]{*isStarted}()}.
  \code{\link[R.rsp:terminate.HttpDaemon]{*terminate}()}.
  \code{\link[R.rsp:restart.HttpDaemon]{*restart}()}.
  For more information see \code{\link{HttpDaemon}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
