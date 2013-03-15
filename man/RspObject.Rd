%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  RspObject.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{RspObject}
\docType{class}
\alias{RspObject}


 \title{The abstract RspObject class}

 \description{
  Package:  R.rsp \cr
\bold{Class RspObject}\cr

\code{logical}\cr
\code{~~|}\cr
\code{~~+--}\code{RspObject}\cr

\bold{Directly known subclasses:}\cr
\link[R.rsp]{RspDocument}, \link[R.rsp]{RspFileProduct}, \link[R.rsp]{RspProduct}, \link[R.rsp]{RspRSourceCode}, \emph{\link[R.rsp]{RspShSourceCode}}, \emph{\link[R.rsp]{RspSourceCode}}, \link[R.rsp]{RspString}, \link[R.rsp]{RspStringProduct}\cr

public class \bold{RspObject}\cr
extends logical\cr



  An RspObject represents an instance a specific RSP class.
 }

 \usage{
RspObject(value=NA, attrs=list(), ...)
}

 \arguments{
   \item{value}{An R object.}
   \item{attrs}{RSP attributes as a named \code{\link[base]{list}}, e.g. \code{type},
      \code{language}, and \code{source}.}
   \item{...}{Additional named RSP attributes.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{getAttribute} \tab  -\cr
 \tab \code{\link[R.rsp:getAttributes.RspObject]{getAttributes}} \tab Gets the attributes of an RSP document.\cr
 \tab \code{setAttribute} \tab  -\cr
 \tab \code{setAttributes} \tab  -\cr
}


 \bold{Methods inherited from logical}:\cr
as.data.frame, as.raster, whichVector

 }

 \author{Henrik Bengtsson}


\keyword{classes}
\keyword{internal}
