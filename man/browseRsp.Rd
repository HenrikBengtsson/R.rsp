%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  browseRsp.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{browseRsp}
\alias{browseRsp.default}
\alias{browseRsp}
\alias{browseRsp.Package}

\title{Starts the internal web browser and opens the URL in the default web browser}

\description{
 Starts the internal web browser and opens the URL in the default web browser.
 From this page you access not only help pages and demos on how to use
 RSP, but also other package RSP pages.
}

\usage{\method{browseRsp}{default}(url=sprintf("http://\%s:\%d/\%s", host, port, path), host="127.0.0.1", port=8074, path="", start=TRUE, stop=FALSE, ...)}

\arguments{
  \item{url}{A \code{\link[base]{character}} string for the URL to be viewed.
    By default the URL is constructed from the \code{host}, \code{port},
    and the \code{path} parameters.
  }
  \item{host}{An optional \code{\link[base]{character}} string for the host of the URL.}
  \item{port}{An optional \code{\link[base]{integer}} for the port of the URL.}
  \item{path}{An optional \code{\link[base]{character}} string for the context path of the URL.}
  \item{start}{If \code{\link[base:logical]{TRUE}}, the internal \R web server is started if not
    already started, otherwise not.}
  \item{stop}{If \code{\link[base:logical]{TRUE}}, the internal \R web server is stopped, if started.}
  \item{...}{Additional arguments passed to \code{\link[utils]{browseURL}}.}
}

\value{
  Returns nothing.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  Internally, \code{\link[utils]{browseURL}} is used to launch the browser.
}



\keyword{file}
\keyword{IO}
