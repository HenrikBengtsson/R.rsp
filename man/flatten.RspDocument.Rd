%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDocument.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{flatten.RspDocument}
\alias{flatten.RspDocument}
\alias{RspDocument.flatten}
\alias{flatten.RspDocument}
\alias{flatten,RspDocument-method}


\title{Flattens an RspDocument}

\description{
 Flattens an RspDocument by expanding and inserting the \code{\link[base]{list}} of
 \code{\link{RspExpression}}s for any \code{\link{RspDocument}}.
}

\usage{
\method{flatten}{RspDocument}(object, ..., verbose=FALSE)
}

\arguments{
  \item{...}{Not used.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns an \code{\link{RspDocument}} that contains only \code{\link{RspExpression}}:s
  (and no \code{\link{RspDocument}}).
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  For more information see \code{\link{RspDocument}}.
}
\keyword{internal}
\keyword{methods}
