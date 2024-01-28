%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspConstruct.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspConstruct}
\docType{class}
\alias{RspConstruct}


\title{The RspConstruct class}

\description{
 Package:  R.rsp \cr
\bold{Class RspConstruct}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{RspConstruct}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspCode}, \link[R.rsp]{RspCodeChunk}, \link[R.rsp]{RspComment}, \link[R.rsp]{RspCopyDirective}, \link[R.rsp]{RspCutDirective}, \link[R.rsp]{RspDirective}, \link[R.rsp]{RspElseDirective}, \link[R.rsp]{RspEndcopyDirective}, \link[R.rsp]{RspEndcutDirective}, \link[R.rsp]{RspEndifDirective}, \link[R.rsp]{RspErrorDirective}, \link[R.rsp]{RspEvalDirective}, \link[R.rsp]{RspExpression}, \link[R.rsp]{RspIfDirective}, \link[R.rsp]{RspIfeqDirective}, \link[R.rsp]{RspIfneqDirective}, \link[R.rsp]{RspIncludeDirective}, \link[R.rsp]{RspIntegerDirective}, \link[R.rsp]{RspLogicalDirective}, \link[R.rsp]{RspMetaDirective}, \link[R.rsp]{RspNumericDirective}, \link[R.rsp]{RspPageDirective}, \link[R.rsp]{RspPasteDirective}, \link[R.rsp]{RspStringDirective}, \link[R.rsp]{RspText}, \link[R.rsp]{RspUnknownDirective}, \link[R.rsp]{RspUnparsedDirective}, \link[R.rsp]{RspUnparsedExpression}, \link[R.rsp]{RspVariableDirective}, \link[R.rsp]{RspVoid}\cr

public class \bold{RspConstruct}\cr
extends \link[R.rsp]{RspObject}\cr



 An RspConstruct object represents an RSP construct, which can either be
 (i) an RSP text (a plain text section), (ii) an RSP comment,
 (iii) an RSP preprocessing directive, or (iv) an RSP expression.
}

\usage{
RspConstruct(object=character(), ..., comment=NULL)
}

\arguments{
  \item{object}{A R object.}
  \item{...}{Arguments passed to \code{\link{RspObject}}.}
  \item{comment}{An optional \code{\link[base]{character}} string.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:asRspString.RspConstruct]{asRspString}} \tab Recreates an RSP string from an RspConstruct.\cr
 \tab \code{\link[R.rsp:getComment.RspConstruct]{getComment}} \tab Gets the comment of an RSP construct.\cr
 \tab \code{\link[R.rsp:getInclude.RspConstruct]{getInclude}} \tab Checks whether an RSP construct will include text to the output or not.\cr
 \tab \code{\link[R.rsp:getSuffixSpecs.RspConstruct]{getSuffixSpecs}} \tab Gets the suffix specifications.\cr
}


 \bold{Methods inherited from RspObject}:\cr
print

 \bold{Methods inherited from character}:\cr
Ops,nonStructure,vector-method, Ops,structure,vector-method, Ops,vector,nonStructure-method, Ops,vector,structure-method, all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, coerce,ANY,character-method, coerce,character,SuperClassMethod-method, coerce,character,signature-method, coerce<-,ObjectsWithPackage,character-method, coerce<-,signature,character-method, formula, getDLLRegisteredRoutines, glyphJust, isOpen, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
