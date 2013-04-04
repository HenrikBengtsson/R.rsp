%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDirective,VARIABLES.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspVariableDirective}
\docType{class}
\alias{RspVariableDirective}

\alias{RspStringDirective}
\alias{RspNumericDirective}
\alias{RspIntegerDirective}
\alias{RspLogicalDirective}

\title{The RspVariableDirective class}

\description{
 Package:  R.rsp \cr
\bold{Class RspVariableDirective}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[R.rsp]{RspDirective}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{RspVariableDirective}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspIntegerDirective}, \link[R.rsp]{RspLogicalDirective}, \link[R.rsp]{RspMetaDirective}, \link[R.rsp]{RspNumericDirective}, \link[R.rsp]{RspStringDirective}\cr

public class \bold{RspVariableDirective}\cr
extends \link[R.rsp]{RspDirective}\cr



 An RspVariableDirective is an \code{\link{RspDirective}} that causes the
 RSP parser to assign the value of an attribute to an R object of
 the same name as the attribute at the time of parsing.
}

\usage{
RspVariableDirective(value="variable", ...)
}

\arguments{
  \item{value}{A \code{\link[base]{character}} string.}
  \item{...}{Arguments passed to the constructor of \code{\link{RspDirective}}.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{getInclude} \tab  -\cr
}


 \bold{Methods inherited from RspDirective}:\cr
asRspString, getNameContentDefaultAttributes, requireAttributes

 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getComment, getInclude, getSuffixSpecs

 \bold{Methods inherited from RspObject}:\cr
getAttribute, getAttributes, hasAttribute, print, setAttribute, setAttributes

 \bold{Methods inherited from character}:\cr
all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
