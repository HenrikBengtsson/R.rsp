%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  SourceCode.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{SourceCode}
\docType{class}
\alias{SourceCode}


 \title{The SourceCode class}

 \description{
  Package:  R.rsp \cr
\bold{Class SourceCode}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\emph{\code{SourceCode}}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RSourceCode}\cr

public abstract class \bold{SourceCode}\cr
extends character\cr



  An SourceCode object is a \code{\link[base]{character}} \code{\link[base]{vector}} holding source code for
  a particular programming language.
 }

 \usage{SourceCode(code=character(), ..., type=NA)}

 \arguments{
   \item{code, ...}{\code{\link[base]{character}} strings.}
   \item{type}{The content type of the source code.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:evaluate.SourceCode]{evaluate}} \tab Parses and evaluates the source code.\cr
 \tab \code{\link[R.rsp:getType.SourceCode]{getType}} \tab Gets the type of the SourceCode.\cr
 \tab \code{\link[R.rsp:parse.SourceCode]{parse}} \tab Parses the source code.\cr
 \tab \code{\link[R.rsp:print.SourceCode]{print}} \tab Prints the source code.\cr
 \tab \code{\link[R.rsp:tangle.SourceCode]{tangle}} \tab Drops all text-outputting calls from the source code.\cr
}


 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}
\keyword{classes}
