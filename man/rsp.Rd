%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rsp.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rsp}
\alias{rsp.default}
\alias{rsp}

\title{Compiles an RSP document}

\description{
 Compiles an RSP document.
}

\usage{\method{rsp}{default}(filename=NULL, path=NULL, text=NULL, response=NULL, ..., postprocess=TRUE, verbose=FALSE)}

\arguments{
  \item{filename, path}{The filename and (optional) path of the
     RSP document to be compiled.}
  \item{text}{A \code{\link[base]{character}} \code{\link[base]{vector}} of RSP code to be processed,
     iff argument \code{filename} is not given.}
  \item{response}{Specifies where the final output should be sent.
     If argument \code{text} is given, then \code{\link[base]{stdout}}() is used.
     Otherwise, the output defaults to that of the type-specific compiler.}
  \item{...}{Additional arguments passed to the type-specific compiler.}
  \item{postprocess}{If \code{\link[base:logical]{TRUE}}, and a postprocessing method exists for
     the generated document type, it is postprocessed as well.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns what the type-specific compiler returns.
}

\examples{
# EXAMPLE #1
rsp(text="A random number in [1,100]: <\%=sample(1:100, size=1)\%>\n")

# EXAMPLE #2
path <- system.file("doc", package="R.rsp")
pathname <- rsp("report.tex.rsp", path=path)
printf("Created document: \%s\n", pathname)

}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\section{Postprocessing}{
  For some document types, the \code{rsp()} method automatically
  postprocesses the generated document as well.
}



\keyword{file}
\keyword{IO}
