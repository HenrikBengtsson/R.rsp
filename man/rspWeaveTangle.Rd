%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  xweavetangle.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rspWeaveTangle}
\alias{rspWeaveTangle}


\title{A weave and tangle function for RSP documents}

\description{
 A weave and tangle function for RSP documents.
 This function calls both \code{\link{rspWeave}}() and \code{\link{rspTangle}}() on
 the same vignette source file.
}

\usage{
rspWeaveTangle(file, ..., envir=parent.frame())
}

\arguments{
  \item{file}{The file to be processed.}
  \item{...}{Passed to \code{\link{rspWeave}}() and \code{\link{rspTangle}}().}
  \item{envir}{The \code{\link[base]{environment}} where the RSP document is processed.}
}

\value{
  Returns the absolute pathname of the generated weave product.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  \code{\link{rspWeave}}() and \code{\link{rspTangle}}()
}




\keyword{file}
\keyword{IO}
\keyword{internal}
