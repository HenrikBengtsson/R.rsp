%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspParser.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{parseRaw.RspParser}
\alias{parseRaw.RspParser}
\alias{RspParser.parseRaw}
\alias{parseRaw,RspParser-method}

\title{Parses the string into blocks of text and RSP}

\description{
 Parses the string into blocks of text and RSP.
}

\usage{
\method{parseRaw}{RspParser}(parser, object, what=c("comment", "directive", "expression"), commentLength=-1L,
  ..., verbose=FALSE)
}

\arguments{
  \item{object}{An \code{\link{RspString}} to be parsed.}
  \item{what}{A \code{\link[base]{character}} string specifying what type of RSP construct
    to parse for.}
  \item{commentLength}{Specify the number of hypens in RSP comments
    to parse for.}
  \item{...}{Not used.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
 Returns a named \code{\link[base]{list}} with elements named "text" and "rsp".
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{RspParser}}.
}
\keyword{internal}
\keyword{methods}
