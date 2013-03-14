%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspString.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspString}
\docType{class}
\alias{RspString}


 \title{The RspString class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspString}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{RspString}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspString}\cr
extends character\cr



  An RspString is a \code{\link[base]{character}} \code{\link[base]{vector}} with RSP markup.
 }

 \usage{
RspString(s=character(), attrs=list(), ...)
}

 \arguments{
   \item{s}{A \code{\link[base]{character}} \code{\link[base]{vector}}.}
   \item{attrs}{RSP attributes as a named \code{\link[base]{list}}, e.g. \code{type},
      \code{language}, and \code{source}.}
   \item{...}{Additional named RSP attributes.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:evaluate.RspString]{evaluate}} \tab Parses, translates, and evaluates the RSP string.\cr
 \tab \code{getAttribute} \tab  -\cr
 \tab \code{\link[R.rsp:getAttributes.RspString]{getAttributes}} \tab Gets the attributes of an RSP document.\cr
 \tab \code{\link[R.rsp:getMetadata.RspString]{getMetadata}} \tab Gets the metadata of the RspDocument.\cr
 \tab \code{\link[R.rsp:getSource.RspString]{getSource}} \tab Gets the source reference of an RSP string.\cr
 \tab \code{\link[R.rsp:getType.RspString]{getType}} \tab Gets the type of an RSP string.\cr
 \tab \code{\link[R.rsp:parse.RspString]{parse}} \tab Parses the RSP string.\cr
 \tab \code{rcat} \tab  -\cr
 \tab \code{rcompile} \tab  -\cr
 \tab \code{rscript} \tab  -\cr
 \tab \code{rstring} \tab  -\cr
 \tab \code{setAttribute} \tab  -\cr
 \tab \code{setAttributes} \tab  -\cr
 \tab \code{\link[R.rsp:toR.RspString]{toR}} \tab Parses and translates the RSP string into R code.\cr
}


 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
