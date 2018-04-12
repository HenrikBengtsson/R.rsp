%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rcat.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rcat}
\alias{rcat.default}
\alias{rcat}
\alias{rcat.RspString}
\alias{rcat.RspDocument}
\alias{rcat.RspRSourceCode}
\alias{rcat.function}
\alias{rcat.expression}
\alias{rsource}
\alias{rsource.default}
\alias{rsource.RspString}
\alias{rsource.RspDocument}
\alias{rsource.RspRSourceCode}
\alias{rsource.function}
\alias{rsource.expression}

\title{Evaluates an RSP string and outputs the generated string}

\description{
 Evaluates an RSP string and outputs the generated string.
}

\usage{
 \method{rcat}{default}(..., file=NULL, path=NULL, envir=parent.frame(), args="*", output="", buffered=TRUE,
  append=FALSE, verbose=FALSE)
 \method{rsource}{default}(file, path=NULL, envir=parent.frame(), output="", buffered=FALSE, ...)
}

\arguments{
  \item{...}{A \code{\link[base]{character}} string with RSP markup.}
  \item{file, path}{Alternatively, a file, a URL or a \code{\link[base:connections]{connection}} from
     with the strings are read.
     If a file, the \code{path} is prepended to the file, iff given.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP string is
    preprocessed and evaluated.}
  \item{args}{A named \code{\link[base]{list}} of arguments assigned to the environment
    in which the RSP string is parsed and evaluated.
    See \code{\link[R.utils]{cmdArgs}}.}
  \item{output}{A \code{\link[base:connections]{connection}}, or a pathname where to direct the output.
              If \code{""}, the output is sent to the standard output.}
  \item{buffered}{If \code{\link[base:logical]{TRUE}}, and \code{output=""}, then the RSP output is
    outputted as soon as possible, if possible.}
  \item{append}{Only applied if \code{output} specifies a pathname.
    If \code{\link[base:logical]{TRUE}}, then the output is appended to the file, otherwise
    the files content is overwritten.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns (invisibly) the outputted \code{\link{RspStringProduct}}.
}

\section{Processing RSP strings from the command line}{
  Using \code{\link{Rscript}} and \code{rcat()}, it is possible to process
  an RSP string and output the result from the command line.  For example,

  \code{Rscript -e "R.rsp::rcat('A random integer in [1,<\%=K\%>]: <\%=sample(1:K, size=1)\%>')" --args --K=50}

  parses and evaluates the RSP string and outputs the result to
  standard output.
}

\section{rsource()}{
  The \code{rsource(file, ...)} is a convenient wrapper
  for \code{rcat(file=file, ..., output="", buffered=FALSE)}.
  As an analogue, \code{rsource()} is to an RSP file what
  \code{source()} is to an R script file.
}

\examples{
rcat("A random integer in [1,100]: <\%=sample(1:100, size=1)\%>\n")

# Passing arguments
rcat("A random integer in [1,<\%=K\%>]: <\%=sample(1:K, size=1)\%>\n", args=list(K=50))


}

\author{Henrik Bengtsson}

\seealso{
 To store the output in a string (instead of displaying it), see
 \code{\link{rstring}}().
 For evaluating and postprocessing an RSP document and
 writing the output to a file, see \code{\link{rfile}}().
}




\keyword{print}
\keyword{IO}
\keyword{file}
