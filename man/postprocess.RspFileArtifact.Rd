%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspArtifact.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{postprocess.RspFileArtifact}
\alias{postprocess.RspFileArtifact}
\alias{RspFileArtifact.postprocess}
\alias{postprocess.RspFileArtifact}
\alias{postprocess,RspFileArtifact-method}


\title{Postprocesses an RSP file artifact}

\description{
 Postprocesses an RSP file artifact.
}

\usage{\method{postprocess}{RspFileArtifact}(object, type=NULL, workdir=".", ..., verbose=FALSE)}

\arguments{
  \item{type}{A \code{\link[base]{character}} string specifying the content type.}
  \item{workdir}{The working directory.}
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
