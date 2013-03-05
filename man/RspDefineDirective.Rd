%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDirective.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspDefineDirective}
\docType{class}
\alias{RspDefineDirective}


 \title{The RspDefineDirective class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspDefineDirective}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspDirective}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{RspDefineDirective}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspDefineDirective}\cr
extends \link[R.rsp]{RspDirective}\cr



  An RspDefineDirective is an \code{\link{RspDirective}} that causes the
  RSP parser to assign the value of an attribute to an R object of
  the same name as the attribute at the time of parsing.
 }

 \usage{
RspDefineDirective(...)
}

 \arguments{
   \item{...}{Arguments passed to the constructor of \code{\link{RspDirective}}.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\emph{No methods defined}.


 \bold{Methods inherited from RspDirective}:\cr
asRspString

 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getAttributes, getSuffixSpecs

 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}


\keyword{classes}
\keyword{internal}
