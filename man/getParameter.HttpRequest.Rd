%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpRequest.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{getParameter.HttpRequest}
\alias{getParameter.HttpRequest}
\alias{HttpRequest.getParameter}
\alias{getParameter,HttpRequest-method}

\title{Gets a parameter}

\description{
 Gets a parameter.
}

\usage{
\method{getParameter}{HttpRequest}(this, name, default=NULL, drop=TRUE, ...)
}

\arguments{
  \item{name}{Name of parameter to be retrieved.}
  \item{default}{Value to be returned if parameter is missing.}
  \item{drop}{If \code{\link[base:logical]{TRUE}} and the number of returned values is one, then
   this single value is returned, otherwise a named \code{\link[base]{vector}}.}
  \item{...}{Additional arguments passed to \code{\link[R.rsp:getParameters.HttpRequest]{*getParameters}()}.}
}

\value{
 Returns the value(s) of the parameter either as a single value or
 as a named \code{\link[base]{list}}.
 If the parameter does not exist, the default value is returned as is.
}

\author{Henrik Bengtsson}

\seealso{
  \code{\link[R.rsp:hasParameter.HttpRequest]{*hasParameter}()}.
  \code{\link[R.rsp:getParameters.HttpRequest]{*getParameters}()}.
  For more information see \code{\link{HttpRequest}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
