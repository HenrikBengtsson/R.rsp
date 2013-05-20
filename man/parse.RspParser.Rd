%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspParser.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{parse.RspParser}
\alias{parse.RspParser}
\alias{RspParser.parse}
\alias{parse,RspParser-method}

\title{Parses the RSP string}

\description{
 Parses the RSP string with RSP comments dropped.
}

\usage{
\method{parse}{RspParser}(parser, object, envir=parent.frame(), ..., until=c("*", "end", "expressions",
  "directives", "comments"), as=c("RspDocument", "RspString"), verbose=FALSE)
}

\arguments{
  \item{object}{An \code{\link{RspString}} to be parsed.}
  \item{envir}{The \code{\link[base]{environment}} where the RSP document is preprocessed.}
  \item{...}{Passed to the processor in each step.}
  \item{until}{Specifies how far the parse should proceed, which is useful
     for troubleshooting and rebugging.}
  \item{as}{Specifies in what format the parsed RSP document
     should be returned.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
 Returns a \code{\link{RspDocument}} (when \code{as = "RspDocument"}; default)
 or \code{\link{RspString}} (when \code{as = "RspString"}).
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{RspParser}}.
}
\keyword{internal}
\keyword{methods}
