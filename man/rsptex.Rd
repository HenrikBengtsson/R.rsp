%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rsptex.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rsptex}
\alias{rsptex.default}
\alias{rsptex}

\title{Compiles an RSP LaTeX file into a DVI file}

\description{
 Compiles an RSP LaTeX file into a DVI file.
}

\usage{\method{rsptex}{default}(..., pdf=FALSE, force=FALSE, verbose=FALSE)}

\arguments{
  \item{...}{Arguments passed to \code{\link{compileRsp}}().}
  \item{pdf}{If \code{\link[base:logical]{TRUE}}, a PDF is generated, otherwise a DVI file.}
  \item{force}{If \code{\link[base:logical]{TRUE}}, file timestamps are ignored.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns the pathname to the generated document.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  The generated TeX document is compiled by \code{\link[tools]{texi2dvi}} in
  the \pkg{tools} package.
}



\keyword{file}
\keyword{IO}
