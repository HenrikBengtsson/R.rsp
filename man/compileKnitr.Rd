%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  compileKnitr.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{compileKnitr}
\alias{compileKnitr.default}
\alias{compileKnitr}

\title{Compiles a Knitr file}

\description{
 Compiles a Knitr file.
}

\usage{
\method{compileKnitr}{default}(filename, path=NULL, ..., outPath=".", postprocess=TRUE, verbose=FALSE)
}

\arguments{
  \item{filename, path}{The filename and (optional) path of the
     document to be compiled.}
  \item{...}{Additional arguments passed to \code{\link{compileLaTeX}}().}
  \item{outPath}{The output and working directory.}
  \item{postprocess}{If \code{\link[base:logical]{TRUE}}, and a postprocessing method exists for
     the generated product, it is postprocessed as well.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns (invisibly) the pathname of the generated document.
}

\author{Henrik Bengtsson}

\seealso{
  Internally, \code{\link[knitr]{knit}} is used.
}




\keyword{file}
\keyword{IO}
\keyword{internal}
