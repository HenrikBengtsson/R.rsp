%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpRequest.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{HttpRequest}
\docType{class}
\alias{HttpRequest}


\title{The HttpRequest class}

\description{
 Package:  R.rsp \cr
\bold{Class HttpRequest}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{HttpRequest}\cr

\bold{Directly known subclasses:}\cr
\cr

public static class \bold{HttpRequest}\cr
extends \link[R.oo]{Object}\cr


}

\usage{
HttpRequest(requestUri=NULL, parameters=list(), ...)
}

\arguments{
  \item{requestUri}{A \code{\link[base]{character}} string of the requested URI.}
  \item{parameters}{A named \code{\link[base]{list}} of parameter values.}
  \item{...}{Not used.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[R.rsp:as.character.HttpRequest]{as.character}} \tab Returns a short string describing the HTTP request.\cr
 \tab \code{\link[R.rsp:getContentLength.HttpRequest]{getContentLength}} \tab Gets the length of contents.\cr
 \tab \code{\link[R.rsp:getContentType.HttpRequest]{getContentType}} \tab Gets the MIME type of the body of the request.\cr
 \tab \code{getContextPath} \tab  -\cr
 \tab \code{getDateHeader} \tab  -\cr
 \tab \code{getHeader} \tab  -\cr
 \tab \code{\link[R.rsp:getParameter.HttpRequest]{getParameter}} \tab Gets a parameter.\cr
 \tab \code{\link[R.rsp:getParameters.HttpRequest]{getParameters}} \tab Gets all parameters.\cr
 \tab \code{\link[R.rsp:getProtocol.HttpRequest]{getProtocol}} \tab Gets the name and version of the protocol used to make this request.\cr
 \tab \code{getQueryString} \tab  -\cr
 \tab \code{\link[R.rsp:getRealPath.HttpRequest]{getRealPath}} \tab Gets the file system path for a given URI.\cr
 \tab \code{\link[R.rsp:getRemoteAddress.HttpRequest]{getRemoteAddress}} \tab Gets the IP address of the client that sent the request.\cr
 \tab \code{\link[R.rsp:getRemoteHost.HttpRequest]{getRemoteHost}} \tab Gets the fully qualified name of the client that sent the request.\cr
 \tab \code{getRemoteUser} \tab  -\cr
 \tab \code{getRequestUri} \tab  -\cr
 \tab \code{getRequestUrl} \tab  -\cr
 \tab \code{\link[R.rsp:getScheme.HttpRequest]{getScheme}} \tab Gets the scheme used to make this request.\cr
 \tab \code{\link[R.rsp:getServerName.HttpRequest]{getServerName}} \tab Gets the host name of the server that revieved the request.\cr
 \tab \code{\link[R.rsp:getServerPort.HttpRequest]{getServerPort}} \tab Gets the port number on which this request was received.\cr
 \tab \code{getServletPath} \tab  -\cr
 \tab \code{\link[R.rsp:hasParameter.HttpRequest]{hasParameter}} \tab Checks if a parameter exists.\cr
 \tab \code{\link[R.rsp:nbrOfParameters.HttpRequest]{nbrOfParameters}} \tab Gets the number of parameters.\cr
}


 \bold{Methods inherited from Object}:\cr
$, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clearLookupCache, clone, detach, equals, extend, finalize, gc, getEnvironment, getFieldModifier, getFieldModifiers, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, save


}

\author{Henrik Bengtsson}

\keyword{classes}
\keyword{internal}
