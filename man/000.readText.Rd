%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  readText.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{.readText}
\alias{.readText}


\title{Reads the content of a local or an online text file}

\description{
 Reads the content of a local or an online text file.
}

\usage{
.readText(con, ..., maxAge=getOption("R.rsp::downloadIfOlderThan", -Inf))
}

\arguments{
  \item{con}{A \code{\link[base]{character}} string specifying a local file or a URL,
     or a \code{\link[base:connections]{connection}}.}
  \item{...}{Not used.}
  \item{maxAge}{A \code{\link[base]{numeric}} scalar specifying the maximum age (in seconds)
     of cached URL contents before downloading and recaching.
     If zero or less, the URL will always be downloaded.}
}

\value{
  Returns a \code{\link[base]{character}} string.
}

\section{Caching URL}{
  When reading online URLs, it may take time a significant time to
  read its content.  If the content is changing rarely, it is possible
  to cache the content locally.  If a cached version is found, then it
  is read instead.
  It is possible to control how often a file should be recached.  If the
  cache is older than argument \code{maxAge} (in seconds), then the file
  is redownloaded and recached.
}

\section{Newline substitution}{
  All occurances of \code{\\r\\n} and \code{\\r} are replaced with
  \code{\\n} such that all lines are ending in \code{\\n} regardless
  of encoding.
}

\author{Henrik Bengtsson}




\keyword{file}
\keyword{IO}
\keyword{internal}
