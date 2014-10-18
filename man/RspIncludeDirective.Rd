%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDirective.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspIncludeDirective}
\docType{class}
\alias{RspIncludeDirective}


\title{The RspIncludeDirective class}

\description{
 Package:  R.rsp \cr
\bold{Class RspIncludeDirective}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[R.rsp]{RspDirective}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{RspIncludeDirective}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspIncludeDirective}\cr
extends \link[R.rsp]{RspDirective}\cr



 An RspIncludeDirective is an \code{\link{RspDirective}} that causes the
 RSP parser to include (and parse) an external RSP file.
}

\usage{
RspIncludeDirective(value="include", ...)
}

\arguments{
  \item{value}{A \code{\link[base]{character}} string.}
  \item{attributes}{A named \code{\link[base]{list}}, which must contain either
     a 'file' or a 'text' element.}
  \item{...}{Optional arguments passed to the constructor
             of \code{\link{RspDirective}}.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{getContent} \tab  -\cr
 \tab \code{getFile} \tab  -\cr
 \tab \code{getVerbatim} \tab  -\cr
 \tab \code{getWrap} \tab  -\cr
}


 \bold{Methods inherited from RspDirective}:\cr
asRspString, getNameContentDefaultAttributes, requireAttributes

 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getComment, getInclude, getSuffixSpecs

 \bold{Methods inherited from RspObject}:\cr
getAttribute, getAttributes, hasAttribute, print, setAttribute, setAttributes

 \bold{Methods inherited from character}:\cr
all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, formula, getDLLRegisteredRoutines, isOpen, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
