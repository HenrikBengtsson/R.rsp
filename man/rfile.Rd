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

\usage{\method{rfile}{default}(pathname, output=NULL, workdir=NULL, type=NA, envir=parent.frame(), ..., verbose=FALSE)}

\arguments{
  \item{pathname}{A \code{\link[base]{character}} string or a \code{\link[base:connections]{connection}} specifying
     the RSP file to be processed.}
  \item{output}{A \code{\link[base]{character}} string or a \code{\link[base:connections]{connection}} specifying where
     output should be directed.
     The default is a file with a filename where the file extension
     (typically \code{".rsp"}) has been dropped from \code{pathname}
     in the directory given by the \code{workdir} argument.}
  \item{workdir}{The working directory to use while processing the
     RSP file.  If argument \code{output} specifies an absolute pathname,
     then the directory of \code{output} is used, otherwise the directory
     of argument \code{pathname} is used.
     If both \code{output} and \code{pathname} are \code{\link[base:connections]{connection}}s, then
     the current directory is used.}
  \item{type}{The default content type of the RSP document.  By default, it
     is inferred from the \code{output} filename extension, iff possible.}
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
