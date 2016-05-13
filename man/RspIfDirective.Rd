%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDirective,IF-THEN-ELSE.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspIfDirective}
\docType{class}
\alias{RspIfDirective}

\alias{RspElseDirective}
\alias{RspEndifDirective}
\alias{RspIfdefDirective}
\alias{RspIfndefDirective}
\alias{RspIfeqDirective}
\alias{RspIfneqDirective}

\title{The RspIfDirective class}

\description{
 Package:  R.rsp \cr
\bold{Class RspIfDirective}\cr

\code{character}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.rsp]{RspConstruct}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[R.rsp]{RspDirective}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{RspIfDirective}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspIfeqDirective}, \link[R.rsp]{RspIfneqDirective}\cr

public class \bold{RspIfDirective}\cr
extends \link[R.rsp]{RspDirective}\cr



 An RspIfDirective is an \code{\link{RspDirective}} that will include or
 exclude all \code{\link{RspConstruct}}:s until the next \code{\link{RspEndifDirective}}
 based on the preprocessing value of the particular if clause.
 Inclusion/exclusion can be reversed via an \code{\link{RspElseDirective}}.
}

\usage{
RspIfDirective(value="if", ...)
}

\arguments{
  \item{value}{A \code{\link[base]{character}} string.}
  \item{...}{Arguments passed to the constructor of \code{\link{RspDirective}}.}
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
