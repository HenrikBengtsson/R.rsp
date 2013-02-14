%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspArtifact.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspFileArtifact}
\docType{class}
\alias{RspFileArtifact}


 \title{The RspFileArtifact class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspFileArtifact}\cr

\code{logical}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspArtifact}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{RspFileArtifact}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspFileArtifact}\cr
extends \link[R.rsp]{RspArtifact}\cr



  An RspFileArtifact is an \code{\link{RspFileArtifact}} that represents an
  RSP file artifact, e.g. LaTeX, Sweave and knitr documents.
 }

 \usage{RspFileArtifact(pathname=NA, ...)}

 \arguments{
   \item{pathname}{An existing file.}
   \item{...}{Additional arguments pass to \code{\link{RspArtifact}}.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:getType.RspFileArtifact]{getType}} \tab Gets the type of an RSP file artifact.\cr
 \tab \code{\link[R.rsp:postprocess.RspFileArtifact]{postprocess}} \tab Postprocesses an RSP file artifact.\cr
 \tab \code{\link[R.rsp:print.RspFileArtifact]{print}} \tab Prints a summary of an RSP file artifact.\cr
}


 \bold{Methods inherited from RspArtifact}:\cr
findProcessor, getType, hasProcessor, postprocess, print

 \bold{Methods inherited from logical}:\cr
as.data.frame, as.raster, whichVector

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}
\keyword{classes}
