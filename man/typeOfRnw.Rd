%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  typeOfRnw.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{typeOfRnw}
\alias{typeOfRnw.default}
\alias{typeOfRnw}

\title{Checks whether an Rnw file is a Sweave or a knitr file}

\description{
 Checks whether an Rnw file is a Sweave or a knitr file.
}

\usage{\method{typeOfRnw}{default}(filename, path=NULL, default=c("sweave", "knitr"), ..., fake=FALSE)}

\arguments{
  \item{filename, path}{The filename and (optional) path of the Rnw file.}
  \item{default}{A \code{\link[base]{character}} string specifying the default result.}
  \item{...}{Not used.}
  \item{fake}{If \code{\link[base:logical]{TRUE}}, \code{default} is returned.}
}

\value{
  Returns a \code{\link[base]{character}} string.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  TBA.
}




\keyword{file}
\keyword{IO}
\keyword{internal}
