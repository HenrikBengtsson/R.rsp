%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspCode.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspCodeChunk}
\docType{class}
\alias{RspCodeChunk}


\title{The RspCodeChunk class}

\description{
 Package:  R.rsp \cr
\bold{Class RspCodeChunk}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[R.rsp]{RspExpression}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{\link[R.rsp]{RspCode}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~+--}\code{RspCodeChunk}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspCodeChunk}\cr
extends \link[R.rsp]{RspCode}\cr



 An RspCodeChunk is an \code{\link{RspCode}} that represents a complete
 RSP code chunk.
}

\usage{
RspCodeChunk(..., return=FALSE)
}

\arguments{
  \item{...}{Arguments passed to the constructor of \code{\link{RspCode}}.}
  \item{return}{If \code{\link[base:logical]{TRUE}}, the value of the evaluated code chunk is returned.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{asRspString} \tab  -\cr
 \tab \code{getInclude} \tab  -\cr
}


 \bold{Methods inherited from RspCode}:\cr
asRspString, getCode, getEcho

 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getComment, getInclude, getSuffixSpecs

 \bold{Methods inherited from RspObject}:\cr
print

 \bold{Methods inherited from character}:\cr
all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, formula, getDLLRegisteredRoutines, isOpen, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
