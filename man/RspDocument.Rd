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
\code{~~+--}\code{RspDocument}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspDocument}\cr
extends list\cr



  An RspDocument represents a \code{\link[base]{list}} of \code{\link{RspExpression}}:s.
 }

 \usage{RspDocument(expressions=list(), ...)}

 \arguments{
   \item{expressions}{A \code{\link[base]{list}} of \code{\link{RspExpression}}:s.}
   \item{...}{Not used.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:evaluate.RspDocument]{evaluate}} \tab Parses, translates, and evaluates the RSP document.\cr
 \tab \code{rstring} \tab  -\cr
 \tab \code{\link[R.rsp:toR.RspDocument]{toR}} \tab Translates the RSP document into R source code.\cr
 \tab \code{\link[R.rsp:trim.RspDocument]{trim}} \tab Trims each of the RSP expressions.\cr
}


 \bold{Methods inherited from list}:\cr
all.equal, as.data.frame, attachLocally, callHooks, relist, within, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}
\keyword{classes}
