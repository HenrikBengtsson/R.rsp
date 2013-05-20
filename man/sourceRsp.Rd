%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  sourceRsp.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{sourceRsp}
\alias{sourceRsp.default}
\alias{sourceRsp}

\title{Processes an RSP file by translating it to an R servlet, which is then sourced}

\description{
 Processes an RSP file by translating it to an R servlet, which is then sourced.
}

\usage{
\method{sourceRsp}{default}(..., response=FileRspResponse(file = stdout()), request=NULL,
  envir=parent.frame(), verbose=FALSE)
}

\arguments{
  \item{...}{Arguments passed to \code{\link{translateRspV1}}(), e.g. \code{file}
    and \code{path}.}
  \item{response}{An \code{\link{RspResponse}} object to which output is passed.
    This object can be accessed by the RSP code.}
  \item{request}{An optional \code{\link{HttpRequest}} object describing the
    request.  If \code{\link[base]{NULL}}, one is created refering to the request RSP file.
    This object can be accessed by the RSP code.}
  \item{envir}{An \code{\link[base]{environment}} to be the working environment of the
    servlet, i.e. where RSP variables and objects are stored.}
  \item{verbose}{Either a \code{\link[base]{logical}}, a \code{\link[base]{numeric}}, or a \code{\link[R.utils]{Verbose}}
    object specifying how much verbose/debug information is written to
    standard output. If a Verbose object, how detailed the information is
    is specified by the threshold level of the object. If a numeric, the
    value is used to set the threshold of a new Verbose object. If \code{\link[base:logical]{TRUE}},
    the threshold is set to -1 (minimal). If \code{\link[base:logical]{FALSE}}, no output is written.
  }
}

\value{
  Returns what the \R servlet code returns.
}

\details{
  When "sourcing" an RSP file, the RSP code is first translated to an
  \R servlet, which is plain \R source code.  Then the servlet is sourced,
  and it in turns outputs the final response, e.g. an HTML document.
}

\examples{
# The RSP file
rspPath <- system.file("rsp/rsp/docs", package="R.rsp")
rspFile <- file.path(rspPath, "helloWorld.html.rsp")
file.show(rspFile)

# The HTML (output) file
outPath <- tempdir()
response <- FileRspResponse(file="helloWorld.html", path=outPath)

# Process RSP file
sourceRsp(file=rspFile, response=response)

# View generated document
file.show(getOutput(response))

}

\author{Henrik Bengtsson}

\seealso{
  \code{\link{translateRspV1}}().
  \code{\link{sourceAllRsp}}().
}




\keyword{file}
\keyword{IO}
\keyword{internal}
