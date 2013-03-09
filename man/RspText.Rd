%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspText.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspText}
\docType{class}
\alias{RspText}


 \title{The RspText class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspText}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{RspText}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspText}\cr
extends \link[R.rsp]{RspConstruct}\cr



  An RspText is an \code{\link{RspConstruct}} that represents a plain text
  section, i.e. everything that is inbetween any other types of
  \code{\link{RspConstruct}}:s.
  Its content is independent of the underlying programming language.
 }

 \usage{
RspText(text=character(), escape=FALSE, ...)
}

 \arguments{
   \item{text}{A \code{\link[base]{character}} string.}
   \item{escape}{If \code{\link[base:logical]{TRUE}}, character sequences \code{<\%} and \code{\%>}
                 are escaped to \code{<\%\%} and \code{\%\%>}.}
   \item{...}{Not used.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:asRspString.RspText]{asRspString}} \tab Recreates an RSP string from an RspText.\cr
 \tab \code{\link[R.rsp:getText.RspText]{getText}} \tab Gets the text.\cr
}


 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getAttribute, getAttributes, getSuffixSpecs

 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
