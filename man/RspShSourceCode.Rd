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



 An RspShSourceCode object is an \code{\link{RspSourceCode}} holding R source code.
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
}


 \bold{Methods inherited from RspSourceCode}:\cr
evaluate, print, rstring, tangle, tidy

 \bold{Methods inherited from RspProduct}:\cr
!, findProcessor, getMetadata, getType, hasProcessor, print, process, setMetadata, view

 \bold{Methods inherited from RspObject}:\cr
getAttribute, getAttributes, hasAttribute, print, setAttribute, setAttributes

 \bold{Methods inherited from character}:\cr
all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
