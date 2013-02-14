%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rfile.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rfile}
\alias{rfile.default}
\alias{rfile}

\title{Evaluates an RSP file and outputs the generated string}

\description{
 Evaluates an RSP file and outputs the generated string.
}

\usage{\method{rfile}{default}(pathname, output=NULL, envir=parent.frame(), ..., verbose=FALSE)}

\arguments{
  \item{pathname}{A \code{\link[base]{character}} string or a \code{\link[base:connections]{connection}} specifying
     the RSP file to be processed.}
  \item{output}{A \code{\link[base]{character}} string or a \code{\link[base:connections]{connection}} specifying where
     output should be directed.
     The default is a file with a pathname where the file extension
     (typically \code{".rsp"}) has been dropped from \code{pathname}.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP document is evaluated.}
  \item{...}{Additional arguments passed to the RSP engine.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  If argument \code{output} is a pathname, its absolute pathname is
  returned (invisibly).
  If a \code{\link[base:connections]{connection}}, the connection is returned (invisibly).
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}



\keyword{file}
\keyword{IO}
