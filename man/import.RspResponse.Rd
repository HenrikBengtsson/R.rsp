%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspResponse.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{import.RspResponse}
\alias{import.RspResponse}
\alias{RspResponse.import}
\alias{import,RspResponse-method}

\title{Imports the output from another RSP file}

\description{
 Imports the output from another RSP file.
 This is an internal methods called when processing the
 \code{<\%@ import file="url"\%>} tag.
}

\usage{
\method{import}{RspResponse}(response, ...)
}

\arguments{
  \item{...}{Arguments passed to \code{\link{sourceRsp}}().}
}

\value{
  Writes the output from \code{\link{sourceRsp}}() to the RSP response output file.
  If an error occurs, the error message is written too.
}

\author{Henrik Bengtsson}

\seealso{
  \code{\link{sourceRsp}}().
  For more information see \code{\link{RspResponse}}.
}



\keyword{internal}
\keyword{methods}
\keyword{file}
\keyword{IO}
