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
\method{compileMarkdown}{default}(filename, path=NULL, ..., outPath=".", verbose=FALSE)
}

\arguments{
  \item{filename, path}{The filename and (optional) path of the
     Markdown document to be compiled.}
  \item{...}{Additional arguments passed to \code{\link[markdown]{markdownToHTML}}.}
  \item{outPath}{The output and working directory.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns (invisibly) the pathname of the generated HTML document.
}

\author{Henrik Bengtsson}

\seealso{
  Internally, \code{\link[markdown]{markdownToHTML}} is used.
}




\keyword{file}
\keyword{IO}
\keyword{internal}
