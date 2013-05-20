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
\method{rcompile}{default}(..., file=NULL, path=NULL, envir=parent.frame(), args="*", until="*",
  as=c("RspString", "RspDocument"), verbose=FALSE)
}

\arguments{
  \item{...}{\code{\link[base]{character}} strings with RSP markup.}
  \item{file, path}{Alternatively, a file, a URL or a \code{\link[base:connections]{connection}} from
     with the strings are read.
     If a file, the \code{path} is prepended to the file, iff given.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP string is
     preprocessed and evaluated.}
  \item{args}{A named \code{\link[base]{list}} of arguments assigned to the environment
    in which the RSP string is parsed and evaluated.
    See \code{\link[R.utils]{cmdArgs}}.}
  \item{until}{Specifies how far the compilation should proceed.}
  \item{as}{Specifies the format of the returned compilation.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns an \code{\link{RspDocument}} or \code{\link{RspString}}
  (depending on argument \code{as}).
}

\author{Henrik Bengtsson}

\seealso{
 \code{\link{rcat}}() and \code{\link{rfile}}().
}




\keyword{file}
\keyword{IO}
\keyword{internal}
