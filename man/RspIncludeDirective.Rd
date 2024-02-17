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
  \item{...}{Optional arguments passed to the constructor
             of \code{\link{RspDirective}}.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:getContent.RspIncludeDirective]{getContent}} \tab Gets the content of the RSP include directive.\cr
 \tab \code{\link[R.rsp:getFile.RspIncludeDirective]{getFile}} \tab Gets the file attribute.\cr
 \tab \code{\link[R.rsp:getVerbatim.RspIncludeDirective]{getVerbatim}} \tab Checks if verbatim include should be used or not.\cr
 \tab \code{\link[R.rsp:getWrap.RspIncludeDirective]{getWrap}} \tab Get the wrap length.\cr
}


 \bold{Methods inherited from RspDirective}:\cr
asRspString, getNameContentDefaultAttributes, requireAttributes

 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getComment, getInclude, getSuffixSpecs

 \bold{Methods inherited from RspObject}:\cr
print

 \bold{Methods inherited from character}:\cr
Ops,nonStructure,vector-method, Ops,structure,vector-method, Ops,vector,nonStructure-method, Ops,vector,structure-method, all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, coerce,ANY,character-method, coerce,character,SuperClassMethod-method, coerce,character,signature-method, coerce<-,ObjectsWithPackage,character-method, coerce<-,signature,character-method, formula, getDLLRegisteredRoutines, glyphJust, isOpen, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
