%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspString.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{parse.RspString}
\alias{parse.RspString}
\alias{RspString.parse}
\alias{parse.RspString}
\alias{parse,RspString-method}


\title{Parses the RSP string}

\description{
 Parses the RSP string with RSP comments dropped.
}

\usage{\method{parse}{RspString}(object, preprocess=TRUE, envir=parent.frame(), ...)}

\arguments{
  \item{preprocess}{If \code{\link[base:logical]{TRUE}}, all RSP preprocessing directives
     are processed after the RSP string is parsed, otherwise not.}
  \item{envir}{The \code{\link[base]{environment}} where the RSP document is preprocessed.}
  \item{...}{Not used.}
}

\value{
 Returns a \code{\link{RspDocument}}.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  For more information see \code{\link{RspString}}.
}
\keyword{internal}
\keyword{methods}
