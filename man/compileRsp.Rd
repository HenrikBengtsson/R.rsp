%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  compileRsp.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{compileRsp}
\alias{compileRsp.default}
\alias{compileRsp}

\title{Compiles an RSP file}

\description{
 Compiles an RSP file.
}

\usage{
\method{compileRsp}{default}(filename, path=NULL, ..., outPath=".", postprocess=TRUE, envir=parent.frame(),
  verbose=FALSE)
}

\arguments{
  \item{filename, path}{The filename and (optional) path of the
     RSP document to be compiled.}
  \item{...}{Additional arguments passed to \code{\link[R.rsp]{rfile}}.}
  \item{outPath}{The output and working directory.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns (invisibly) the pathname of the generated document.
}

\author{Henrik Bengtsson}




\keyword{file}
\keyword{IO}
\keyword{internal}
