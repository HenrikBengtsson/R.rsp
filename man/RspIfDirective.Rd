%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspExpression.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspIfDirective}
\docType{class}
\alias{RspIfDirective}

 \alias{RspIfeqDirective}
 \alias{RspIfneqDirective}
 \alias{RspElseDirective}
 \alias{RspEndifDirective}

 \title{The RspIfeqDirective class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspIfDirective}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspExpression}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspDirective}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{RspIfDirective}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspIfeqDirective}, \link[R.rsp]{RspIfneqDirective}\cr

public class \bold{RspIfDirective}\cr
extends \link[R.rsp]{RspDirective}\cr



  An RspIfDirective is an \code{\link{RspDirective}} that will include or
  exclude all \code{\link{RspExpression}} until the next \code{\link{RspEndifDirective}}
  based on the preprocessing value of the particular if clause.
  Inclusiion/exclusion can be reverse via an \code{\link{RspElseDirective}}.
 }

 \usage{RspIfDirective(...)}

 \arguments{
   \item{...}{Arguments passed to the constructor of \code{\link{RspDirective}}.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\emph{No methods defined}.


 \bold{Methods inherited from RspExpression}:\cr
getAttributes

 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}


\keyword{classes}
\keyword{internal}
