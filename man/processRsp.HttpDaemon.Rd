%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpDaemon.processRsp.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\name{HttpDaemon$processRsp}
\alias{HttpDaemon$processRsp}
\alias{processRsp.HttpDaemon}
\alias{HttpDaemon.processRsp}
\alias{processRsp,HttpDaemon-method}

\title{Processes an RSP page}

\description{
 Processes an RSP page.
}

\usage{
## Static method (use this):
## HttpDaemon$processRsp(pathname=tcltk::tclvalue("mypath"),
##   version=getOption("R.rsp/HttpDaemon/RspVersion", "1.0.0"), ...)

## Don't use the below:
\method{processRsp}{HttpDaemon}(static=getStaticInstance(HttpDaemon), pathname=tcltk::tclvalue("mypath"),
  version=getOption("R.rsp/HttpDaemon/RspVersion", "1.0.0"), ...)
}

\arguments{
  \item{pathname}{The RSP file to be processed.}
  \item{version}{The version of the RSP processor to use.}
  \item{...}{Not used.}
}

\value{
 Returns nothing.
}

\section{Settings}{
  The \pkg{R.rsp} package implements different RSP engines.
  It is possible to specify which version the Tcl HTTP daemon
  should use via the option \code{R.rsp/HttpDaemon/RspVersion}.
  The default is now to use the new RSP engine, which corresponds
  \code{options("R.rsp/HttpDaemon/RspVersion"="1.0.0")}.
  To use the old legacy RSP engine, which is deprecated and will
  eventually be defunct and removed, use
  \code{options("R.rsp/HttpDaemon/RspVersion"="0.1.0")}.
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{HttpDaemon}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
