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



  An RspDocument represents a \code{\link[base]{list}} of \code{\link{RspConstruct}}:s.
 }

 \usage{
RspDocument(expressions=list(), attrs=list(), ...)
}

 \arguments{
   \item{expressions}{A \code{\link[base]{list}} of \code{\link{RspConstruct}}:s and
      \code{\link{RspDocument}}:s.}
   \item{attrs}{RSP attributes as a named \code{\link[base]{list}}, e.g. \code{type},
      \code{language}, and \code{source}.}
   \item{...}{Additional named RSP attributes.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{[} \tab  -\cr
 \tab \code{[<-} \tab  -\cr
 \tab \code{\link[R.rsp:asRspString.RspDocument]{asRspString}} \tab Recreates an RSP string from an RspDocument.\cr
 \tab \code{\link[R.rsp:dropEmptyText.RspDocument]{dropEmptyText}} \tab Drops all empty RSP text constructs.\cr
 \tab \code{\link[R.rsp:evaluate.RspDocument]{evaluate}} \tab Parses, translates, and evaluates the RSP document.\cr
 \tab \code{\link[R.rsp:flatten.RspDocument]{flatten}} \tab Flattens an RspDocument.\cr
 \tab \code{getAttribute} \tab  -\cr
 \tab \code{\link[R.rsp:getAttributes.RspDocument]{getAttributes}} \tab Gets the attributes of an RSP document.\cr
 \tab \code{\link[R.rsp:getMetadata.RspDocument]{getMetadata}} \tab Gets the metadata of the RspDocument.\cr
 \tab \code{\link[R.rsp:getPath.RspDocument]{getPath}} \tab Gets the path to the source reference of an RSP string.\cr
 \tab \code{\link[R.rsp:getSource.RspDocument]{getSource}} \tab Gets the source reference of an RSP document.\cr
 \tab \code{\link[R.rsp:getType.RspDocument]{getType}} \tab Gets the type of the RspDocument.\cr
 \tab \code{\link[R.rsp:mergeTexts.RspDocument]{mergeTexts}} \tab Merge neighboring 'text' elements.\cr
 \tab \code{parseIfElseDirectives} \tab  -\cr
 \tab \code{\link[R.rsp:preprocess.RspDocument]{preprocess}} \tab Processes all RSP preprocessing directives.\cr
 \tab \code{\link[R.rsp:print.RspDocument]{print}} \tab Prints a summary of an RspDocument.\cr
 \tab \code{rcat} \tab  -\cr
 \tab \code{rcompile} \tab  -\cr
 \tab \code{rscript} \tab  -\cr
 \tab \code{rstring} \tab  -\cr
 \tab \code{setAttribute} \tab  -\cr
 \tab \code{setAttributes} \tab  -\cr
 \tab \code{\link[R.rsp:subset.RspDocument]{subset}} \tab Subsets an RspDocument.\cr
 \tab \code{\link[R.rsp:toR.RspDocument]{toR}} \tab Translates the RSP document into R source code.\cr
 \tab \code{\link[R.rsp:trim.RspDocument]{trim}} \tab Trims each of the RSP constructs.\cr
 \tab \code{\link[R.rsp:trimNonText.RspDocument]{trimNonText}} \tab Trims all non-text RSP constructs.\cr
}


 \bold{Methods inherited from list}:\cr
all.equal, as.data.frame, attachLocally, callHooks, relist, within, wrap

 }

 \author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
