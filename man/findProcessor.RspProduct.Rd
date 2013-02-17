%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspProduct.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{findProcessor.RspProduct}
\alias{findProcessor.RspProduct}
\alias{RspProduct.findProcessor}
\alias{findProcessor.RspProduct}
\alias{findProcessor,RspProduct-method}


\title{Tries to locate a processor for an RSP product}

\description{
 Tries to locate a processor for an RSP product.
}

\usage{\method{findProcessor}{RspProduct}(object, ..., verbose=FALSE)}

\arguments{
  \item{pathname}{The RSP product, e.g. a file.}
  \item{type}{A \code{\link[base]{character}} string specifying the content type.}
  \item{outPath}{The working directory.}
  \item{...}{Not used.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns the processed RSP product, e.g. the pathname to a PDF file.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}



\keyword{internal}
\keyword{methods}
\keyword{file}
\keyword{IO}
