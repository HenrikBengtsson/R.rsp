%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  translateRspV1.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{translateRspV1}
\alias{translateRspV1.default}
\alias{translateRspV1}

\title{Translates an RSP file to an R servlet}

\description{
 Translates an RSP file to an R servlet.
}

\usage{\method{translateRspV1}{default}(file="", text=NULL, path=getParent(file), rspLanguage=getOption("rspLanguage"), trimRsp=TRUE, verbose=FALSE, ...)}

\arguments{
  \item{file}{A filename, a URL, or a \code{\link[base:connections]{connection}} to be read.
              Ignored if \code{text} is not \code{\link[base]{NULL}}.}
  \item{text}{If specified, a \code{\link[base]{character}} \code{\link[base]{vector}} of RSP code to be
              translated.}
  \item{path}{A pathname setting the current include path.
              If \code{file} is a filename and its parent directory
              is different from this one, \code{path} is added
              to the beginning of \code{file} before the file is read.}
  \item{rspLanguage}{An \code{\link{RspLanguage}} object.}
  \item{trimRsp}{If \code{\link[base:logical]{TRUE}}, white space is trimmed from RSP blocks.}
  \item{verbose}{Either a \code{\link[base]{logical}}, a \code{\link[base]{numeric}}, or a \code{\link[R.utils]{Verbose}}
    object specifying how much verbose/debug information is written to
    standard output. If a Verbose object, how detailed the information is
    is specified by the threshold level of the object. If a numeric, the
    value is used to set the threshold of a new Verbose object. If \code{\link[base:logical]{TRUE}},
    the threshold is set to -1 (minimal). If \code{\link[base:logical]{FALSE}}, no output is written.
    [Currently not used.]
  }
  \item{...}{Not used.}
}

\value{
  Returns a \code{\link[base]{character}} string of \R source code.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  \code{\link{sourceRsp}}().
}



\keyword{file}
\keyword{IO}
