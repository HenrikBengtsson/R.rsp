%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpRequest.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{getRemoteHost.HttpRequest}
\alias{getRemoteHost.HttpRequest}
\alias{HttpRequest.getRemoteHost}
\alias{getRemoteHost.HttpRequest}
\alias{getRemoteHost,HttpRequest-method}


\title{Gets the fully qualified name of the client that sent the request}

\description{
 Gets the fully qualified name of the client that sent the request. 
 If it cannot resolve the hostname, this method returns the dotted-string
 form of the IP address.
}

\usage{\method{getRemoteHost}{HttpRequest}(this, ...)}

\arguments{
  \item{...}{Not used.}
}

\value{
 Returns a \code{\link[base]{character}} string.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  \code{\link{getRemoteAddress}}().
  For more information see \code{\link{HttpRequest}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
