%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspExpression.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspIncludeDirective}
\docType{class}
\alias{RspIncludeDirective}


 \title{The RspIncludeDirective class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspIncludeDirective}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspExpression}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspDirective}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{RspIncludeDirective}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspIncludeDirective}\cr
extends \link[R.rsp]{RspDirective}\cr



  An RspIncludeDirective is an \code{\link{RspDirective}} that causes the
  RSP parser to include (and parse) an external RSP file.
 }

 \usage{RspIncludeDirective(attributes=list(), ...)}

 \arguments{
   \item{attributes}{A named \code{\link[base]{list}}, which must contain a 'file' element.}
   \item{...}{Optional arguments passed to the constructor
              of \code{\link{RspDirective}}.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:getFile.RspIncludeDirective]{getFile}} \tab Gets the file attribute.\cr
}


 \bold{Methods inherited from RspExpression}:\cr
getAttributes

 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}


\keyword{classes}
\keyword{internal}
