%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  buildNonSweaveVignette.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{parseVignette}
\alias{parseVignette}


\title{Parses an Rnw file}

\description{
 Parses an Rnw file.
}

\usage{
parseVignette(pathname, commentPrefix="^[ \t]*\%[ \t]*", final=FALSE, source=FALSE,
  maxLines=-1L, ...)
}

\arguments{
  \item{pathname}{The Rnw file to be parsed.}
  \item{commentPrefix}{A regular expression specifying the prefix
    pattern of vignette comments.}
  \item{final}{If \code{\link[base:logical]{TRUE}}, the output PDF or HTML file is also located.}
  \item{source}{If \code{\link[base:logical]{TRUE}}, the output R source code file is also located.}
  \item{maxLines}{The maximum number of lines to scan.}
  \item{...}{Not used.}
}

\value{
  Returns a named \code{\link[base]{list}} or NULL if a non-vignette.
}

\author{Henrik Bengtsson}




\keyword{file}
\keyword{IO}
\keyword{internal}
