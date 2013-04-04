%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspString.toR.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\name{toR.RspString}
\alias{toR.RspString}
\alias{RspString.toR}
\alias{toR,RspString-method}

\title{Parses and translates the RSP string into R code}

\description{
 Parses and translates the RSP string into R code.
}

\usage{
\method{toR}{RspString}(object, envir=parent.frame(), ...)
}

\arguments{
  \item{envir}{The \code{\link[base]{environment}} where the RSP string is preprocessed.}
  \item{...}{Not used.}
}

\value{
 Returns the code as an \code{\link{RspRSourceCode}}.
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{RspString}}.
}
\keyword{internal}
\keyword{methods}
