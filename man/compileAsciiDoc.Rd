%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  compileAsciiDoc.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{compileAsciiDoc}
\alias{compileAsciiDoc.default}
\alias{compileAsciiDoc}

\title{Compiles an AsciiDoc file}

\description{
 Compiles an AsciiDoc file.

 \emph{NOTE: This function requires the \bold{ascii} package, which was
 "removed" (archived) from CRAN on 2019-01-26.}
}

\usage{
\method{compileAsciiDoc}{default}(filename, path=NULL, ..., outPath=".", postprocess=TRUE, verbose=FALSE)
}

\arguments{
  \item{filename, path}{The filename and (optional) path of the
     document to be compiled.}
  \item{...}{Additional arguments passed to executable \code{ascii}
    (which must be on the system search path)
    called via \code{\link[base]{system2}}().}
  \item{outPath}{The output and working directory.}
  \item{postprocess}{Should the generated document be post processed or not?}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns the pathname of the generated document.
}

\author{Henrik Bengtsson}




\keyword{file}
\keyword{IO}
\keyword{internal}
