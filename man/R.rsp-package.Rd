%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  999.package.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{R.rsp-package}
\alias{R.rsp-package}
\alias{R.rsp}
\docType{package}

\title{Package R.rsp}


\description{
  An RSP document is a text-based document containing an R-embedded template of the final document, e.g. "Today's date is <%=Sys.Date()%>".  An RSP document is preprocessed, parsed and translated into R code, which when evaluated generates the final document.  This way it is possible to dynamically generate reports in plain text, HTML, TeX etc, e.g. "\includegraphics{<%=toPDF('Normal', { curve(dnorm, from=-5, to=+5) })%>}". It can also be used to enhance other literate programming languages such as Sweave and knitr, e.g. "<<eval=<%=doEval%>>>= [...] @".  As explained in the vignettes, RSP-embedded LaTeX vignettes can easily be included in any R package.
}

\section{Installation}{
  This is a cross-platform package implemented in plain \R.
  To install this package, call \code{install.packages("R.rsp")}.
}

\section{To get started}{
  To get started, see:
  \enumerate{
    \item Vignette 'Dynamic LaTeX reports with RSP'
    \item \code{\link{rstring}}(), \code{\link{rcat}}() and \code{\link{rfile}}().
  }
}

\section{License}{
  The releases of this package is licensed under
  LGPL version 2.1 or newer.

  The development code of the packages is under a private licence
  (where applicable) and patches sent to the author fall under the
  latter license, but will be, if incorporated, released under the
  "release" license above.
}

\author{Henrik Bengtsson}

\section{How to cite this package}{
  Not available.
}

\section{References}{
 [1] H. Bengtsson, \emph{The R.oo package - Object-Oriented Programming with References Using Standard R Code}, In Kurt Hornik, Friedrich Leisch and Achim Zeileis, editors, Proceedings of the 3rd International Workshop on Distributed Statistical Computing (DSC 2003), March 20-22, Vienna, Austria. \url{http://www.ci.tuwien.ac.at/Conferences/DSC-2003/Proceedings/}
 \cr
}
\keyword{package}
