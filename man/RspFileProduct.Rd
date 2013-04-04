%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspFileProduct.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspFileProduct}
\docType{class}
\alias{RspFileProduct}


\title{The RspFileProduct class}

\description{
 Package:  R.rsp \cr
\bold{Class RspFileProduct}\cr

\code{logical}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspProduct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{RspFileProduct}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspFileProduct}\cr
extends \emph{\link[R.rsp]{RspProduct}}\cr



 An RspFileProduct is an \code{\link{RspProduct}} that represents an
 RSP product in form of a file, e.g. LaTeX, Sweave and knitr documents.
}

\usage{
RspFileProduct(pathname=NA, ..., mustExist=TRUE)
}

\arguments{
  \item{pathname}{An existing file.}
  \item{...}{Additional arguments passed to \code{\link{RspProduct}}.}
  \item{mustExist}{If \code{\link[base:logical]{TRUE}}, it is asserted that the file exists.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{findProcessor} \tab  -\cr
 \tab \code{getType} \tab  -\cr
 \tab \code{print} \tab  -\cr
 \tab \code{view} \tab  -\cr
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
