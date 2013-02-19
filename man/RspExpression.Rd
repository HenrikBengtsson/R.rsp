%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspExpression.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspExpression}
\docType{class}
\alias{RspExpression}


 \title{The RspExpression class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspExpression}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{RspExpression}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspCode}, \link[R.rsp]{RspCodeChunk}, \link[R.rsp]{RspComment}, \link[R.rsp]{RspDefineDirective}, \link[R.rsp]{RspDirective}, \link[R.rsp]{RspElseDirective}, \link[R.rsp]{RspEndifDirective}, \link[R.rsp]{RspEvalDirective}, \link[R.rsp]{RspIfDirective}, \link[R.rsp]{RspIfeqDirective}, \link[R.rsp]{RspIfneqDirective}, \link[R.rsp]{RspIncludeDirective}, \link[R.rsp]{RspPageDirective}, \link[R.rsp]{RspText}, \link[R.rsp]{RspUnknownDirective}\cr

public class \bold{RspExpression}\cr
extends character\cr



  An RspExpression object represents an RSP expression, which can either
  be a plain text section or an RSP section.
 }

 \usage{RspExpression(object=character(), ...)}

 \arguments{
   \item{object}{A R object.}
   \item{...}{Not used.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:getAttributes.RspExpression]{getAttributes}} \tab Gets the attributes of an RSP expression.\cr
}


 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}


\keyword{classes}
\keyword{internal}
