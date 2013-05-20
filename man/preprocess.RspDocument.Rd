%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspDocument.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{preprocess.RspDocument}
\alias{preprocess.RspDocument}
\alias{RspDocument.preprocess}
\alias{preprocess,RspDocument-method}
\alias{RspDocument.parseIfElseDirectives}
\alias{parseIfElseDirectives.RspDocument}
\alias{parseIfElseDirectives,RspDocument-method}

\alias{parseIfElseDirectives}

\title{Processes all RSP preprocessing directives}

\description{
 Processes all RSP preprocessing directives.
}

\usage{
\method{preprocess}{RspDocument}(object, recursive=TRUE, flatten=TRUE, envir=parent.frame(), ...,
  verbose=FALSE)
}

\arguments{
  \item{recursive}{If \code{\link[base:logical]{TRUE}}, any \code{\link{RspDocument}}s introduced via
     preprocessing directives are recursively parsed and preprocessed
     as well.}
  \item{flatten}{If \code{\link[base:logical]{TRUE}}, any \code{\link{RspDocument}} introduced is
     replaced (inserted and expanded) by its \code{\link[base]{list}} of
     \code{\link{RspConstruct}}s.}
  \item{envir}{The \code{\link[base]{environment}} where the preprocessing is evaluated.}
  \item{...}{Not used.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
 Returns an \code{\link{RspDocument}}.
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{RspDocument}}.
}
\keyword{internal}
\keyword{methods}
