%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspShSourceCode.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{evaluate.RspShSourceCode}
\alias{evaluate.RspShSourceCode}
\alias{RspShSourceCode.evaluate}
\alias{evaluate,RspShSourceCode-method}
\alias{RspShSourceCode.findProcessor}
\alias{findProcessor.RspShSourceCode}
\alias{findProcessor,RspShSourceCode-method}


\title{Evaluates the shell (sh) code}

\description{
 Evaluates the shell (sh) code.
}

\usage{
\method{evaluate}{RspShSourceCode}(object, envir=parent.frame(), args="*", ..., verbose=FALSE)
}

\arguments{
  \item{envir}{The \code{\link[base]{environment}} in which the RSP string is evaluated.}
  \item{args}{A named \code{\link[base]{list}} of arguments assigned to the environment
    in which the RSP string is parsed and evaluated.
    See \code{\link[R.utils]{cmdArgs}}.}
  \item{...}{Optional arguments passed to \code{\link[base]{eval}}().}
}

\value{
 Returns the outputted \code{\link[base]{character}} string, iff any.
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{RspShSourceCode}}.
}
\keyword{internal}
\keyword{methods}
