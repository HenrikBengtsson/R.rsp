%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspLanguage.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspLanguage}
\docType{class}
\alias{RspLanguage}


 \title{The RspLanguage class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspLanguage}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{RspLanguage}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{HtmlRspLanguage}\cr

public static class \bold{RspLanguage}\cr
extends \link[R.oo]{Object}\cr



  An RspLanguage object specifies what the markup language of the
  response/output document is, e.g. plain text and HTML.
  The RspLanguage class provides methods to obtain language specific
  strings/output such as how newlines and comments are written.
  The RspLanguage class describes a plain text languages.  For HTML
  see the \code{\link{HtmlRspLanguage}} subclass.
 }

 \usage{RspLanguage(language="plain", ...)}

 \arguments{
   \item{language}{A \code{\link[base]{character}} string.}
   \item{...}{Not used.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:escape.RspLanguage]{escape}} \tab Escapes a string specifically for a given RSP response language.\cr
 \tab \code{\link[R.rsp:getComment.RspLanguage]{getComment}} \tab Gets a comment string specific for a given RSP response language.\cr
 \tab \code{\link[R.rsp:getLanguage.RspLanguage]{getLanguage}} \tab Gets the language string.\cr
 \tab \code{\link[R.rsp:getNewline.RspLanguage]{getNewline}} \tab Gets the newline string specific for a given RSP response language.\cr
 \tab \code{\link[R.rsp:getVerbatim.RspLanguage]{getVerbatim}} \tab Gets a verbatim string specific for a given RSP response language.\cr
}


 \bold{Methods inherited from Object}:\cr
$, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clone, detach, equals, extend, finalize, gc, getEnvironment, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, registerFinalizer, save

 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}
\keyword{classes}
