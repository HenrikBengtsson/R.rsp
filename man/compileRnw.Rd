%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  compileRnw.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{compileRnw}
\alias{compileRnw.default}
\alias{compileRnw}

\title{Compiles a Knitr or Sweave Rnw file}

\description{
 Compiles a Knitr or Sweave Rnw file using \code{\link{compileSweave}}() or \code{\link{compileKnitr}}()
 depending on whether the content of the Rnw file indicates
 that it is a Sweave or a knitr Rnw file.
}

\usage{
\method{compileRnw}{default}(filename, path=NULL, ..., type=typeOfRnw(filename, path = path), verbose=FALSE)
}

\arguments{
  \item{filename, path}{The filename and (optional) path of the
     Knitr document to be compiled.}
  \item{...}{Additional arguments passed to the compiler function
     used.}
  \item{type}{A \code{\link[base]{character}} string specifying what type of Rnw file
     to compile.  The default type is inferred from the content
     of the file using \code{\link{typeOfRnw}}().}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns (invisibly) the pathname of the generated document.
}

\author{Henrik Bengtsson}




\keyword{file}
\keyword{IO}
\keyword{internal}
