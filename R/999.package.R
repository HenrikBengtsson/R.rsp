#########################################################################/**
# @RdocPackage R.rsp
#
# \description{
#   @eval "gsub('(\\\\|%)', '\\\\\\1', getDescription(R.rsp))"
# }
#
# \section{Installation}{
#   To install this package, call \code{install.packages("R.rsp")}.
# }
#
# \section{To get started}{
#   To get started, see:
#   \enumerate{
#     \item For a detailed description of RSP, see vignette '\href{../doc/index.html}{Dynamic document creation using RSP}'.
#     \item For a quick overview of RSP, see vignette '\href{../doc/index.html}{Introductory slides on RSP}'.
#     \item For a one-page overview of RSP, see vignette '\href{../doc/index.html}{RSP Markup Language - Reference Card}'.
#     \item To included RSP vignettes in a package, see '\href{../doc/index.html}{Include RSP and other non-Sweave vignettes in R packages}'.
#     \item To compile a RSP-embedded text document to a final document, use @see "rfile", e.g. \code{rfile("report.tex.rsp")} outputs file 'report.pdf' and \code{rfile("report.md.rsp")} outputs file 'report.html'.
#     \item To compile a RSP document (file or string) and output the result to standard output or a string, use @see "rcat" an @see "rstring", respectively.
#   }
# }
#
# \section{Acknowledgments}{
#   Several of the post-processing features of this package utilize
#   packages such as \pkg{base64enc}, \pkg{ascii}, \pkg{knitr}, and
#   \pkg{markdown}.
#   Not enough credit can be given to the authors and contributors
#   of those packages.  Thank you for your great work.
# }
#
# \section{License}{
#   The releases of this package is licensed under
#   LGPL version 2.1 or newer.
#
#   The development code of the packages is under a private licence
#   (where applicable) and patches sent to the author fall under the
#   latter license, but will be, if incorporated, released under the
#   "release" license above.
# }
#
# \section{How to cite this package}{
#  @eval "paste(capture.output(print(citation('R.rsp'), style='latex')), collapse='\n')"
# }
#
# @author
#*/#########################################################################
