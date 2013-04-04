%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspSourceCodeFactory.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{toSourceCode.RspSourceCodeFactory}
\alias{toSourceCode.RspSourceCodeFactory}
\alias{RspSourceCodeFactory.toSourceCode}
\alias{toSourceCode,RspSourceCodeFactory-method}

\title{Translates an RSP document to source code}

\description{
 Translates an RSP document to source code.
}

\usage{
\method{toSourceCode}{RspSourceCodeFactory}(object, doc, ...)
}

\arguments{
  \item{expr}{An \code{\link{RspDocument}} that has been preprocessed
              and flattened.}
  \item{...}{Not used.}
}

\value{
 Returns the generated source code as a \code{\link{RspSourceCode}} object.
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{RspSourceCodeFactory}}.
}
\keyword{internal}
\keyword{methods}
