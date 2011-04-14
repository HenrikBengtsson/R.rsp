%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rspToHtml.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rspToHtml}
\alias{rspToHtml.default}
\alias{rspToHtml}

\title{Compiles an RSP file to an HTML file}

\description{
 Compiles an RSP file to an HTML file.
}

\usage{\method{rspToHtml}{default}(file=NULL, path=NULL, outFile=NULL, outPath=NULL, extension="html", overwrite=TRUE, ...)}

\arguments{
  \item{file}{The filename of the RSP file to be compiled.}
  \item{path}{An optional path to the RSP file.}
  \item{outFile}{The filename of the output file.
    If \code{\link[base]{NULL}}, a default output file is used.}
  \item{outPath}{An optional path to the output file.}
  \item{extension}{The filename extension of the default output file.}
  \item{overwrite}{If \code{\link[base:logical]{TRUE}}, an existing output file is overwritten.}
  \item{...}{Additional arguments passed to \code{\link{sourceRsp}}().}
}

\value{
  Returns the pathname to the generated document.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  \code{\link{sourceRsp}}().
}




\keyword{file}
\keyword{IO}
\keyword{internal}
