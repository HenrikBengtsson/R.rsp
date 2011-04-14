%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  parseRsp.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{parseRsp}
\alias{parseRsp.default}
\alias{parseRsp}

\title{Parse an RSP code string to an R RSP code string}

\description{
 Parse an RSP code string to an R RSP code string.
}

\usage{\method{parseRsp}{default}(rspCode, rspLanguage=getOption("rspLanguage"), trimRsp=TRUE, validate=TRUE, verbose=FALSE, ...)}

\arguments{
  \item{rspCode}{A \code{\link[base]{character}} \code{\link[base]{vector}} of RSP code to parsed.}
  \item{rspLanguage}{An \code{\link{RspLanguage}} object.}
  \item{trimRsp}{If \code{\link[base:logical]{TRUE}}, white space is trimmed from RSP blocks.}
  \item{validate}{If \code{\link[base:logical]{TRUE}}, the parsed RSP code is validated through the
    \R parser.}
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
\keyword{internal}
