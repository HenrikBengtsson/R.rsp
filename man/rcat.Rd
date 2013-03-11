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

\title{Evaluates an RSP string and outputs the generated string}

\description{
 Evaluates an RSP string and outputs the generated string.
}

\usage{
\method{rcat}{default}(..., output="", append=FALSE, envir=parent.frame(), args="*")
}

\arguments{
  \item{...}{\code{\link[base]{character}} strings with RSP markup.}
  \item{output}{A \code{\link[base:connections]{connection}}, or a pathname where to direct the output.
              If \code{""}, the output is sent to the standard output.}
  \item{append}{Only applied if \code{output} specifies a pathname;
    If \code{\link[base:logical]{TRUE}}, then the output is appended to the file, otherwise
    the files content is overwritten.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP string is
    preprocessed and evaluated.}
  \item{args}{A named \code{\link[base]{list}} of arguments assigned to the environment
    in which the RSP string is parsed and evaluated.
    See \code{\link[R.utils]{cmdArgs}}.}
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

\examples{
rcat("A random integer in [1,100]: <\%=sample(1:100, size=1)\%>\n")

# Passing arguments
rcat("A random integer in [1,<\%=K\%>]: <\%=sample(1:K, size=1)\%>\n", args=list(K=50))


}

\author{Henrik Bengtsson}

\seealso{
 \code{\link{rstring}}() and \code{\link{rfile}}().
}




\keyword{print}
\keyword{IO}
\keyword{file}
