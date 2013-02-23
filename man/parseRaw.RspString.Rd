%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspString.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{parseRaw.RspString}
\alias{parseRaw.RspString}
\alias{RspString.parseRaw}
\alias{parseRaw.RspString}
\alias{parseRaw,RspString-method}


\title{Parses the string into blocks of text and RSP}

\description{
 Parses the string into blocks of text and RSP.
}

\usage{\method{parseRaw}{RspString}(object, what=c("comment", "directive", "expression"), commentLength=-1, ...)}

\arguments{
  \item{...}{Not used.}
}

\value{
 Returns a named \code{\link[base]{list}} with elements named "text" and "rsp".
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  For more information see \code{\link{RspString}}.
}
\keyword{internal}
\keyword{methods}
