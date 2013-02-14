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

\usage{\method{rfile}{default}(filename, path=NULL, output=NULL, workdir=NULL, type=NA, envir=parent.frame(), postprocess=TRUE, ..., verbose=FALSE)}

\arguments{
  \item{filename, path}{Specifies the RSP file to processed, which can
     be a file, a URL or a \code{\link[base:connections]{connection}}.}
  \item{output}{A \code{\link[base]{character}} string or a \code{\link[base:connections]{connection}} specifying where
     output should be directed.
     The default is a file with a filename where the file extension
     (typically \code{".rsp"}) has been dropped from \code{filename}
     in the directory given by the \code{workdir} argument.}
  \item{workdir}{The working directory to use after parsing and
     preprocessing, but while \emph{evaluating} and \emph{postprocessing}
     the RSP document.
     If argument \code{output} specifies an absolute pathname,
     then the directory of \code{output} is used, otherwise the
     current directory is used.}
  \item{type}{The default content type of the RSP document.  By default, it
     is inferred from the \code{output} filename extension, iff possible.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP document is evaluated.}
  \item{postprocess}{If \code{\link[base:logical]{TRUE}}, and a postprocessing method exists for
     the generated RSP artifact, it is postprocessed as well.}
  \item{...}{Additional arguments passed to the RSP engine.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns an \code{\link{RspArtifact}}.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}



\keyword{file}
\keyword{IO}
