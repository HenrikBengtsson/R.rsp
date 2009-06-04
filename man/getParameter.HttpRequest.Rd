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
\alias{getParameter.HttpRequest}
\alias{getParameter,HttpRequest-method}


\title{Gets a parameter}

\description{
 Gets a parameter.
}

\usage{\method{getParameter}{HttpRequest}(this, name, default=NULL, ...)}

\arguments{
  \item{name}{Name of parameter to be retrieved.}
  \item{default}{Value to be returned if parameter is missing.}
  \item{...}{Not used.}
}

\value{
 Returns the value of the parameter, or the default value.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  \code{\link[R.rsp:hasParameter.HttpRequest]{*hasParameter}()}.
  \code{\link[R.rsp:getParameters.HttpRequest]{*getParameters}()}.
  For more information see \code{\link{HttpRequest}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
