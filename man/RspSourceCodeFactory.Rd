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
 \tab \code{exprToCode} \tab  -\cr
 \tab \code{getCompleteCode} \tab  -\cr
 \tab \code{getLanguage} \tab  -\cr
 \tab \code{makeSourceCode} \tab  -\cr
 \tab \code{toSourceCode} \tab  -\cr
}


 \bold{Methods inherited from character}:\cr
all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
