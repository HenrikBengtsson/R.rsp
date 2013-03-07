%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspProduct.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{process.RspProduct}
\alias{process.RspProduct}
\alias{RspProduct.process}
\alias{process.RspProduct}
\alias{process,RspProduct-method}


\title{Processes an RSP file product}

\description{
 Processes an RSP file product.
}

\usage{
\method{process}{RspProduct}(object, type=NULL, envir=parent.frame(), workdir=NULL, ..., fake=FALSE, verbose=FALSE)
}

\arguments{
  \item{type}{A \code{\link[base]{character}} string specifying the content type.}
  \item{workdir}{A temporary working directory to use during processing.
     If \code{\link[base]{NULL}}, the working directory is not changed.}
  \item{...}{Optional arguments passed to the processor \code{\link[base]{function}}.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns the processed RSP product output as another \code{\link{RspProduct}}.
  If no processor exists, the input object itself is returned.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}



\keyword{internal}
\keyword{methods}
\keyword{file}
\keyword{IO}
