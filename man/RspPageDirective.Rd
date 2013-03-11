%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDirective.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspPageDirective}
\docType{class}
\alias{RspPageDirective}


 \title{The RspPageDirective class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspPageDirective}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspDirective}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{RspPageDirective}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspPageDirective}\cr
extends \link[R.rsp]{RspDirective}\cr



  An RspPageDirective is an \code{\link{RspDirective}} that annotates the
  content of the RSP document, e.g. the content type.
 }

 \usage{
RspPageDirective(...)
}

 \arguments{
   \item{...}{Arguments passed to the constructor of \code{\link{RspDirective}}.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:getKeywords.RspPageDirective]{getKeywords}} \tab Gets the keywords.\cr
 \tab \code{\link[R.rsp:getTitle.RspPageDirective]{getTitle}} \tab Gets the title.\cr
 \tab \code{\link[R.rsp:getType.RspPageDirective]{getType}} \tab Gets the content type.\cr
}


 \bold{Methods inherited from RspDirective}:\cr
asRspString

 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getAttribute, getAttributes, getComment, getSuffixSpecs

 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
