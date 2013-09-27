%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspException.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RspException}
\docType{class}
\alias{RspException}

\alias{RspParseException}
\alias{RspPreprocessingException}

\title{The RspException class}

\description{
 Package:  R.rsp \cr
\bold{Class RspException}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{try-error}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{condition}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{error}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{simpleError}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~+--}\code{\link[R.oo]{Exception}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~+--}\code{RspException}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspParseException}, \link[R.rsp]{RspPreprocessingException}\cr

public static class \bold{RspException}\cr
extends \link[R.oo]{Exception}\cr



 An RspException is an \code{\link[R.oo]{Exception}} that is thrown during
 the processing of an RSP document.
}

\usage{
RspException(...)
}

\arguments{
  \item{...}{Not used.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{as.character} \tab  -\cr
}


 \bold{Methods inherited from Exception}:\cr
as.character, getCall, getCalls, getLastException, getMessage, getStackTrace, getWhen, print, printStackTrace, throw

 \bold{Methods inherited from error}:\cr
as.character, throw

 \bold{Methods inherited from condition}:\cr
abort, as.character, conditionCall, conditionMessage, print

 \bold{Methods inherited from Object}:\cr
$, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clearLookupCache, clone, detach, equals, extend, finalize, gc, getEnvironment, getFieldModifier, getFieldModifiers, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, save


}

\author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
