%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDirective.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspUnparsedDirective}
\docType{class}
\alias{RspUnparsedDirective}


 \title{The RspUnparsedDirective class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspUnparsedDirective}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspDirective}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{RspUnparsedDirective}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspUnparsedDirective}\cr
extends \link[R.rsp]{RspDirective}\cr



  An RspUnparsedDirective is an \code{\link{RspDirective}} that still has not
  been parsed for its class and content.  After \code{\link{parse}}():ing such
  an object, the class of this RSP directive will be known.
 }

 \usage{
RspUnparsedDirective(...)
}

 \arguments{
   \item{...}{Arguments passed to \code{\link{RspDirective}}.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:asRspString.RspUnparsedDirective]{asRspString}} \tab Recreates an RSP string from an unparsed RSP preprocessing directive.\cr
 \tab \code{\link[R.rsp:parse.RspUnparsedDirective]{parse}} \tab Parses the unknown RSP directive for its class.\cr
}


 \bold{Methods inherited from RspDirective}:\cr
asRspString

 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getAttribute, getAttributes, getSuffixSpecs

 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
