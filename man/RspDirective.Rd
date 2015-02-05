%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDirective.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspDirective}
\docType{class}
\alias{RspDirective}


\title{The abstract RspDirective class}

\description{
 Package:  R.rsp \cr
\bold{Class RspDirective}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{RspDirective}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspCopyDirective}, \link[R.rsp]{RspCutDirective}, \link[R.rsp]{RspElseDirective}, \link[R.rsp]{RspEndcopyDirective}, \link[R.rsp]{RspEndcutDirective}, \link[R.rsp]{RspEndifDirective}, \link[R.rsp]{RspErrorDirective}, \link[R.rsp]{RspEvalDirective}, \link[R.rsp]{RspIfDirective}, \link[R.rsp]{RspIfeqDirective}, \link[R.rsp]{RspIfneqDirective}, \link[R.rsp]{RspIncludeDirective}, \link[R.rsp]{RspIntegerDirective}, \link[R.rsp]{RspLogicalDirective}, \link[R.rsp]{RspMetaDirective}, \link[R.rsp]{RspNumericDirective}, \link[R.rsp]{RspPageDirective}, \link[R.rsp]{RspPasteDirective}, \link[R.rsp]{RspStringDirective}, \link[R.rsp]{RspUnknownDirective}, \link[R.rsp]{RspUnparsedDirective}, \link[R.rsp]{RspVariableDirective}\cr

public class \bold{RspDirective}\cr
extends \link[R.rsp]{RspConstruct}\cr



 An RspDirective is an \code{\link{RspConstruct}} that represents an
 RSP preprocesing directive of format \code{<\%@ ... \%>}.
 The directive is independent of the underlying programming language.
}

\usage{
RspDirective(value=character(), ...)
}

\arguments{
  \item{value}{A \code{\link[base]{character}} string.}
  \item{...}{Arguments passed to the constructor of \code{\link{RspConstruct}}.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{asRspString} \tab  -\cr
 \tab \code{getNameContentDefaultAttributes} \tab  -\cr
 \tab \code{\link[R.rsp:requireAttributes.RspDirective]{requireAttributes}} \tab Asserts that certain attributes exist.\cr
}


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
