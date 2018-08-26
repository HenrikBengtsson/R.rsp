%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspParser.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{parseDocument.RspParser}
\alias{parseDocument.RspParser}
\alias{RspParser.parseDocument}
\alias{parseDocument,RspParser-method}

\title{Parse an RSP string into and RSP document}

\description{
 Parse an RSP string into and RSP document with RSP comments dropped.
}

\usage{
\method{parseDocument}{RspParser}(parser, object, envir=parent.frame(), ...,
  until=c("*", "end", "expressions", "directives", "comments"),
  as=c("RspDocument", "RspString"), verbose=FALSE)
}

\arguments{
  \item{object}{An \code{\link{RspString}} to be parsed.}
  \item{envir}{The \code{\link[base]{environment}} where the RSP document is preprocessed.}
  \item{...}{Passed to the processor in each step.}
  \item{until}{Specifies how far the parse should proceed, which is useful
     for troubleshooting and debugging.}
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
