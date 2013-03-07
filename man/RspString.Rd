%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspString.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspString}
\docType{class}
\alias{RspString}


 \title{The RspString class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspString}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{RspString}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspString}\cr
extends character\cr



  An RspString is a \code{\link[base]{character}} \code{\link[base]{vector}} with RSP markup.
 }

 \usage{
RspString(str=character(), ..., type=NA, source=NA, annotations=list())
}

 \arguments{
   \item{str, ...}{\code{\link[base]{character}} strings.}
   \item{type}{The content type of the RSP string.}
   \item{source}{A reference to the source RSP document, iff any.}
   \item{annotations}{A named \code{\link[base]{list}} of other content annotations.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:evaluate.RspString]{evaluate}} \tab Parses, translates, and evaluates the RSP string.\cr
 \tab \code{\link[R.rsp:getAnnotations.RspString]{getAnnotations}} \tab Gets the annotations of the RspDocument.\cr
 \tab \code{\link[R.rsp:getSource.RspString]{getSource}} \tab Gets the source reference of an RSP string.\cr
 \tab \code{\link[R.rsp:getType.RspString]{getType}} \tab Gets the type of an RSP string.\cr
 \tab \code{\link[R.rsp:parse.RspString]{parse}} \tab Parses the RSP string.\cr
 \tab \code{\link[R.rsp:parseRaw.RspString]{parseRaw}} \tab Parses the string into blocks of text and RSP.\cr
 \tab \code{rcat} \tab  -\cr
 \tab \code{rstring} \tab  -\cr
 \tab \code{\link[R.rsp:toR.RspString]{toR}} \tab Parses and translates the RSP string into R code.\cr
}


 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}


\keyword{classes}
\keyword{internal}
