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
  The RSP markup language makes any text-based document come alive.  RSP provides a powerful markup for controlling the content and output of LaTeX, HTML, Markdown, AsciiDoc, Sweave and knitr documents (and more), e.g. 'Today's date is <\%=Sys.Date()\%>'.  Contrary to many other literate programming languages, with RSP it is straightforward to loop over mixtures of code and text sections, e.g. in month-by-month summaries.  RSP has also several preprocessing directives for incorporating static and dynamic contents of external files (local or online) among other things.  Functions rstring() and rcat() make it easy to process RSP strings, while rfile() compiles RSP files (also online) into their final outputs, e.g. rfile('report.tex.rsp') generates 'report.pdf'.  RSP is ideal for self-contained scientific reports and R package vignettes.
}

\section{Installation}{
  To install this package, call \code{install.packages("R.rsp")}.
}

\section{To get started}{
  To get started, see:
  \enumerate{
    \item For a detailed description of RSP, see vignette '\href{../doc/index.html}{Dynamic document creation using RSP}'.
    \item For a quick overview of RSP, see vignette '\href{../doc/index.html}{Introductory slides on RSP}'.
    \item For a one-page overview of RSP, see vignette '\href{../doc/index.html}{RSP Markup Language - Reference Card}'.
    \item To included RSP vignettes in a package, see '\href{../doc/index.html}{Include RSP and other non-Sweave vignettes in R packages}'.
    \item To compile a RSP-embedded text document to a final document, use \code{\link{rfile}}(), e.g. \code{rfile("report.tex.rsp")} outputs file 'report.pdf' and \code{rfile("report.md.rsp")} outputs file 'report.html'.
    \item To compile a RSP document (file or string) and output the result to standard output or a string, use \code{\link{rcat}}() an \code{\link{rstring}}(), respectively.
  }
}

\section{Acknowledgments}{
  Several of the post-processing features of this package utilize
  packages such as \pkg{base64enc}, \pkg{ascii}, \pkg{knitr}, and
  \pkg{markdown}.
  Not enough credit can be given to the authors and contributors
  of those packages.  Thank you for your great work.
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
R package version 0.9.24.
}

\author{Henrik Bengtsson}
\keyword{package}
