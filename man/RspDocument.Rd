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

 \usage{RspDocument(expressions=list(), type=NA, source=NA, ...)}

 \arguments{
   \item{expressions}{A \code{\link[base]{list}} of \code{\link{RspExpression}}:s and
      \code{\link{RspDocument}}:s.}
   \item{type}{The content type of the RSP document.}
   \item{source}{A reference to the source RSP document, iff any.}
   \item{...}{Not used.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{[} \tab  -\cr
 \tab \code{\link[R.rsp:asRspString.RspDocument]{asRspString}} \tab Recreates an RSP string from an RspDocument.\cr
 \tab \code{\link[R.rsp:evaluate.RspDocument]{evaluate}} \tab Parses, translates, and evaluates the RSP document.\cr
 \tab \code{\link[R.rsp:flatten.RspDocument]{flatten}} \tab Flattens an RspDocument.\cr
 \tab \code{\link[R.rsp:getPath.RspDocument]{getPath}} \tab Gets the path to the source reference of an RSP string.\cr
 \tab \code{\link[R.rsp:getSource.RspDocument]{getSource}} \tab Gets the source reference of an RSP document.\cr
 \tab \code{\link[R.rsp:getType.RspDocument]{getType}} \tab Gets the type of the RspDocument.\cr
 \tab \code{\link[R.rsp:mergeTexts.RspDocument]{mergeTexts}} \tab Merge neighboring 'text' elements.\cr
 \tab \code{\link[R.rsp:preprocess.RspDocument]{preprocess}} \tab Processes all RSP preprocessing directives.\cr
 \tab \code{\link[R.rsp:print.RspDocument]{print}} \tab Prints a summary of an RspDocument.\cr
 \tab \code{rcat} \tab  -\cr
 \tab \code{rstring} \tab  -\cr
 \tab \code{\link[R.rsp:subset.RspDocument]{subset}} \tab Subsets an RspDocument.\cr
 \tab \code{\link[R.rsp:toR.RspDocument]{toR}} \tab Translates the RSP document into R source code.\cr
 \tab \code{\link[R.rsp:trim.RspDocument]{trim}} \tab Trims each of the RSP constructs.\cr
}


 \bold{Methods inherited from list}:\cr
all.equal, as.data.frame, attachLocally, callHooks, relist, within, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}


\keyword{classes}
\keyword{internal}
