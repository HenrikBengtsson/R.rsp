%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDirective.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspPageDirective}
\docType{class}
\alias{RspPageDirective}


\title{The RspPageDirective class}

\description{
 Package:  R.rsp \cr
\bold{Class RspPageDirective}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[R.rsp]{RspDirective}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{RspPageDirective}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspPageDirective}\cr
extends \link[R.rsp]{RspDirective}\cr



 An RspPageDirective is an \code{\link{RspDirective}} that annotates the
 content of the RSP document, e.g. the content type.
}

\usage{
RspPageDirective(value="page", ...)
}

\arguments{
  \item{value}{A \code{\link[base]{character}} string.}
  \item{...}{Arguments passed to the constructor of \code{\link{RspDirective}}.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:getType.RspPageDirective]{getType}} \tab Gets the content type.\cr
}


 \bold{Methods inherited from RspDirective}:\cr
asRspString, getNameContentDefaultAttributes, requireAttributes

 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getComment, getInclude, getSuffixSpecs

 \bold{Methods inherited from RspObject}:\cr
print

 \bold{Methods inherited from character}:\cr
Ops,nonStructure,vector-method, Ops,structure,vector-method, Ops,vector,nonStructure-method, Ops,vector,structure-method, all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, coerce,ANY,character-method, coerce,character,SuperClassMethod-method, coerce,character,signature-method, coerce<-,ObjectsWithPackage,character-method, coerce<-,signature,character-method, formula, getDLLRegisteredRoutines, isOpen, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
