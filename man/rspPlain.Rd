%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rspPlain.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rspPlain}
\alias{rspPlain.default}
\alias{rspPlain}

\title{Compiles a plain RSP document}

\description{
 Compiles a plain RSP document.
}

\usage{\method{rspPlain}{default}(pathname, response=NULL, envir=parent.frame(), ..., verbose=FALSE)}

\arguments{
  \item{pathname}{The pathname of the RSP document to be compiled.}
  \item{response}{Specifies where the final output should be sent.
     If argument \code{text} is given, then \code{\link[base]{stdout}}() is used.
     Otherwise, the output defaults to that of the type-specific compiler.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP document is evaluated.}
  \item{...}{Additional arguments passed to the RSP compiler.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns the pathname of the file generated.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}



\keyword{file}
\keyword{IO}
