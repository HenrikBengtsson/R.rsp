%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDocument.toR.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\name{toR.RspDocument}
\alias{toR.RspDocument}
\alias{RspDocument.toR}
\alias{toR,RspDocument-method}

\title{Translates the RSP document into R source code}

\description{
 Translates the RSP document into R source code.
}

\usage{
\method{toR}{RspDocument}(object, factory=NULL, ...)
}

\arguments{
  \item{factory}{A \code{\link{RspSourceCodeFactory}}.}
  \item{...}{Optional arguments passed to \code{toSourceCode()} for
             the \code{\link{RspSourceCodeFactory}}.}
}

\value{
 Returns the R source code as an \code{\link{RspRSourceCode}}.
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{RspDocument}}.
}
\keyword{internal}
\keyword{methods}
