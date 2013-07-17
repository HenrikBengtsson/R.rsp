%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspRSourceCode.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{evaluate.RspRSourceCode}
\alias{evaluate.RspRSourceCode}
\alias{RspRSourceCode.evaluate}
\alias{evaluate,RspRSourceCode-method}
\alias{RspRSourceCode.findProcessor}
\alias{findProcessor.RspRSourceCode}
\alias{findProcessor,RspRSourceCode-method}


\title{Parses and evaluates the R code}

\description{
 Parses and evaluates the R code.
}

\usage{
\method{evaluate}{RspRSourceCode}(object, envir=parent.frame(), args="*", ..., verbose=FALSE)
}

\arguments{
  \item{envir}{The \code{\link[base]{environment}} in which the RSP string is evaluated.}
  \item{args}{A named \code{\link[base]{list}} of arguments assigned to the environment
    in which the RSP string is parsed and evaluated.
    See \code{\link[R.utils]{cmdArgs}}.}
  \item{...}{Not used.}
}

\value{
 Returns the outputted \code{\link[base]{character}} string, iff any.
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{RspRSourceCode}}.
}
\keyword{internal}
\keyword{methods}
