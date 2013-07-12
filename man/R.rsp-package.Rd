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
  An RSP document is a text-based document containing an R-embedded template of the final document, e.g. "Today's date is <\%=Sys.Date()\%>".  An RSP document is preprocessed, parsed and translated into R code, which when evaluated generates the final document.  This way it is possible to dynamically generate reports by embedding RSP in plain text, TeX, HTML, Markdown, AsciiDoc and so on, e.g. "\\includegraphics{<\%=toPDF('Normal', { curve(dnorm, from=-5, to=+5) })\%>}". It can also be used to enhance any other literate programming languages such as Sweave and knitr, e.g. "<<eval=<\%=doEval\%>>>= [...] @".  RSP-embedded vignettes can easily be included in any R package.
}

\section{Installation}{
  To install this package, call \code{install.packages("R.rsp")}.
}

\section{To get started}{
  To get started, see:
  \enumerate{
    \item For a one-page overview of RSP, see vignette '\href{../doc/index.html}{RSP Markup Language - Reference Card}'.
    \item For a detailed description of RSP, see vignette '\href{../doc/index.html}{Dynamic LaTeX reports with RSP}'.
    \item To included RSP vignettes in a package, see '\href{../doc/index.html}{Include RSP and other non-Sweave vignettes in R packages}'.
    \item To compile a RSP-embedded text document to a final document, use \code{\link{rfile}}(), e.g. \code{rfile("report.tex.rsp")} outputs file 'report.pdf' and \code{rfile("report.md.rsp")} outputs file 'report.html'.
    \item To compile a RSP document (file or string) and output the result to standard output or a string, use \code{\link{rcat}}() an \code{\link{rstring}}(), respectively.
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

\section{How to cite this package}{
 Bengtsson H (2013).
\emph{R.rsp: Dynamic generation of scientific reports}.
R package version 0.9.9.
}

\author{Henrik Bengtsson}
\keyword{package}
