%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspSourceCode.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{tidy.RspSourceCode}
\alias{tidy.RspSourceCode}
\alias{RspSourceCode.tidy}
\alias{tidy,RspSourceCode-method}
\alias{tidy.RspRSourceCode}

\title{Tidy up the RSP source code}

\description{
 Tidy up the RSP source code.
}

\usage{
\method{tidy}{RspSourceCode}(object, format=c("asis"), collapse="\n", ...)
}

\arguments{
  \item{format}{A \code{\link[base]{character}} string specifying how the source code
    should be tidied.}
  \item{collapse}{How source code lines should be collapsed.}
  \item{...}{Not used.}
}

\value{
 Returns an @RspSourceCode of the same class as the input source code.
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{RspSourceCode}}.
}
\keyword{internal}
\keyword{methods}
