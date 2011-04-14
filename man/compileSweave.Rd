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
 If Sweave generates a LaTeX file, that is then compiled as well,
 which in turn generates either a PDF or a DVI document.
}

\usage{\method{compileSweave}{default}(filename, path=NULL, ..., verbose=FALSE)}

\arguments{
  \item{filename, path}{The filename and (optional) path of the
     Sweave document to be compiled.}
  \item{...}{Additional arguments passed to \code{\link{compileLaTeX}}().}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns (invisibly) the pathname of the generated document.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  Internally, \code{\link[utils]{Sweave}} and \code{\link{compileLaTeX}}() are used.
}




\keyword{file}
\keyword{IO}
\keyword{internal}
