%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspConstruct.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspConstruct}
\docType{class}
\alias{RspConstruct}


 \title{The RspConstruct class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspConstruct}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{RspConstruct}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspCode}, \link[R.rsp]{RspCodeChunk}, \link[R.rsp]{RspComment}, \link[R.rsp]{RspDefineDirective}, \link[R.rsp]{RspDirective}, \link[R.rsp]{RspElseDirective}, \link[R.rsp]{RspEndifDirective}, \link[R.rsp]{RspEvalDirective}, \link[R.rsp]{RspExpression}, \link[R.rsp]{RspIfDirective}, \link[R.rsp]{RspIfeqDirective}, \link[R.rsp]{RspIfneqDirective}, \link[R.rsp]{RspIncludeDirective}, \link[R.rsp]{RspPageDirective}, \link[R.rsp]{RspText}, \link[R.rsp]{RspUnknownDirective}, \link[R.rsp]{RspUnparsedDirective}, \link[R.rsp]{RspUnparsedExpression}\cr

public class \bold{RspConstruct}\cr
extends character\cr



  An RspConstruct object represents an RSP construct, which can either be
  (i) an RSP text (a plain text section), (ii) an RSP comment,
  (iii) an RSP preprocessing directive, or (iv) an RSP expression.
 }

 \usage{
RspConstruct(object=character(), ...)
}

 \arguments{
   \item{object}{A R object.}
   \item{...}{Not used.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:asRspString.RspConstruct]{asRspString}} \tab Recreates an RSP string from an RspConstruct.\cr
 \tab \code{\link[R.rsp:getAttributes.RspConstruct]{getAttributes}} \tab Gets the attributes of an RSP expression.\cr
 \tab \code{\link[R.rsp:getSuffixSpecs.RspConstruct]{getSuffixSpecs}} \tab Gets the suffix specifications.\cr
}


 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}


\keyword{classes}
\keyword{internal}
