%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  compileAsciiDocNoweb.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{compileAsciiDocNoweb}
\alias{compileAsciiDocNoweb.default}
\alias{compileAsciiDocNoweb}

\title{Compiles an AsciiDoc noweb file}

\description{
 Compiles an AsciiDoc noweb file.
}

\usage{
\method{compileAsciiDocNoweb}{default}(filename, path=NULL, ..., outPath=".", postprocess=TRUE,
  verbose=FALSE)
}

\arguments{
  \item{filename, path}{The filename and (optional) path of the
     document to be compiled.}
  \item{...}{Additional arguments passed to \code{\link[ascii]{Asciidoc}}.}
  \item{outPath}{The output and working directory.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns the pathname of the generated document.
}

\author{Henrik Bengtsson}




\keyword{file}
\keyword{IO}
\keyword{internal}
