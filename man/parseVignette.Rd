%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  buildNonSweaveVignette.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{parseVignette}
\alias{parseVignette}


\title{Parses an Rnw file}

\description{
 Parses an Rnw file.
}

\usage{
parseVignette(pathname, commentPrefix="^\%[ 	]*", ...)
}

\arguments{
  \item{pathname}{The Rnw file to be parsed.}
  \item{commentPrefix}{A regular expression specifying the prefix
    pattern of vignette comments.}
  \item{...}{Not used.}
}

\value{
  Returns a named \code{\link[base]{list}}.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  To build all non-Sweave vignettes, see \code{\link{buildNonSweaveVignettes}}().
}




\keyword{file}
\keyword{IO}
\keyword{internal}
