%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  compileMarkdown.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{compileMarkdown}
\alias{compileMarkdown.default}
\alias{compileMarkdown}

\title{Compiles a Markdown file}

\description{
 Compiles a Markdown file to HTML.
}

\usage{
\method{compileMarkdown}{default}(filename, path=NULL, ..., outPath=".", header=NULL,
  metadata=getMetadata(filename), verbose=FALSE)
}

\arguments{
  \item{filename, path}{The filename and (optional) path of the
     Markdown document to be compiled.}
  \item{...}{Additional arguments passed to \code{\link[markdown]{markdownToHTML}}.}
  \item{outPath}{The output and working directory.}
  \item{header}{\code{\link[base]{character}} \code{\link[base]{vector}} of valid HTML strings that should be added to the HTML <head> section.}
  \item{metadata}{A named \code{\link[base]{list}} with meta data that will add as <meta> tags in the HTML <head> section.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns the pathname of the generated HTML document.
}

\details{
  The input encoding is based on \code{getOption("encoding")} and
  the output encoding is \code{"UTF-8"}
  (forced by \code{\link[markdown]{markdownToHTML}}).
}

\author{Henrik Bengtsson}

\seealso{
  Internally, \code{\link[markdown]{markdownToHTML}} is used.
}




\keyword{file}
\keyword{IO}
\keyword{internal}
