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
\alias{process,RspProduct-method}

\title{Processes an RSP file product}

\description{
 Processes an RSP file product.
}

\usage{
\method{process}{RspProduct}(object, type=NULL, envir=parent.frame(), workdir=NULL, ..., recursive=TRUE,
  verbose=FALSE)
}

\arguments{
  \item{type}{A \code{\link[base]{character}} string specifying the content type.}
  \item{workdir}{A temporary working directory to use during processing.
     If \code{\link[base]{NULL}}, the working directory is not changed.}
  \item{...}{Optional arguments passed to the processor \code{\link[base]{function}}.}
  \item{recursive}{
     If a positive number (or +\code{\link[base:is.finite]{Inf}}), then processed output that can be
     processed will be processed recursively (with this argument being
     decreased by one).
     A value \code{\link[base:logical]{TRUE}} corresponds to +\code{\link[base:is.finite]{Inf}} (infinite processing if possible).
     A value \code{\link[base:logical]{FALSE}} corresponds to 0 (no further processing).
  }
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns the processed RSP product output as another \code{\link{RspProduct}}.
  If no processor exists, the input object itself is returned.
}

\author{Henrik Bengtsson}



\keyword{internal}
\keyword{methods}
\keyword{file}
\keyword{IO}
