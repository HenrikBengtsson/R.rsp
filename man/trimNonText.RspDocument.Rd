%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDocument.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{trimNonText.RspDocument}
\alias{trimNonText.RspDocument}
\alias{RspDocument.trimNonText}
\alias{trimNonText,RspDocument-method}

\title{Trims all non-text RSP constructs}

\description{
 Trims all non-text RSP constructs.
}

\usage{
\method{trimNonText}{RspDocument}(object, ..., verbose=FALSE)
}

\arguments{
  \item{...}{Not used.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
 Returns an \code{\link{RspDocument}}.
}

\details{
  For this method to work properly, the RspDocument should not contain
  any \code{\link{RspUnparsedDirective}}:s or \code{\link{RspUnparsedExpression}}:s,
  i.e. they should already have been parsed.
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{RspDocument}}.
}
\keyword{internal}
\keyword{methods}
