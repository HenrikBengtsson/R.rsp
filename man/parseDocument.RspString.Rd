%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspString.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{parseDocument.RspString}
\alias{parseDocument.RspString}
\alias{RspString.parseDocument}
\alias{parseDocument,RspString-method}

\title{Parses an RSP string into a RSP document}

\description{
 Parses an RSP string into a RSP document.
}

\usage{
\method{parseDocument}{RspString}(object, ..., envir=parent.frame(), parser=RspParser())
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
