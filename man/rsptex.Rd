%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rsptex.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rsptex}
\alias{rsptex.default}
\alias{rsptex}

\title{Compiles an RSP LaTeX file into a DVI file}

\description{
 Compiles an RSP LaTeX file into a DVI file.
}

\usage{\method{rsptex}{default}(..., pdf=TRUE, force=FALSE, verbose=FALSE)}

\arguments{
  \item{...}{Arguments passed to \code{\link{compileRsp}}().}
  \item{pdf}{If \code{\link[base:logical]{TRUE}}, a PDF is generated, otherwise a DVI file.}
  \item{force}{If \code{\link[base:logical]{TRUE}}, file timestamps are ignored.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns the pathname to the generated document.
}

\section{Retrieving intermediate and final results}{
  By default, the RSP document is processed in a local environment,
  which is discarded afterward.  This can be avoided by explicitly
  specifying the processing environment, e.g.
  \code{env <- new.env(); rsptex(..., envir=env)}.
  Afterward you can query its content by, say, \code{ll(envir=env)}
  or attach its content by \code{attachLocally(env)}.
}

\examples{\dontrun{
  library("R.rsp")
path <- system.file("doc", package="R.rsp")
rsptex("report.tex.rsp", path=path)

}}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  The generated TeX document is compiled by \code{\link[tools]{texi2dvi}} in
  the \pkg{tools} package.
}




\keyword{file}
\keyword{IO}
\keyword{internal}
