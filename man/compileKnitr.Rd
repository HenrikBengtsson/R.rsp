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
 If Knitr generates a LaTeX file, that is then compiled as well,
 which in turn generates either a PDF or a DVI document.
}

\usage{\method{compileKnitr}{default}(filename, path=NULL, ..., outPath=".", verbose=FALSE)}

\arguments{
  \item{filename, path}{The filename and (optional) path of the
     Knitr document to be compiled.}
  \item{...}{Additional arguments passed to \code{\link{compileLaTeX}}().}
  \item{outPath}{The output and working directory.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns (invisibly) the pathname of the generated document.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  Internally, \code{\link[knitr]{knit}} and \code{\link{compileLaTeX}}() are used.
}




\keyword{file}
\keyword{IO}
\keyword{internal}
