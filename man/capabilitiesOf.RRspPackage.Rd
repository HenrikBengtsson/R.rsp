%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  999.RRspPackage.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{RRspPackage$capabilitiesOf}
\alias{RRspPackage$capabilitiesOf}
\alias{capabilitiesOf.RRspPackage}
\alias{RRspPackage.capabilitiesOf}
\alias{capabilitiesOf,RRspPackage-method}
\alias{RRspPackage.isCapableOf}
\alias{isCapableOf.RRspPackage}
\alias{isCapableOf,RRspPackage-method}


\title{Checks which tools are supported}

\description{
  Checks which tools are supported.
}

\usage{
## Static method (use this):
## RRspPackage$capabilitiesOf(what=NULL, force=FALSE, ...)

## Don't use the below:
\method{capabilitiesOf}{RRspPackage}(static, what=NULL, force=FALSE, ...)
}

\arguments{
 \item{what}{Optional \code{\link[base]{character}} \code{\link[base]{vector}} of which tools to check.}
 \item{force}{If \code{\link[base:logical]{TRUE}}, cached results are ignored, otherwise not.}
 \item{...}{Not used.}
}

\value{
  Returns a \code{\link[base]{logical}} named \code{\link[base]{character}} \code{\link[base]{vector}}.
}

\examples{
# Display which tools are supported by the package
print(capabilitiesOf(R.rsp))

# Check whether AsciiDoc is supported
print(isCapableOf(R.rsp, "asciidoc"))

# Check whether pandoc v1.12 or newer is supported
print(isCapableOf(R.rsp, "pandoc (>= 1.12)"))
}

\author{Henrik Bengtsson}
\keyword{internal}
\keyword{methods}
