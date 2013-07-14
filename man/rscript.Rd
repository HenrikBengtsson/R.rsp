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

\title{Compiles an RSP string and returns the generated source code script}

\description{
 Compiles an RSP string and returns the generated source code script.
}

\usage{
\method{rscript}{default}(..., file=NULL, path=NULL, envir=parent.frame(), args="*", verbose=FALSE)
}

\arguments{
  \item{...}{\code{\link[base]{character}} strings with RSP markup.}
  \item{file, path}{Alternatively, a file, a URL or a \code{\link[base:connections]{connection}} from
     with the strings are read.
     If a file, the \code{path} is prepended to the file, iff given.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP string is
     preprocessed and evaluated.}
  \item{args}{A named \code{\link[base]{list}} of arguments assigned to the environment
    in which the RSP string is parsed and evaluated.
    See \code{\link[R.utils]{cmdArgs}}.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns an \code{\link{RspSourceCode}}.
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
