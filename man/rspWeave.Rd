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

\usage{
rspWeave(file, ..., postprocess=TRUE, quiet=FALSE, envir=new.env(), .engineName="rsp")
}

\arguments{
  \item{file}{The file to be weaved.}
  \item{...}{Not used.}
  \item{quiet}{If \code{\link[base:logical]{TRUE}}, no verbose output is generated.}
  \item{envir}{The \code{\link[base]{environment}} where the RSP document is
        parsed and evaluated.}
  \item{.engineName}{Internal only.}
}

\value{
  Returns the absolute pathname of the generated RSP product.
  The generated RSP product is not postprocessed.
}

\author{Henrik Bengtsson}

\seealso{
  \code{\link{rspTangle}}()
}




\keyword{file}
\keyword{IO}
\keyword{internal}
