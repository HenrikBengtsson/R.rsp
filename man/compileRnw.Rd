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

\title{Compiles a Rnw file}

\description{
 Compiles a Rnw file.
 The compiler used depends on the content type.
}

\usage{
\method{compileRnw}{default}(filename, path=NULL, ..., type=NULL, verbose=FALSE)
}

\arguments{
  \item{filename, path}{The filename and (optional) path of the
     document to be compiled.}
  \item{...}{Additional arguments passed to the compiler function
     used.}
  \item{type}{A \code{\link[base]{character}} string specifying what content type of
     Rnw file to compile.  The default (\code{\link[base]{NULL}}) is to infer the type
     from the content of the file using \code{\link{typeOfRnw}}().}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns the pathname of the generated document.
}

\author{Henrik Bengtsson}




\keyword{file}
\keyword{IO}
\keyword{internal}
