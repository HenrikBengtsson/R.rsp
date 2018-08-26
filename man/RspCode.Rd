%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspCode.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspCode}
\docType{class}
\alias{RspCode}


\title{The RspCode class}

\description{
 Package:  R.rsp \cr
\bold{Class RspCode}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[R.rsp]{RspExpression}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{RspCode}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspCodeChunk}\cr

public class \bold{RspCode}\cr
extends \link[R.rsp]{RspExpression}\cr



 An RspCode is an \code{\link{RspExpression}} that represents a piece of source
 code, which may or may not be a complete code chunk (expression).
}

\usage{
RspCode(code=character(), echo=FALSE, ...)
}

\arguments{
  \item{code}{A \code{\link[base]{character}} string.}
  \item{echo}{If \code{\link[base:logical]{TRUE}}, code is echoed to the output.}
  \item{...}{Not used.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{asRspString} \tab  -\cr
 \tab \code{\link[R.rsp:getCode.RspCode]{getCode}} \tab Gets the source code.\cr
 \tab \code{\link[R.rsp:getEcho.RspCode]{getEcho}} \tab Checks whether the source code should be echoed or not.\cr
}


 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getComment, getInclude, getSuffixSpecs

 \bold{Methods inherited from RspObject}:\cr
print

 \bold{Methods inherited from character}:\cr
Ops,nonStructure,vector-method, Ops,structure,vector-method, Ops,vector,nonStructure-method, Ops,vector,structure-method, all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, coerce,ANY,character-method, coerce,character,SuperClassMethod-method, coerce,character,signature-method, coerce<-,ObjectsWithPackage,character-method, coerce<-,signature,character-method, formula, getDLLRegisteredRoutines, isOpen, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
