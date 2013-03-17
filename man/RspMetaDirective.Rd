%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDirective.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspMetaDirective}
\docType{class}
\alias{RspMetaDirective}


 \title{The RspMetaDirective class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspMetaDirective}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[R.rsp]{RspDirective}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{RspMetaDirective}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspMetaDirective}\cr
extends \link[R.rsp]{RspDirective}\cr



  An RspMetaDirective is an \code{\link{RspDirective}} representing RSP metadata.
 }

 \usage{
RspMetaDirective(value="meta", ...)
}

 \arguments{
   \item{value}{A \code{\link[base]{character}} string.}
   \item{...}{Arguments passed to the constructor of \code{\link{RspDirective}}.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\emph{No methods defined}.


 \bold{Methods inherited from RspDirective}:\cr
asRspString, requireAttributes

 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getComment, getSuffixSpecs

 \bold{Methods inherited from RspObject}:\cr
getAttribute, getAttributes, hasAttribute, setAttribute, setAttributes

 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
