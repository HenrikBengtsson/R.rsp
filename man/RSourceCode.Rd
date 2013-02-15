%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RSourceCode.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RSourceCode}
\docType{class}
\alias{RSourceCode}


 \title{The RSourceCode class}

 \description{
  Package:  R.rsp \cr
\bold{Class RSourceCode}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{SourceCode}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{RSourceCode}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RSourceCode}\cr
extends \emph{\link[R.rsp]{SourceCode}}\cr



  An RSourceCode object is a \code{\link[base]{character}} \code{\link[base]{vector}} holding R source code.
 }

 \usage{RSourceCode(...)}

 \arguments{
   \item{...}{\code{\link[base]{character}} strings.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:evaluate.RSourceCode]{evaluate}} \tab Parses and evaluates the R code.\cr
 \tab \code{\link[R.rsp:parse.RSourceCode]{parse}} \tab Parses the R code.\cr
 \tab \code{rcat} \tab  -\cr
 \tab \code{rstring} \tab  -\cr
 \tab \code{\link[R.rsp:tangle.RSourceCode]{tangle}} \tab Drops all text-outputting calls from the R code.\cr
}


 \bold{Methods inherited from SourceCode}:\cr
evaluate, getType, parse, print, tangle

 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}
\keyword{classes}
