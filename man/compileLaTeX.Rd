%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  compileLaTeX.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{compileLaTeX}
\alias{compileLaTeX.default}
\alias{compileLaTeX}

\title{Compiles a LaTeX file}

\description{
 Compiles a LaTeX file to either PDF or DVI.
}

\usage{
\method{compileLaTeX}{default}(filename, path=NULL, format=c("pdf", "dvi"), clean=FALSE, quiet=TRUE,
  texinputs=NULL, ..., outPath=".", verbose=FALSE)
}

\arguments{
  \item{filename, path}{The filename and (optional) path of the
     LaTeX document to be compiled.
     Only *.tex and *.ltx filename extensions are allowed.}
  \item{format}{A \code{\link[base]{character}} string specifying the output format.}
  \item{clean, quiet, texinputs}{Additional arguments passed to
     \code{\link[tools]{texi2dvi}}.}
  \item{...}{Not used.}
  \item{outPath}{The output and working directory.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns the pathname of the generated (PDF or DVI) document.
}

\section{Supported filename extensions}{
  Internally \code{\link[tools]{texi2dvi}} is used, which in turn uses
  \code{Sys.which("texi2dvi")} if available.  Most known implementation
  of the latter will only recognize LaTeX documents with filename
  extensions *.tex and *.ltx (case sensitive).  (Any other filenames
  will be compiled with 'texinfo', which is not a LaTeX compiler.)
}

\author{Henrik Bengtsson}

\seealso{
  Internally, \code{\link[tools]{texi2dvi}} is used.
  To compile Sweave LaTeX documents, \code{\link{compileSweave}}().
}




\keyword{file}
\keyword{IO}
\keyword{internal}
