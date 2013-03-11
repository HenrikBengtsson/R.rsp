%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDirective.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspEvalDirective}
\docType{class}
\alias{RspEvalDirective}


 \title{The RspEvalDirective class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspEvalDirective}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspDirective}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{RspEvalDirective}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspEvalDirective}\cr
extends \link[R.rsp]{RspDirective}\cr



  An RspEvalDirective is an \code{\link{RspDirective}} that causes the
  RSP parser to evaluate a piece of R code (either in a text string
  or in a file) as it is being parsed.
 }

 \usage{
RspEvalDirective(attributes=list(), ...)
}

 \arguments{
   \item{attributes}{A named \code{\link[base]{list}}, which must contain a 'file'
      or a 'text' element.}
   \item{...}{Optional arguments passed to the constructor
              of \code{\link{RspDirective}}.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:getFile.RspEvalDirective]{getFile}} \tab Gets the file attribute.\cr
 \tab \code{\link[R.rsp:getLanguage.RspEvalDirective]{getLanguage}} \tab Gets the programming language.\cr
 \tab \code{\link[R.rsp:getText.RspEvalDirective]{getText}} \tab Gets the text.\cr
}


 \bold{Methods inherited from RspDirective}:\cr
asRspString

 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getAttribute, getAttributes, getComment, getSuffixSpecs

 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
