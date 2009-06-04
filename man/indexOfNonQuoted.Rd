%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  indexOfNonQuoted.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{indexOfNonQuoted}
\alias{indexOfNonQuoted.default}
\alias{indexOfNonQuoted}

\title{Gets the first index of a string that is not inside a double qouted string}

\description{
 Gets the first index of a string that is not inside a double qouted string.
}

\usage{\method{indexOfNonQuoted}{default}(str, pattern, ...)}

\arguments{
  \item{str}{The \code{\link[base]{character}} string to be scanned.}
  \item{pattern}{The \code{\link[base]{character}} string to be searched for.}
  \item{...}{Not used.}
}

\value{
  Returns an \code{\link[base]{integer}} giving the position of (the first character of)
  the search string in the main string.  If not found, -1 is returned.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  \code{\link[base]{grep}}().
}




\keyword{programming}
\keyword{utilities}
\keyword{internal}
