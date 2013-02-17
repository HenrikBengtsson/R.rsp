%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspProduct.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspFileProduct}
\docType{class}
\alias{RspFileProduct}


 \title{The RspFileProduct class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspFileProduct}\cr

\code{logical}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspProduct}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{RspFileProduct}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspFileProduct}\cr
extends \link[R.rsp]{RspProduct}\cr



  An RspFileProduct is an \code{\link{RspFileProduct}} that represents an
  RSP file product, e.g. LaTeX, Sweave and knitr documents.
 }

 \usage{RspFileProduct(pathname=NA, ...)}

 \arguments{
   \item{pathname}{An existing file.}
   \item{...}{Additional arguments pass to \code{\link{RspProduct}}.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:getType.RspFileProduct]{getType}} \tab Gets the type of an RSP file product.\cr
 \tab \code{\link[R.rsp:print.RspFileProduct]{print}} \tab Prints a summary of an RSP file product.\cr
 \tab \code{\link[R.rsp:process.RspFileProduct]{process}} \tab Processes an RSP file product.\cr
}


 \bold{Methods inherited from RspProduct}:\cr
findProcessor, getType, hasProcessor, print, process

 \bold{Methods inherited from logical}:\cr
as.data.frame, as.raster, whichVector

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}


\keyword{classes}
\keyword{internal}
