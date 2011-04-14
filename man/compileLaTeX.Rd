%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  compileLaTeX.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{compileLaTeX}
\alias{compileLaTeX.default}
\alias{compileLaTeX}

\title{Compiles a LaTeX file}

\description{
 Compiles a LaTeX file to either PDF or DVI.
}

\usage{\method{compileLaTeX}{default}(filename, path=NULL, format=c("pdf", "dvi"), ..., verbose=FALSE)}

\arguments{
  \item{filename, path}{The filename and (optional) path of the
     LaTeX document to be compiled.}
  \item{format}{A \code{\link[base]{character}} string specifying the output format.}
  \item{...}{Additional arguments passed to \code{\link[tools]{texi2dvi}}.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns (invisibly) the pathname of the generated (PDF or DVI) document.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  Internally, \code{\link[tools]{texi2dvi}} is used.
  To compile Sweave LaTeX documents, \code{\link{compileSweave}}().
}




\keyword{file}
\keyword{IO}
\keyword{internal}
