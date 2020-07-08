%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rargs.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rargs}
\alias{rargs.default}
\alias{rargs}

\title{Gets RSP arguments of an RSP document}

\description{
 Gets RSP arguments of an RSP document, if any.
}

\usage{
\method{rargs}{default}(...)
}

\arguments{
  \item{...}{Arguments passed to \code{\link{rcompile}}().}
}

\value{
  Returns a \code{\link[base]{data.frame}} of class 'RspArguments'.
}

\details{
  Any RSP preprocessing variable with an 'description' attribute
  is considered to be an RSP argument.
}

\examples{
path <- system.file("rsp_examples", package="R.rsp")
args <- rargs(file="LoremIpsum.tex.rsp", path=path)
print(args)


}

\author{Henrik Bengtsson}

\seealso{
 \code{\link{rfile}}().
}




\keyword{file}
\keyword{IO}
\keyword{internal}
