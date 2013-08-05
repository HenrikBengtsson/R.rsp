%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspRSourceCode.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{evaluate.RspRSourceCode}
\alias{evaluate.RspRSourceCode}
\alias{RspRSourceCode.evaluate}
\alias{evaluate,RspRSourceCode-method}
\alias{RspRSourceCode.findProcessor}
\alias{findProcessor.RspRSourceCode}
\alias{findProcessor,RspRSourceCode-method}


\title{Parses and evaluates the R code}

\description{
 Parses and evaluates the R code.
}

\usage{
\method{evaluate}{RspRSourceCode}(object, envir=parent.frame(), args="*", output=c("RspStringProduct", "stdout"),
  ..., verbose=FALSE)
}

\arguments{
  \item{envir}{The \code{\link[base]{environment}} in which the RSP string is evaluated.}
  \item{args}{A named \code{\link[base]{list}} of arguments assigned to the environment
    in which the RSP string is parsed and evaluated.
    See \code{\link[R.utils]{cmdArgs}}.}
  \item{output}{A \code{\link[base]{character}} string specifying how the RSP output
    should be handled/returned.}
  \item{...}{Not used.}
}

\value{
 If \code{output="stdout"}, then \code{\link[base]{NULL}} is returned and the RSP output
 is sent to the standard output.  This is output is "non-buffered",
 meaning it will be sent to the output as soon as it is generated.
 If \code{output="RspStringProduct"}, then the output is captured
 and returned as an \code{\link{RspStringProduct}} with attributes set.
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{RspRSourceCode}}.
}
\keyword{internal}
\keyword{methods}
