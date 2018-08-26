%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspComment.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspComment}
\docType{class}
\alias{RspComment}


\title{The RspComment class}

\description{
 Package:  R.rsp \cr
\bold{Class RspComment}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{RspComment}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspComment}\cr
extends \link[R.rsp]{RspConstruct}\cr



 An RspComment is an \code{\link{RspConstruct}} that represents an RSP comment,
 which are of format \code{<\%-- ... --\%>}, \code{<\%--- ... ---\%>}
 and so on.  They can also be so called "empty" RSP comments of format
 \code{<\%-\%>}, \code{<\%--\%>}, \code{<\%---\%>} and so on.
}

\usage{
RspComment(str=character(), ...)
}

\arguments{
  \item{str}{A \code{\link[base]{character}} string.}
  \item{...}{Not used.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{asRspString} \tab  -\cr
 \tab \code{\link[R.rsp:getComment.RspComment]{getComment}} \tab Gets the comment.\cr
}


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
