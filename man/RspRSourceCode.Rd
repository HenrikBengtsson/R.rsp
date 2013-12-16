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
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspProduct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[R.rsp]{RspSourceCode}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\emph{\code{RspRSourceCode}}\cr

\bold{Directly known subclasses:}\cr
\cr

public abstract class \bold{RspRSourceCode}\cr
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
 \tab \code{\link[R.rsp:parse.RspRSourceCode]{parse}} \tab Parses the R code.\cr
 \tab \code{rcat} \tab  -\cr
 \tab \code{rfile} \tab  -\cr
 \tab \code{rsource} \tab  -\cr
 \tab \code{tangle} \tab  -\cr
 \tab \code{tidy} \tab  -\cr
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
