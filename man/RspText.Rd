%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspExpression.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspText}
\docType{class}
\alias{RspText}


 \title{The RspText class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspText}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspExpression}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{RspText}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspText}\cr
extends \link[R.rsp]{RspExpression}\cr



  An RspText is an \code{\link{RspExpression}} that represents an
  plain text section.
  Its content is independent of the underlying programming language.
 }

 \usage{RspText(text=character(), ...)}

 \arguments{
   \item{text}{A \code{\link[base]{character}} string.}
   \item{...}{Not used.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:getText.RspText]{getText}} \tab Gets the text.\cr
}


 \bold{Methods inherited from RspExpression}:\cr
getAttributes

 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}
\keyword{classes}
