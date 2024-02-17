%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspText.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{getContent.RspText}
\alias{getContent.RspText}
\alias{RspText.getContent}
\alias{getContent,RspText-method}

\title{Gets the contents of the RSP text}

\description{
 Gets the contents of the RSP text.
}

\usage{
\method{getContent}{RspText}(text, unescape=FALSE, ...)
}

\arguments{
  \item{unescape}{If \code{\link[base:logical]{TRUE}}, character sequences \code{<\%\%} and
               \code{\%\%>} are unescaped to \code{<\%} and \code{\%>}.}
  \item{...}{Not used.}
}

\value{
 Returns a \code{\link[base]{character}} string.
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{RspText}}.
}
\keyword{internal}
\keyword{methods}
