%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspShSourceCode.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspShSourceCode}
\docType{class}
\alias{RspShSourceCode}


\title{The RspShSourceCode class}

\description{
 Package:  R.rsp \cr
\bold{Class RspShSourceCode}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspProduct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[R.rsp]{RspSourceCode}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\emph{\code{RspShSourceCode}}\cr

\bold{Directly known subclasses:}\cr
\cr

public abstract class \bold{RspShSourceCode}\cr
extends \emph{\link[R.rsp]{RspSourceCode}}\cr



 An RspShSourceCode object is an \code{\link{RspSourceCode}} holding shell code.
}

\usage{
RspShSourceCode(...)
}

\arguments{
  \item{...}{\code{\link[base]{character}} strings.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:evaluate.RspShSourceCode]{evaluate}} \tab Evaluates the shell (sh) code.\cr
 \tab \code{findProcessor} \tab  -\cr
 \tab \code{rfile} \tab  -\cr
}


 \bold{Methods inherited from RspSourceCode}:\cr
evaluate, print, rstring, tangle, tidy

 \bold{Methods inherited from RspProduct}:\cr
!, findProcessor, getType, hasProcessor, print, process, view

 \bold{Methods inherited from RspObject}:\cr
print

 \bold{Methods inherited from character}:\cr
Ops,nonStructure,vector-method, Ops,structure,vector-method, Ops,vector,nonStructure-method, Ops,vector,structure-method, all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, coerce,ANY,character-method, coerce,character,SuperClassMethod-method, coerce,character,signature-method, coerce<-,ObjectsWithPackage,character-method, coerce<-,signature,character-method, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
