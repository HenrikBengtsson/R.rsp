%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  xweavetangle.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rspWeave}
\alias{rspWeave}


\title{A weave function for RSP documents}

\description{
 A weave function for RSP documents.
 This function is for RSP what \code{\link[utils]{Sweave}} is for Sweave documents.
}

\usage{rspWeave(file, ..., envir=parent.frame())}

\arguments{
  \item{file}{The file to be weaved.}
  \item{...}{Not used.}
  \item{envir}{The \code{\link[base]{environment}} where the RSP document is
        parsed and evaluated.}
}

\value{
  Returns the absolute pathname of the generated RSP product.
  The generated RSP product is not postprocessed.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  \code{\link{rspTangle}}()
}




\keyword{file}
\keyword{IO}
\keyword{internal}
