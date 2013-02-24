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
\alias{evaluate.RspRSourceCode}
\alias{evaluate,RspRSourceCode-method}

\alias{RspRSourceCode.findProcessor}
\alias{findProcessor.RspRSourceCode}
\alias{findProcessor,RspRSourceCode-method}


\title{Parses and evaluates the R code}

\description{
 Parses and evaluates the R code.
}

\usage{\method{evaluate}{RspRSourceCode}(object, output=c("stdout", "string"), envir=parent.frame(), args="*", ..., verbose=FALSE)}

\arguments{
  \item{output}{A \code{\link[base]{character}} string specifying type of output function.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP string is evaluated.}
  \item{args}{A named \code{\link[base]{list}} of arguments assigned to the environment
    in which the RSP string is parsed and evaluated.
    See \code{\link[R.utils]{cmdArgs}}.}
  \item{...}{Optional arguments passed to \code{\link[base]{eval}}().}
}

\value{
 Returns the outputted \code{\link[base]{character}} string, iff any.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  For more information see \code{\link{RspRSourceCode}}.
}
\keyword{internal}
\keyword{methods}
