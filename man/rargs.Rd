%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  rargs.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{rargs}
\alias{rargs.default}
\alias{rargs}

\title{Expands a set of arguments}

\description{
 Expands a set of arguments.
}

\usage{\method{rargs}{default}(args="*", defaults=list(), unique=TRUE, ...)}

\arguments{
  \item{args}{A \code{\link[base]{vector}} or a \code{\link[base]{list}} of arguments.}
  \item{defaults}{A named \code{\link[base]{list}} of default arguments.}
  \item{unique}{If \code{\link[base:logical]{TRUE}}, the returned set of arguments contains only
    unique arguments such that if two or more arguments has then same
    name, it is only the last occurance that is returned.}
  \item{...}{Not used.}
}

\value{
  Returns a named \code{\link[base]{list}} of arguments, where all arguments have a name.
}

\details{
  All elements of argument \code{args} must be named, except for so called
  argument templates which have special meanings.  Currently the following
  template is supported:
  \itemize{
   \item \code{"*"}:
     Will replaced by the parsed and cleanup set of command line arguments
     used when launching R.  More precise, it will take the value of
     \code{R.utils::commandArgs(asValues=TRUE, excludeReserved=TRUE)[-1L]}.
     For further details, see \code{\link[R.utils]{commandArgs}}().
     By default, the values of these command line arguments are
     \code{\link[base]{character}} strings.  However, if \code{args} or \code{defaults}
     contain arguments with the same names, the corresponding command
     line arguments are coerced to their data types.
  }

  If argument \code{args} is a \code{\link[base]{vector}} (non-list), then it is coerced to
  a \code{\link[base]{list}} via \code{\link{as.list}}().  This is supported only for the purpose of
  being able to specify \code{args="*"} instead of \code{args=list("*")}.
}

\examples{
cat("Parsed and cleaned up set of command line arguments:\n")
args <- rargs("*")
str(args)


cat("Command line arguments with defaults:\n")
args <- rargs(list("*"), defaults=list(n=4, verbose=FALSE))
str(args)


cat("Command line arguments with defaults and custom arguments:\n")
args <- rargs(list("*", A=3), defaults=list(n=4, verbose=FALSE))
str(args)
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

