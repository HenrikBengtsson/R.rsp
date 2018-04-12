%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  FileRspResponse.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{FileRspResponse}
\docType{class}
\alias{FileRspResponse}


\title{The FileRspResponse class}

\description{
 Package:  R.rsp \cr
\bold{Class FileRspResponse}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.rsp]{RspResponse}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{FileRspResponse}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{HttpDaemonRspResponse}\cr

public static class \bold{FileRspResponse}\cr
extends \emph{\link[R.rsp]{RspResponse}}\cr


}

\usage{
FileRspResponse(file=stdout(), path=NULL, overwrite=FALSE, ...)
}

\arguments{
  \item{file}{A filename or a \code{\link[base:connections]{connection}} to write responses to.}
  \item{path}{An optional path to the file.}
  \item{overwrite}{If \code{\link[base:logical]{FALSE}}, an error is thrown if the output file already
    exists, otherwise not.}
  \item{...}{Not used.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{flush} \tab  -\cr
 \tab \code{\link[R.rsp:getAbsolutePath.FileRspResponse]{getAbsolutePath}} \tab Gets the absolute pathname to the current RSP file.\cr
 \tab \code{\link[R.rsp:getName.FileRspResponse]{getName}} \tab Gets the (base)name of the current RSP file.\cr
 \tab \code{\link[R.rsp:getOutput.FileRspResponse]{getOutput}} \tab Gets the output for an RSP response.\cr
 \tab \code{\link[R.rsp:getPath.FileRspResponse]{getPath}} \tab Gets the path of the directory of the current RSP file.\cr
 \tab \code{writeResponse} \tab  -\cr
}


 \bold{Methods inherited from RspResponse}:\cr
flush, writeResponse

 \bold{Methods inherited from Object}:\cr
$, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clearLookupCache, clone, detach, equals, extend, finalize, getEnvironment, getFieldModifier, getFieldModifiers, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, names, objectSize, print, save


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
