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
\code{~~+--}\code{\link[R.rsp]{RspObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{RspString}\cr

\bold{Directly known subclasses:}\cr
\cr

public class \bold{RspString}\cr
extends \link[R.rsp]{RspObject}\cr



 An RspString is a \code{\link[base]{character}} \code{\link[base]{vector}} with RSP markup.
}

\usage{
RspString(s=character(), ...)
}

\arguments{
  \item{s}{A \code{\link[base]{character}} \code{\link[base]{vector}}.}
  \item{...}{Arguments passed to \code{\link{RspObject}}.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:evaluate.RspString]{evaluate}} \tab Parses, translates, and evaluates the RSP string.\cr
 \tab \code{\link[R.rsp:getSource.RspString]{getSource}} \tab Gets the source reference of an RSP string.\cr
 \tab \code{\link[R.rsp:getType.RspString]{getType}} \tab Gets the type of an RSP string.\cr
 \tab \code{\link[R.rsp:nbrOfLines.RspString]{nbrOfLines}} \tab Gets the number of lines in an RSP string.\cr
 \tab \code{\link[R.rsp:parse.RspString]{parse}} \tab Parses the RSP string.\cr
 \tab \code{print} \tab  -\cr
 \tab \code{rcat} \tab  -\cr
 \tab \code{rclean} \tab  -\cr
 \tab \code{rcode} \tab  -\cr
 \tab \code{rcompile} \tab  -\cr
 \tab \code{rfile} \tab  -\cr
 \tab \code{rsource} \tab  -\cr
 \tab \code{rstring} \tab  -\cr
 \tab \code{\link[R.rsp:toR.RspString]{toR}} \tab Parses and translates the RSP string into R code.\cr
}


 \bold{Methods inherited from RspObject}:\cr
print

 \bold{Methods inherited from character}:\cr
all.equal, as.Date, as.POSIXlt, as.data.frame, as.raster, downloadFile, formula, getDLLRegisteredRoutines, isOpen, toAsciiRegExprPattern, toFileListTree, toLatex, uses


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
