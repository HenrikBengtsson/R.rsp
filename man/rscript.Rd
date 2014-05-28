%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rscript.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rscript}
\alias{rscript.default}
\alias{rscript}
\alias{rscript.RspString}
\alias{rscript.RspDocument}

\title{Compiles an RSP document and returns the generated source code script}

\description{
 Compiles an RSP document and returns the generated source code script.
}

\usage{
\method{rscript}{default}(..., file=NULL, path=NULL, output=NULL, workdir=NULL, envir=parent.frame(),
  args="*", verbose=FALSE)
}

\arguments{
  \item{...}{\code{\link[base]{character}} strings with RSP markup.}
  \item{file, path}{Alternatively, a file, a URL or a \code{\link[base:connections]{connection}} from
     with the strings are read.
     If a file, the \code{path} is prepended to the file, iff given.}
  \item{output}{A \code{\link[base]{character}} string or a \code{\link[base:connections]{connection}} specifying where
     output should be directed.
     The default is a file with a filename where the file extension(s)
     (typically \code{".*.rsp"}) has been replaced by \code{".R"}
     in the directory given by the \code{workdir} argument.}
  \item{workdir}{The working directory to use after parsing and
     preprocessing.
     If argument \code{output} specifies an absolute pathname,
     then the directory of \code{output} is used, otherwise the
     current directory is used.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP string is
     preprocessed and evaluated.}
  \item{args}{A named \code{\link[base]{list}} of arguments assigned to the environment
    in which the RSP string is parsed and evaluated.
    See \code{\link[R.utils]{cmdArgs}}.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns an \code{\link{RspFileProduct}} if possible,
  otherwise an \code{\link{RspSourceCode}}.
}

\examples{
# RSP-embedded text to an R script
code <- rscript("Current time is <\%=Sys.time()\%>\n")
cat(code, sep="\n")

# RSP-embedded text to a shell script
code <- rscript("Current time is <\%=date\%>\n", language="sh")
cat(code, sep="\n")
}

\author{Henrik Bengtsson}

\seealso{
 \code{\link{rcat}}() and \code{\link{rfile}}().
}




\keyword{file}
\keyword{IO}
\keyword{internal}
