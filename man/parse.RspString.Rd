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
\alias{parse,RspString-method}

\title{Parses the RSP string}

\description{
 Parses the RSP string.
}

\usage{
\method{parse}{RspString}(object, ..., envir=parent.frame(), parser=RspParser())
}

\arguments{
  \item{...}{Additional arguments passed to the RSP parser.}
  \item{envir}{The \code{\link[base]{environment}} where the RSP document is parsed.}
  \item{parser}{An \code{\link{RspParser}}.}
}

\value{
 Returns a \code{\link{RspDocument}} (unless \code{until != "*"} in case it
 returns a deparsed \code{\link{RspString}}.)
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{RspString}}.
}
\keyword{internal}
\keyword{methods}
