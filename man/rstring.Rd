%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rstring.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rstring}
\alias{rstring.default}
\alias{rstring}
\alias{rstring.RspString}
\alias{rstring.RspDocument}
\alias{rstring.RspSourceCode}
\alias{rstring.function}
\alias{rstring.expression}

\title{Evaluates an RSP string and returns the generated string}

\description{
 Evaluates an RSP string and returns the generated string.
}

\usage{
\method{rstring}{default}(..., file=NULL, path=NULL, envir=parent.frame(), args="*", verbose=FALSE)
}

\arguments{
  \item{...}{A \code{\link[base]{character}} string with RSP markup.}
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
  Returns an \code{\link{RspStringProduct}}.
}

\examples{
x <- rstring("A random integer in [1,100]: <\%=sample(1:100, size=1)\%>\n")
cat(x)

# Passing arguments
x <- rstring("A random integer in [1,<\%=K\%>]: <\%=sample(1:K, size=1)\%>\n", args=list(K=50))
cat(x)
}

\author{Henrik Bengtsson}

\seealso{
 To display the output (instead of returning a string), see
 \code{\link{rcat}}().
 For evaluating and postprocessing an RSP document and
 writing the output to a file, see \code{\link{rfile}}().
}



\keyword{file}
\keyword{IO}
