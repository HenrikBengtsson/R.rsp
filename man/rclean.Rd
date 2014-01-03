%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rclean.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rclean}
\alias{rclean.default}
\alias{rclean}
\alias{rclean.RspString}
\alias{rclean.RspDocument}

\title{Compiles an RSP document into a preprocessed and validated RSP document}

\description{
 Compiles an RSP document into a preprocessed and validated RSP document.
}

\usage{
\method{rclean}{default}(..., file=NULL, path=NULL, envir=parent.frame(), args="*", verbose=FALSE)
}

\arguments{
  \item{...}{\code{\link[base]{character}} strings with RSP markup.}
  \item{file, path}{Alternatively, a file, a URL or a \code{\link[base:connections]{connection}} from
     with the strings are read.
     If a file, the \code{path} is prepended to the file, iff given.}
  \item{envir}{The \code{\link[base]{environment}} in which the RSP string is preprocessed.}
  \item{args}{A named \code{\link[base]{list}} of arguments assigned to the environment
    in which the RSP document is parsed.
    See \code{\link[R.utils]{cmdArgs}}.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns an \code{\link{RspString}}.
}

\examples{
# RSP-embedded text to a preprocessed and validated RSP string
s <- rclean('Current <\%@include content="time"\%> is <\%=Sys.time()\%>\n')
print(s)
}

\author{Henrik Bengtsson}

\seealso{
 \code{\link{rcat}}() and \code{\link{rfile}}().
}




\keyword{file}
\keyword{IO}
\keyword{internal}
