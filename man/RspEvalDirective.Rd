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
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[R.rsp]{RspDirective}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{RspEvalDirective}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspEvalDirective}\cr
extends \link[R.rsp]{RspDirective}\cr



 An RspEvalDirective is an \code{\link{RspDirective}} that causes the
 RSP parser to evaluate a piece of R code (either in a text string
 or in a file) as it is being parsed.
}

\usage{
RspEvalDirective(value="eval", ...)
}

\arguments{
  \item{value}{A \code{\link[base]{character}} string.}
  \item{attributes}{A named \code{\link[base]{list}}, which must contain a 'file'
     or a 'text' element.}
  \item{...}{Optional arguments passed to the constructor
             of \code{\link{RspDirective}}.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:getContent.RspEvalDirective]{getContent}} \tab Gets the content of the RSP eval directive.\cr
 \tab \code{\link[R.rsp:getFile.RspEvalDirective]{getFile}} \tab Gets the file attribute.\cr
}


 \bold{Methods inherited from RspDirective}:\cr
asRspString, getNameContentDefaultAttributes, requireAttributes

 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getComment, getInclude, getSuffixSpecs

 \bold{Methods inherited from RspObject}:\cr
print

 \bold{Methods inherited from character}:\cr
all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
