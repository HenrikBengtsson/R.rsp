%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  buildNonSweaveVignette.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{buildNonSweaveTexToPdf}
\alias{buildNonSweaveTexToPdf}


\title{Compiles all TeX files into PDFs}

\description{
 Compiles all TeX files into PDFs, unless already done.
}

\usage{
buildNonSweaveTexToPdf(path=".", pattern="[.](tex|latex)$", ...)
}

\arguments{
  \item{path}{The directory where to search for TeX files.}
  \item{pattern}{Filename pattern to locate TeX files.}
  \item{...}{Additional arguments passed to \code{\link[tools]{texi2pdf}}.}
}

\value{
  Returns (invisibly) a named \code{\link[base]{list}} of results.
}

\author{Henrik Bengtsson}




\keyword{file}
\keyword{IO}
\keyword{internal}
