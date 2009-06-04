%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  HttpDaemon.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{writeResponse.HttpDaemon}
\alias{writeResponse.HttpDaemon}
\alias{HttpDaemon.writeResponse}
\alias{writeResponse.HttpDaemon}
\alias{writeResponse,HttpDaemon-method}


\title{Writes a string to the HTTP output connection}

\description{
 Writes a string to the HTTP output connection.
}

\usage{\method{writeResponse}{HttpDaemon}(static, ...)}

\arguments{
  \item{...}{A set of \code{\link[base]{character}} strings to be outputted.}
}

\details{
  \emph{Note: For efficiency, there is no check if the HTTP daemon is
        started or not.}
}

\value{
 Returns (invisibly) the number of characters written.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  For more information see \code{\link{HttpDaemon}}.
}


\keyword{internal}
\keyword{methods}
\keyword{IO}
