%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspExpression.R
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
\code{~~+--}\code{\link[R.rsp]{RspExpression}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{RspCode}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspCodeChunk}\cr

public class \bold{RspCode}\cr
extends \link[R.rsp]{RspExpression}\cr



  An RspCode is an \code{\link{RspExpression}} that represents a piece of source
  code, which may or may not be a complete code chunk (expression).
 }

 \usage{RspCode(code=character(), echo=FALSE, ...)}

 \arguments{
   \item{code}{A \code{\link[base]{character}} string.}
   \item{echo}{If \code{\link[base:logical]{TRUE}}, code is echoed to the output.}
   \item{...}{Not used.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:getCode.RspCode]{getCode}} \tab Gets the source code.\cr
 \tab \code{\link[R.rsp:getEcho.RspCode]{getEcho}} \tab Checks whether the source code should be echoed or not.\cr
}


 \bold{Methods inherited from RspExpression}:\cr
getAttributes

 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}
\keyword{classes}