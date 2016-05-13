%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDirective,COPY-PASTE.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspCutDirective}
\docType{class}
\alias{RspCutDirective}

\alias{RspEndcutDirective}
\alias{RspCopyDirective}
\alias{RspEndcopyDirective}
\alias{RspPasteDirective}

\title{The RspCopyDirective class}

\description{
 Package:  R.rsp \cr
\bold{Class RspCutDirective}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[R.rsp]{RspDirective}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{RspCutDirective}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspCopyDirective}\cr

public class \bold{RspCutDirective}\cr
extends \link[R.rsp]{RspDirective}\cr



 An RspCutDirective and RspPasteDirective are
 \code{\link{RspDirective}} that will copy, cut, and paste a set of
 \code{\link{RspConstruct}}:s.
}

\usage{
RspCutDirective(value="cut", ..., .validate=TRUE)
}

\arguments{
  \item{value}{A \code{\link[base]{character}} string.}
  \item{...}{Additional arguments passed to \code{\link{RspDirective}}.}
  \item{.validate}{A \code{\link[base]{logical}} specifying whether the attributes should
   be validated or not.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\emph{No methods defined}.


 \bold{Methods inherited from RspDirective}:\cr
asRspString, getNameContentDefaultAttributes, requireAttributes

 \bold{Methods inherited from RspConstruct}:\cr
asRspString, getComment, getInclude, getSuffixSpecs

 \bold{Methods inherited from RspObject}:\cr
print

 \bold{Methods inherited from character}:\cr
all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
