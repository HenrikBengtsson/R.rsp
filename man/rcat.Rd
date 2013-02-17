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
\alias{rcat.RSourceCode}

\title{Evaluates an RSP string and outputs the generated string}

\description{
 Evaluates an RSP string and outputs the generated string.
}

\usage{\method{rcat}{default}(..., file="", append=FALSE, envir=parent.frame(), args="*")}

\arguments{
  \item{...}{\code{\link[base]{character}} strings with RSP markup.}
  \item{file}{A \code{\link[base:connections]{connection}}, or a pathname where to direct the output.
              If \code{""}, the output is sent to the standard output.}
  \item{append}{Only applied if \code{file} specifies a pathname;
    If \code{\link[base:logical]{TRUE}}, then the output is appended to the file, otherwise
    the files content is overwritten.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP string is
    preprocessed and evaluated.}
  \item{args}{A named \code{\link[base]{list}} of arguments assigned to the environment
    in which the RSP string is parsed and evaluated. See \code{\link{rargs}}().}
}

\value{
  Returns (invisibly) the outputted \code{\link[base]{character}} string.
}

\section{Processing RSP strings from the command line}{
  Using \code{\link{Rscript}} and \code{rcat()}, it is possible to process
  an RSP string and output the result from the command line.  For example,

  \code{Rscript -e "R.rsp::rcat('A random integer in [1,<\%=K\%>]: <\%=sample(1:K, size=1)\%>')" --args --K=50}

  silently parses and evaluates the 'random-args.txt.rsp' example file and output a file 'random-args.txt' in the current directory.
}

\examples{
rcat("A random integer in [1,100]: <\%=sample(1:100, size=1)\%>\n")

# Passing arguments
rcat("A random integer in [1,<\%=K\%>]: <\%=sample(1:K, size=1)\%>\n", args=list(K=50))


}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
 \code{\link{rstring}}().
}

