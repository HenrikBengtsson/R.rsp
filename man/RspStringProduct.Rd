%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspStringProduct.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspStringProduct}
\docType{class}
\alias{RspStringProduct}


\title{The RspStringProduct class}

\description{
 Package:  R.rsp \cr
\bold{Class RspStringProduct}\cr

\code{logical}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspProduct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\emph{\code{RspStringProduct}}\cr

\bold{Directly known subclasses:}\cr
\cr

public abstract class \bold{RspStringProduct}\cr
extends \emph{\link[R.rsp]{RspProduct}}\cr



 An RspStringProduct is an \code{\link{RspProduct}} that represents an
 RSP product in form of a \code{\link[base]{character}} string.
}

\usage{
RspStringProduct(...)
}

\arguments{
  \item{...}{\code{\link[base]{character}} strings passed to \code{\link{RspProduct}}.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:as.character.RspStringProduct]{as.character}} \tab Returns a plain character string representation of an RSP string product.\cr
 \tab \code{print} \tab  -\cr
}


 \bold{Methods inherited from RspProduct}:\cr
findProcessor, getMetadata, getType, hasProcessor, print, process, view

 \bold{Methods inherited from RspObject}:\cr
getAttribute, getAttributes, hasAttribute, print, setAttribute, setAttributes

 \bold{Methods inherited from logical}:\cr
as.data.frame, as.raster, whichVector


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
