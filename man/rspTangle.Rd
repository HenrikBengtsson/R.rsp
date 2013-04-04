%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  xweavetangle.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rspTangle}
\alias{rspTangle}


\title{A tangle function for RSP documents}

\description{
 A tangle function for RSP documents.
 This function is for RSP what \code{\link[utils]{Stangle}} is for Sweave documents.
}

\usage{
rspTangle(file, ..., envir=new.env())
}

\arguments{
  \item{file}{The file to be tangled.}
  \item{...}{Not used.}
  \item{envir}{The \code{\link[base]{environment}} where the RSP document is parsed.}
}

\value{
  Returns the absolute pathname of the generated R source code file.
}

\author{Henrik Bengtsson}

\seealso{
  \code{\link{rspWeave}}()
}




\keyword{file}
\keyword{IO}
\keyword{internal}
