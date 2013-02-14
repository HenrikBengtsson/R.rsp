%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspArtifact.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspArtifact}
\docType{class}
\alias{RspArtifact}


 \title{The RspArtifact class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspArtifact}\cr

\code{logical}\cr
\code{~~|}\cr
\code{~~+--}\code{RspArtifact}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspFileArtifact}\cr

public class \bold{RspArtifact}\cr
extends logical\cr



  An RspArtifact object represents an RSP artifact produced by processing
  an RSP document.
 }

 \usage{RspArtifact(object=NA, type=attr(object, "type"), ...)}

 \arguments{
   \item{object}{The RSP artifact.}
   \item{type}{The content type of the RSP artifact.}
   \item{...}{Not used.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:findProcessor.RspArtifact]{findProcessor}} \tab Tries to locate a postprocessor for an RSP artifact.\cr
 \tab \code{\link[R.rsp:getType.RspArtifact]{getType}} \tab Gets the type of an RSP artifact.\cr
 \tab \code{\link[R.rsp:hasProcessor.RspArtifact]{hasProcessor}} \tab Checks whether a postprocessor exist or not for an RSP artifact.\cr
 \tab \code{\link[R.rsp:postprocess.RspArtifact]{postprocess}} \tab Postprocesses an RSP artifact.\cr
 \tab \code{\link[R.rsp:print.RspArtifact]{print}} \tab Prints a summary of an RSP artifact.\cr
}


 \bold{Methods inherited from logical}:\cr
as.data.frame, as.raster, whichVector

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}
\keyword{classes}
