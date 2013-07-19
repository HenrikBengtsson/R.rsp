%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rfile.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rfile}
\alias{rfile.default}
\alias{rfile}
\alias{rfile.RspString}
\alias{rfile.RspDocument}
\alias{rfile.RspRSourceCode}
\alias{rfile.function}

\title{Evaluates and postprocesses an RSP document and outputs the final RSP document file}

\description{
 Evaluates and postprocesses an RSP document and outputs the final RSP document file.
}

\usage{
\method{rfile}{default}(file, path=NULL, output=NULL, workdir=NULL, type=NA, envir=parent.frame(),
  args="*", postprocess=TRUE, ..., verbose=FALSE)
}

\arguments{
  \item{file, path}{Specifies the RSP file to processed, which can
     be a file, a URL or a \code{\link[base:connections]{connection}}.
     If a file, the \code{path} is prepended to the file, iff given.}
  \item{output}{A \code{\link[base]{character}} string or a \code{\link[base:connections]{connection}} specifying where
     output should be directed.
     The default is a file with a filename where the file extension
     (typically \code{".rsp"}) has been dropped from \code{file}
     in the directory given by the \code{workdir} argument.}
  \item{workdir}{The working directory to use after parsing and
     preprocessing, but while \emph{evaluating} and \emph{postprocessing}
     the RSP document.
     If argument \code{output} specifies an absolute pathname,
     then the directory of \code{output} is used, otherwise the
     current directory is used.}
  \item{type}{The default content type of the RSP document.  By default, it
     is inferred from the \code{output} filename extension, iff possible.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP document is
     preprocessed and evaluated.}
  \item{args}{A named \code{\link[base]{list}} of arguments assigned to the environment
    in which the RSP string is parsed and evaluated.
    See \code{\link[R.utils]{cmdArgs}}.}
  \item{postprocess}{If \code{\link[base:logical]{TRUE}}, and a postprocessing method exists for
     the generated RSP product, it is postprocessed as well.}
  \item{...}{Additional arguments passed to the RSP engine.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns an \code{\link{RspProduct}}.
  If argument \code{output} specifies a file, then this is
  an \code{\link{RspFileProduct}}.
}

\section{Processing RSP files from the command line}{
  Using \code{\link{Rscript}} and \code{rfile()}, it is possible to process
  an RSP file from the command line.  For example,

  \code{Rscript -e "R.rsp::rfile(file='RSP-refcard.tex.rsp', path=system.file('doc', package='R.rsp'))"}

  parses and evaluates \file{RSP-refcard.tex.rsp} and output \file{RSP-refcard.pdf} in the current directory.
}

\examples{
path <- system.file("exData", package="R.rsp")
pathname <- rfile("random.txt.rsp", path=path)
print(pathname)

lines <- readLines(pathname, warn=FALSE)
cat(lines, collapse="\n")


# Passing arguments
path <- system.file("exData", package="R.rsp")
pathname <- rfile("random-args.txt.rsp", path=path, args=list(K=50))
print(pathname)

lines <- readLines(pathname, warn=FALSE)
cat(lines, collapse="\n")


# Compile and display the main vignette (requires LaTeX)
if (isCapableOf(R.rsp, "latex")) {
  path <- system.file("doc", package="R.rsp")
  pdf <- rfile("Dynamic_document_creation_using_RSP.tex.rsp", path=path)
  printf("Created document: \%s\n", pdf)
  if (interactive()) browseURL(pdf)
}
}

\author{Henrik Bengtsson}

\seealso{
 \code{\link{rstring}}() and \code{\link{rcat}}().
}



\keyword{file}
\keyword{IO}
