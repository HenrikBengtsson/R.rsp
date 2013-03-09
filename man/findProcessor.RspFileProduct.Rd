%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspFileProduct.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{findProcessor.RspFileProduct}
\alias{findProcessor.RspFileProduct}
\alias{RspFileProduct.findProcessor}
\alias{findProcessor,RspFileProduct-method}

\title{Locates a processor for an RSP file product}

\description{
 Locates a processor for an RSP file product.
}

\usage{
\method{findProcessor}{RspFileProduct}(object, ..., verbose=FALSE)
}

\arguments{
  \item{...}{Not used.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns a \code{\link[base]{function}} that takes an \code{\link{RspFileProduct}} as input,
  or \code{\link[base]{NULL}} if no processor was found.
}

\author{Henrik Bengtsson}



\keyword{internal}
\keyword{methods}
\keyword{file}
\keyword{IO}
