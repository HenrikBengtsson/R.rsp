%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  buildNonSweaveVignette.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{parseVignettes}
\alias{parseVignettes}


\title{Locates and parses all vignettes}

\description{
 Locates and parses all vignettes.
}

\usage{
parseVignettes(path=".", pattern="[.][^.~]*$", ...)
}

\arguments{
  \item{path}{The directory where to search for vignettes.}
  \item{pattern}{Filename pattern to locate vignettes.}
  \item{...}{Additional arguments passed to \code{\link{parseVignette}}().}
}

\value{
  Returns a \code{\link[base]{list}} where each element corresponds to an
  identified vignette source file.  A file is considered to be
  a vignette source file if it has \code{\\Vignette.*\{\}} markups
  in the top 50 lines.
  Each such vignette element consists of a named \code{\link[base]{list}} with
  the parse \code{\\Vignette.*\{\}} information.
}

\author{Henrik Bengtsson}




\keyword{file}
\keyword{IO}
\keyword{internal}
