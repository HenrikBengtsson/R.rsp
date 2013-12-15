%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  compileSweave.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{compileSweave}
\alias{compileSweave.default}
\alias{compileSweave}

\title{Compiles a Sweave file}

\description{
 Compiles a Sweave file.
}

\usage{
\method{compileSweave}{default}(filename, path=NULL, ..., outPath=".", postprocess=TRUE, verbose=FALSE)
}

\arguments{
  \item{filename, path}{The filename and (optional) path of the
     Sweave document to be compiled.}
  \item{...}{Additional arguments passed to \code{\link{compileLaTeX}}().}
  \item{outPath}{The output and working directory.}
  \item{postprocess}{If \code{\link[base:logical]{TRUE}}, and a postprocessing method exists for
     the generated product, it is postprocessed as well.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns the pathname of the generated document.
}

\author{Henrik Bengtsson}

\seealso{
  Internally, \code{\link[utils]{Sweave}} is used.
}




\keyword{file}
\keyword{IO}
\keyword{internal}
