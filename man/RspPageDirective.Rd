%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspExpression.R
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
\code{~~+--}\code{\link[R.rsp]{RspExpression}}\cr
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

 \usage{RspPageDirective(...)}

 \arguments{
   \item{...}{Arguments passed to the constructor of \code{\link{RspDirective}}.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:getType.RspPageDirective]{getType}} \tab Gets the content type.\cr
}


 \bold{Methods inherited from RspExpression}:\cr
getAttributes

 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}
\keyword{classes}