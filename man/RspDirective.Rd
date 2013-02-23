%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDirective.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspDirective}
\docType{class}
\alias{RspDirective}


 \title{The abstract RspDirective class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspDirective}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{RspDirective}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspDefineDirective}, \link[R.rsp]{RspElseDirective}, \link[R.rsp]{RspEndifDirective}, \link[R.rsp]{RspEvalDirective}, \link[R.rsp]{RspIfDirective}, \link[R.rsp]{RspIfeqDirective}, \link[R.rsp]{RspIfneqDirective}, \link[R.rsp]{RspIncludeDirective}, \link[R.rsp]{RspPageDirective}, \link[R.rsp]{RspUnknownDirective}, \link[R.rsp]{RspUnparsedDirective}\cr

public class \bold{RspDirective}\cr
extends \link[R.rsp]{RspConstruct}\cr



  An RspDirective is an \code{\link{RspConstruct}} that represents an
  RSP preprocesing directive of format \code{<\%@ ... \%>}.
  The directive is independent of the underlying programming language.
 }

 \usage{RspDirective(directive=character(), attributes=list(), ...)}

 \arguments{
   \item{directive}{A \code{\link[base]{character}} string.}
   \item{attributes}{A named \code{\link[base]{list}}.}
   \item{...}{Not used.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\emph{No methods defined}.


 \bold{Methods inherited from RspConstruct}:\cr
getAttributes, getSuffixSpecs

 \bold{Methods inherited from character}:\cr
all.equal, as.data.frame, as.Date, as.POSIXlt, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses, wrap

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}


\keyword{classes}
\keyword{internal}
