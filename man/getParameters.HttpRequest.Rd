%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpRequest.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{getParameters.HttpRequest}
\alias{getParameters.HttpRequest}
\alias{HttpRequest.getParameters}
\alias{getParameters,HttpRequest-method}

\title{Gets all parameters}

\description{
 Gets all parameters.
}

\usage{
\method{getParameters}{HttpRequest}(this, trim=FALSE, ...)
}

\arguments{
  \item{trim}{If \code{\link[base:logical]{TRUE}}, each parameter value is trimmed of whitespace.}
  \item{...}{Not used.}
}

\value{
 Returns a named \code{\link[base]{list}}.
}

\author{Henrik Bengtsson}

\seealso{
  \code{\link[R.rsp:getParameter.HttpRequest]{*getParameter}()}.
  For more information see \code{\link{HttpRequest}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
