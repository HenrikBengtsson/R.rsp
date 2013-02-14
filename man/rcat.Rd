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

\usage{\method{rcat}{default}(..., file="", append=FALSE, envir=parent.frame())}

\arguments{
  \item{...}{\code{\link[base]{character}} strings with RSP markup.}
  \item{file}{A \code{\link[base:connections]{connection}}, or a pathname where to direct the output.
              If \code{""}, the output is sent to the standard output.}
  \item{append}{Only applied if \code{file} specifies a pathname;
    If \code{\link[base:logical]{TRUE}}, then the output is appended to the file, otherwise
    the files content is overwritten.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP string is evaluated.}
}

\value{
  Returns (invisibly) the outputted \code{\link[base]{character}} string.
}

\examples{
rcat("<\% d <- data.frame(a=1, b=2) \%>'d' is a '<\%=class(d)[1]\%>'\n")

}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
 \code{\link{rstring}}().
}

