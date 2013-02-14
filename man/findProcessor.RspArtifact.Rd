%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspArtifact.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{findProcessor.RspArtifact}
\alias{findProcessor.RspArtifact}
\alias{RspArtifact.findProcessor}
\alias{findProcessor.RspArtifact}
\alias{findProcessor,RspArtifact-method}


\title{Tries to locate a postprocessor for an RSP artifact}

\description{
 Tries to locate a postprocessor for an RSP artifact.
}

\usage{\method{findProcessor}{RspArtifact}(object, ..., verbose=FALSE)}

\arguments{
  \item{pathname}{The RSP artifact, e.g. a file.}
  \item{type}{A \code{\link[base]{character}} string specifying the content type.}
  \item{outPath}{The working directory.}
  \item{...}{Not used.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns the postprocessed RSP artifact, e.g. the pathname to a PDF file.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}



\keyword{internal}
\keyword{methods}
\keyword{file}
\keyword{IO}
