%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspObject.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspObject}
\docType{class}
\alias{RspObject}


\title{The abstract RspObject class}

\description{
 Package:  R.rsp \cr
\bold{Class RspObject}\cr

\code{logical}\cr
\code{~~|}\cr
\code{~~+--}\code{RspObject}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspCode}, \link[R.rsp]{RspCodeChunk}, \link[R.rsp]{RspComment}, \link[R.rsp]{RspConstruct}, \link[R.rsp]{RspDirective}, \link[R.rsp]{RspDocument}, \link[R.rsp]{RspElseDirective}, \link[R.rsp]{RspEndifDirective}, \link[R.rsp]{RspErrorDirective}, \link[R.rsp]{RspEvalDirective}, \link[R.rsp]{RspExpression}, \link[R.rsp]{RspFileProduct}, \link[R.rsp]{RspIfDirective}, \link[R.rsp]{RspIfeqDirective}, \link[R.rsp]{RspIfneqDirective}, \link[R.rsp]{RspIncludeDirective}, \link[R.rsp]{RspIntegerDirective}, \link[R.rsp]{RspLogicalDirective}, \link[R.rsp]{RspMetaDirective}, \link[R.rsp]{RspNumericDirective}, \link[R.rsp]{RspPageDirective}, \emph{\link[R.rsp]{RspProduct}}, \emph{\link[R.rsp]{RspRSourceCode}}, \emph{\link[R.rsp]{RspShSourceCode}}, \emph{\link[R.rsp]{RspSourceCode}}, \link[R.rsp]{RspString}, \link[R.rsp]{RspStringDirective}, \emph{\link[R.rsp]{RspStringProduct}}, \link[R.rsp]{RspText}, \link[R.rsp]{RspUnknownDirective}, \link[R.rsp]{RspUnparsedDirective}, \link[R.rsp]{RspUnparsedExpression}, \link[R.rsp]{RspVariableDirective}\cr

public class \bold{RspObject}\cr
extends logical\cr



 An RspObject represents an instance a specific RSP class.
}

\usage{
RspObject(value=NA, attrs=list(), ...)
}

\arguments{
  \item{value}{An R object.}
  \item{attrs}{RSP attributes as a named \code{\link[base]{list}}, e.g. \code{type},
     \code{language}, and \code{source}.}
  \item{...}{Additional named RSP attributes.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{getAttribute} \tab  -\cr
 \tab \code{\link[R.rsp:getAttributes.RspObject]{getAttributes}} \tab Gets the attributes of an RSP object.\cr
 \tab \code{hasAttribute} \tab  -\cr
 \tab \code{\link[R.rsp:print.RspObject]{print}} \tab Prints a summary of an RSP object.\cr
 \tab \code{setAttribute} \tab  -\cr
 \tab \code{setAttributes} \tab  -\cr
}


 \bold{Methods inherited from logical}:\cr
as.data.frame, as.raster, whichVector


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
