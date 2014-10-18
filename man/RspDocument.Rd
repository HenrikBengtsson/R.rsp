%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDocument.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspDocument}
\docType{class}
\alias{RspDocument}


\title{The RspDocument class}

\description{
 Package:  R.rsp \cr
\bold{Class RspDocument}\cr

\code{list}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{RspDocument}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspDocument}\cr
extends \link[R.rsp]{RspObject}\cr



 An RspDocument represents a \code{\link[base]{list}} of \code{\link{RspConstruct}}:s.
}

\usage{
RspDocument(expressions=list(), ...)
}

\arguments{
  \item{expressions}{A \code{\link[base]{list}} of \code{\link{RspConstruct}}:s and
     \code{\link{RspDocument}}:s.}
  \item{...}{Arguments passed to \code{\link{RspObject}}.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{[} \tab  -\cr
 \tab \code{[<-} \tab  -\cr
 \tab \code{asRspString} \tab  -\cr
 \tab \code{dropEmptyText} \tab  -\cr
 \tab \code{evaluate} \tab  -\cr
 \tab \code{flatten} \tab  -\cr
 \tab \code{getMetadata} \tab  -\cr
 \tab \code{getPath} \tab  -\cr
 \tab \code{getSource} \tab  -\cr
 \tab \code{getType} \tab  -\cr
 \tab \code{mergeTexts} \tab  -\cr
 \tab \code{parseCutNPasteDirectives} \tab  -\cr
 \tab \code{parseIfElseDirectives} \tab  -\cr
 \tab \code{preprocess} \tab  -\cr
 \tab \code{print} \tab  -\cr
 \tab \code{rcat} \tab  -\cr
 \tab \code{rclean} \tab  -\cr
 \tab \code{rcompile} \tab  -\cr
 \tab \code{rfile} \tab  -\cr
 \tab \code{rscript} \tab  -\cr
 \tab \code{rsource} \tab  -\cr
 \tab \code{rstring} \tab  -\cr
 \tab \code{setMetadata} \tab  -\cr
 \tab \code{subset} \tab  -\cr
 \tab \code{toR} \tab  -\cr
 \tab \code{trim} \tab  -\cr
 \tab \code{trimNonText} \tab  -\cr
}


 \bold{Methods inherited from RspObject}:\cr
getAttribute, getAttributes, hasAttribute, print, setAttribute, setAttributes

 \bold{Methods inherited from list}:\cr
all.equal, as.data.frame, attachLocally, relist, within


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
