%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rstring.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rstring}
\alias{rstring.default}
\alias{rstring}
\alias{rstring.RspString}
\alias{rstring.RspDocument}
\alias{rstring.RSourceCode}

\title{Evaluates an RSP string and returns the generated string}

\description{
 Evaluates an RSP string and returns the generated string.
}

\usage{\method{rstring}{default}(..., file=NULL, path=NULL, envir=parent.frame())}

\arguments{
  \item{...}{\code{\link[base]{character}} strings with RSP markup.}
  \item{file, path}{Alternatively, a file, a URL or a \code{\link[base:connections]{connection}} from
     with the strings are read.
     If a file, the \code{path} is prepended to the file, iff given.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP string is
     preprocessed and evaluated.}
}

\value{
  Returns a \code{\link[base]{character}} string.
  If set/known, the content type is returned as attribute \code{type}.
}

\examples{
x <- rstring("A random number in [1,100]: <\%=sample(1:100, size=1)\%>\n")
cat(x)
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
 \code{\link{rcat}}().
}

