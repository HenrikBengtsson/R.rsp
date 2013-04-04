%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  findAsciiDoc.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{findAsciiDoc}
\alias{findAsciiDoc.default}
\alias{findAsciiDoc}

\title{Locates the asciidoc executable}

\description{
 Locates the asciidoc executable on the current system.
}

\usage{
\method{findAsciiDoc}{default}(mustExist=TRUE, ..., verbose=FALSE)
}

\arguments{
  \item{mustExist}{If \code{\link[base:logical]{TRUE}}, an exception is thrown if the executable
     could not be located.}
  \item{...}{Not used.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns the pathname to the executable, or \code{\link[base]{NULL}} if not found.
}

\details{
 The 'asciidoc' executable is searched for as follows:
 \enumerate{
  \item \code{Sys.which("asciidoc")}
 }
}

\author{Henrik Bengtsson}




\keyword{file}
\keyword{IO}
\keyword{internal}
