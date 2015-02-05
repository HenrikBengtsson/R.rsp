%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  attributes.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\name{getAttributes.default}
\alias{getAttributes.default}
\alias{default.getAttribute}
\alias{getAttribute.default}
\alias{getAttribute,default-method}

\alias{default.hasAttribute}
\alias{hasAttribute.default}
\alias{hasAttribute,default-method}

\alias{default.setAttributes}
\alias{setAttributes.default}
\alias{setAttributes,default-method}

\alias{default.setAttribute}
\alias{setAttribute.default}
\alias{setAttribute,default-method}

\alias{default.getMetadata}
\alias{getMetadata.default}
\alias{getMetadata,default-method}

\alias{default.setMetadata}
\alias{setMetadata.default}
\alias{setMetadata,default-method}


\title{Gets and sets attributes of an object}

\description{
 Gets and sets attributes of an object.
}

\usage{
\method{getAttributes}{default}(object, private=FALSE, ...)
}

\arguments{
  \item{object}{An object.}
  \item{private}{If \code{\link[base:logical]{TRUE}}, attributes starting with a period are
        also returned, otherwise not.}
  \item{...}{Not used.}
}

\value{
  Returns a named \code{\link[base]{list}}, \code{\link[base]{NULL}} or a modified object itself.
}

\author{Henrik Bengtsson}


\keyword{methods}
\keyword{internal}
