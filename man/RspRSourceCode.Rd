%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspRSourceCode.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspRSourceCode}
\docType{class}
\alias{RspRSourceCode}


 \title{The RspRSourceCode class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspRSourceCode}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspProduct}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspSourceCode}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{RspRSourceCode}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspRSourceCode}\cr
extends \emph{\link[R.rsp]{RspSourceCode}}\cr



  An RspRSourceCode object is an \code{\link{RspSourceCode}} holding R source code.
 }

 \usage{
RspRSourceCode(...)
}

 \arguments{
   \item{...}{\code{\link[base]{character}} strings.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:evaluate.RspRSourceCode]{evaluate}} \tab Parses and evaluates the R code.\cr
 \tab \code{findProcessor} \tab  -\cr
 \tab \code{\link[R.rsp:getCompleteCode.RspRSourceCode]{getCompleteCode}} \tab Gets the complete R source code.\cr
 \tab \code{\link[R.rsp:parse.RspRSourceCode]{parse}} \tab Parses the R code.\cr
 \tab \code{rcat} \tab  -\cr
 \tab \code{rstring} \tab  -\cr
 \tab \code{\link[R.rsp:tangle.RspRSourceCode]{tangle}} \tab Drops all text-outputting calls from the R code.\cr
}


 \bold{Methods inherited from RspSourceCode}:\cr
evaluate, print, tangle

 \bold{Methods inherited from RspProduct}:\cr
findProcessor, getAnnotations, getType, hasProcessor, print, process

 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}


\keyword{classes}
\keyword{internal}
