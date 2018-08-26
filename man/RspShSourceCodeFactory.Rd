%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspShSourceCodeFactory.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspShSourceCodeFactory}
\docType{class}
\alias{RspShSourceCodeFactory}


\title{The RspShSourceCodeFactory class}

\description{
 Package:  R.rsp \cr
\bold{Class RspShSourceCodeFactory}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspSourceCodeFactory}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{RspShSourceCodeFactory}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspShSourceCodeFactory}\cr
extends \emph{\link[R.rsp]{RspSourceCodeFactory}}\cr



 An RspShSourceCodeFactory is an \code{\link{RspSourceCodeFactory}} for
 the shell ('sh') script language.
}

\usage{
RspShSourceCodeFactory(...)
}

\arguments{
  \item{...}{Not used.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{exprToCode} \tab  -\cr
}


 \bold{Methods inherited from RspSourceCodeFactory}:\cr
exprToCode, getCompleteCode, getLanguage, makeSourceCode, toSourceCode

 \bold{Methods inherited from character}:\cr
Ops,nonStructure,vector-method, Ops,structure,vector-method, Ops,vector,nonStructure-method, Ops,vector,structure-method, all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, coerce,ANY,character-method, coerce,character,SuperClassMethod-method, coerce,character,signature-method, coerce<-,ObjectsWithPackage,character-method, coerce<-,signature,character-method, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
