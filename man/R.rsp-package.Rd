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
  The RSP markup language makes any text-based document come alive.  RSP provides a powerful markup for controlling the content and output of LaTeX, HTML, Markdown, AsciiDoc, Sweave and knitr documents (and more), e.g. 'Today's date is <\%=Sys.Date()\%>'.  Contrary to many other literate programming languages, with RSP it is straightforward to loop over mixtures of code and text sections, e.g. in month-by-month summaries.  RSP has also several preprocessing directives for incorporating static and dynamic contents of external files (local or online) among other things.  Functions rstring() and rcat() make it easy to process RSP strings, rsource() sources an RSP file as it was an R script, while rfile() compiles it (even online) into its final output format, e.g. rfile('report.tex.rsp') generates 'report.pdf' and rfile('report.md.rsp') generates 'report.html'.  RSP is ideal for self-contained scientific reports and R package vignettes.  It's easy to use - if you know how to write an R script, you'll be up and running within minutes.
}

\section{Installation}{
  To install this package, call \code{install.packages("R.rsp")}.
}

\section{To get started}{
  We recommend that you start by reading one of the '\href{../doc/index.html}{vignettes}':
  \enumerate{
    \item A 5 minute slideshow covering the basics of RSP.
    \item Detailed description of the RSP markup language.
    \item A one-page RSP reference card.
    \item How to use RSP for package vignettes.
    \item How to use plain LaTeX for package vignettes.
    \item How to use static PDF or HTML package vignettes.
  }

  Then, when you're ready to try it yourself, these are commands you can start with:
  \enumerate{
    \item Play with \code{\link{rcat}}(), which works like \code{\link[base]{cat}}() but also processed RSP expressions, e.g. \code{rcat("A random number: <\%=sample(100, size=1)\%>\n")}.
    \item To source a RSP document as you do with R scripts, use \code{\link{rsource}}(), e.g. \code{rsource("report.md.rsp")} which will run the RSP and display the output as it appears.
    \item To compile a RSP document to a final document, use \code{\link{rfile}}(), e.g. \code{rfile("report.md.rsp")} outputs Markdown file 'report.md' which is automatically compiled into a final 'report.html'.
  }
}

\section{Acknowledgments}{
  Several of the post-processing features of this package utilize
  packages such as \pkg{base64enc}, \pkg{knitr}, and \pkg{markdown}.
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
 Bengtsson H (2019).
\emph{R.rsp: Dynamic Generation of Scientific Reports}.
R package version 0.43.1, \url{https://github.com/HenrikBengtsson/R.rsp}.
}

\author{Henrik Bengtsson}
\keyword{package}
