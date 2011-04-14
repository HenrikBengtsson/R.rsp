%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  translateRsp.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{translateRsp}
\alias{translateRsp.default}
\alias{translateRsp}

\title{Translates an RSP file to an R RSP source file}

\description{
 Translates an RSP file to an R RSP source file.
}

\usage{\method{translateRsp}{default}(filename, path=NULL, ..., force=FALSE, verbose=FALSE)}

\arguments{
  \item{filename}{A filename to be read.}
  \item{path}{An optional path to the file.}
  \item{...}{Not used.}
  \item{force}{A \code{\link[base]{logical}}.}
  \item{verbose}{\code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns (invisibly) the pathname to the R RSP source code.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  Internally \code{\link{parseRsp}}() parses the RSP file into an R code string.
  \code{\link{sourceRsp}}().
}




\keyword{file}
\keyword{IO}
\keyword{internal}
