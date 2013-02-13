%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RSourceCode.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{evaluate.RSourceCode}
\alias{evaluate.RSourceCode}
\alias{RSourceCode.evaluate}
\alias{evaluate.RSourceCode}
\alias{evaluate,RSourceCode-method}


\title{Parses and evaluates the R code}

\description{
 Parses and evaluates the R code.
}

\usage{\method{evaluate}{RSourceCode}(this, envir=parent.frame(), ...)}

\arguments{
  \item{envir}{The \code{\link[base]{environment}} where the RSP string is evaluated.}
  \item{...}{Optional arguments passed to \code{\link[R.rsp:parse.RSourceCode]{*parse}()}.}
}

\value{
 Returns the last evaluated expression, iff any.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  For more information see \code{\link{RSourceCode}}.
}
\keyword{internal}
\keyword{methods}
