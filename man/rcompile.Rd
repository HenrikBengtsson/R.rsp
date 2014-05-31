%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rcompile.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rcompile}
\alias{rcompile.default}
\alias{rcompile}
\alias{rcompile.RspString}
\alias{rcompile.RspDocument}

\title{Compiles an RSP document}

\description{
 Compiles an RSP document.
}

\usage{
\method{rcompile}{default}(..., file=NULL, path=NULL, output=NULL, workdir=NULL, envir=parent.frame(),
  args="*", until="*", verbose=FALSE)
}

\arguments{
  \item{...}{\code{\link[base]{character}} strings with RSP markup.}
  \item{file, path}{Alternatively, a file, a URL or a \code{\link[base:connections]{connection}} from
     with the strings are read.
     If a file, the \code{path} is prepended to the file, iff given.}
  \item{output}{A \code{\link[base]{character}} string or a \code{\link[base:connections]{connection}} specifying where
     output should be directed.
     The default is a file with a filename where the input filename
     has been prepended by \code{compiled-} and saved
     in the directory given by the \code{workdir} argument.}
  \item{workdir}{The working directory to use after parsing and
     preprocessing.
     If argument \code{output} specifies an absolute pathname,
     then the directory of \code{output} is used, otherwise the
     current directory is used.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP string is
     preprocessed and evaluated.}
  \item{args}{A named \code{\link[base]{list}} of arguments assigned to the environment
    in which the RSP string is parsed and evaluated.
    See \code{\link[R.utils]{cmdArgs}}.}
  \item{until}{Specifies how far the compilation should proceed.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns an \code{\link{RspString}}, \code{\link{RspDocument}} or
  an \code{\link{RspFileProduct}} (depending on argument \code{output}).
}

\author{Henrik Bengtsson}

\seealso{
 \code{\link{rcat}}() and \code{\link{rfile}}().
}




\keyword{file}
\keyword{IO}
\keyword{internal}
