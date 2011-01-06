%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspResponse.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspResponse}
\docType{class}
\alias{RspResponse}


 \title{The RspResponse class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspResponse}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\emph{\code{RspResponse}}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{FileRspResponse}, \link[R.rsp]{HttpDaemonRspResponse}\cr

public abstract static class \bold{RspResponse}\cr
extends \link[R.oo]{Object}\cr



  An abstract class that provides basic methods to write and flush output to
  the generated document.
 }

 \usage{RspResponse(...)}

 \arguments{
   \item{...}{Not used.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:flush.RspResponse]{flush}} \tab Flushes the response buffer.\cr
 \tab \code{\link[R.rsp:import.RspResponse]{import}} \tab Imports the output from another RSP file.\cr
 \tab \code{\link[R.rsp:write.RspResponse]{write}} \tab Writes an RSP response to the predefined output file.\cr
}


 \bold{Methods inherited from Object}:\cr
$, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clone, detach, equals, extend, finalize, gc, getEnvironment, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, registerFinalizer, save

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}
\keyword{classes}
