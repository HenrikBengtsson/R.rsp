%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspSourceCodeFactory.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspSourceCodeFactory}
\docType{class}
\alias{RspSourceCodeFactory}


\title{The RspSourceCodeFactory class}

\description{
 Package:  R.rsp \cr
\bold{Class RspSourceCodeFactory}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\emph{\code{RspSourceCodeFactory}}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspRSourceCodeFactory}, \link[R.rsp]{RspShSourceCodeFactory}\cr

public abstract class \bold{RspSourceCodeFactory}\cr
extends character\cr



 An RspSourceCodeFactory is language-specific engine that knows how to translate
 individual \code{\link{RspExpression}}:s into source code of a specific
 programming language.
}

\usage{
RspSourceCodeFactory(language=NA, ...)
}

\arguments{
  \item{language}{A \code{\link[base]{character}} string.}
  \item{...}{Not used.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:exprToCode.RspSourceCodeFactory]{exprToCode}} \tab Translates an RspExpression into source code.\cr
 \tab \code{\link[R.rsp:getCompleteCode.RspSourceCodeFactory]{getCompleteCode}} \tab Gets the source code header, body, and footer.\cr
 \tab \code{\link[R.rsp:getLanguage.RspSourceCodeFactory]{getLanguage}} \tab Gets the language.\cr
 \tab \code{\link[R.rsp:makeSourceCode.RspSourceCodeFactory]{makeSourceCode}} \tab Makes a RspSourceCode object.\cr
 \tab \code{\link[R.rsp:toSourceCode.RspSourceCodeFactory]{toSourceCode}} \tab Translates an RSP document to source code.\cr
}


 \bold{Methods inherited from character}:\cr
Ops,nonStructure,vector-method, Ops,structure,vector-method, Ops,vector,nonStructure-method, Ops,vector,structure-method, all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, coerce,ANY,character-method, coerce,character,SuperClassMethod-method, coerce,character,signature-method, coerce<-,ObjectsWithPackage,character-method, coerce<-,signature,character-method, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
