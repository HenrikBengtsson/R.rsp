%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  findPandoc.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{findPandoc}
\alias{findPandoc.default}
\alias{findPandoc}

\title{Locates the pandoc executable}

\description{
 Locates the pandoc executable on the current system.
}

\usage{
\method{findPandoc}{default}(mustExist=TRUE, ..., verbose=FALSE)
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
 The executable is searched for as follows:
 \enumerate{
  \item \code{Sys.which("pandoc")}
 }
}

\author{Henrik Bengtsson}




\keyword{file}
\keyword{IO}
\keyword{internal}
