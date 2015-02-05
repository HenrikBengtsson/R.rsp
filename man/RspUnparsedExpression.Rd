%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspExpression.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspUnparsedExpression}
\docType{class}
\alias{RspUnparsedExpression}


\title{The RspUnparsedExpression class}

\description{
 Package:  R.rsp \cr
\bold{Class RspUnparsedExpression}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[R.rsp]{RspExpression}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{RspUnparsedExpression}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspUnparsedExpression}\cr
extends \link[R.rsp]{RspExpression}\cr



 An RspUnparsedExpression is an \code{\link{RspExpression}} that still has not
 been parsed for its class and content.  After \code{\link{parse}}():ing such
 an object, the class of this RSP expression will be known.
}

\usage{
RspUnparsedExpression(...)
}

\arguments{
  \item{...}{Arguments passed to \code{\link{RspExpression}}.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:parse.RspUnparsedExpression]{parse}} \tab Parses the unknown RSP expression for its class.\cr
}


 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getComment, getInclude, getSuffixSpecs

 \bold{Methods inherited from RspObject}:\cr
print

 \bold{Methods inherited from character}:\cr
all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
