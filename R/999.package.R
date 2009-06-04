#########################################################################/**
# @RdocPackage R.rsp
#
# \description{
#   @eval "getDescription(R.rsp)"
#
#   For package history, see \code{showHistory(R.rsp)}. 
# }
#
# \section{Requirements}{
#   This is a cross-platform package implemented in plain \R.
#   This package depends on the packages \pkg{R.oo} [1] and \pkg{R.utils}.
#
#   Note that no webserver is required to process RSP documents.
# }
#
# \section{Installation}{
#   To install this package, see \url{http://www.braju.com/R/}.
#   Required packages are installed in the same way.
# }
#
# \section{To get started}{
#   To get started, see:
#   \enumerate{
#     \item @see "rspToHtml" - To compile an RSP file to HTML.
#     \item @see "browseRsp" - To start the internal \R web server and
#       launch the RSP main menu in the default web browser.
#       From this page you access not only help pages and demos on how 
#       to use RSP, but also other package RSP pages.
#     \item @see "sourceRsp" - To process a single RSP page.
#     \item @see "sourceAllRsp" - To process multiple RSP pages in a batch.
#     \item @see "parseRsp" - To parse an RSP page in to R code, 
#       but without evaluating the code.
#     \item @see "HttpDaemon" - The internal web server.
#   }
# } 
#
# \section{Wishlist}{
#  Here is a list of features that would be useful, but which I have
#  too little time to add myself. Contributions are appreciated.
#  \itemize{ 
#    \item Extract the HTTP daemon part of this package and create
#          a standalone package named R.httpd or similar.  It should
#          provide a method to register simple modules, such as an
#          RSP module.  The R.rsp package should then only be a 
#          simple module.
#    \item Write "plugins" to common web servers, e.g. modules to
#          the Apache webserver.
#    \item Add support for multiple default files; needs Tcl coding.
#    \item Create a root ServletRequest class to support not only
#          HTTP requests, but also other types of request, e.g.
#          FileRequest etc.  This requires some thinking of 
#          user cases and design.
#  }
#
#  If you consider implement some of the above, make sure it is not
#  already implemented by downloading the latest "devel" version! 
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
# @author 
#
# \section{How to cite this package}{
#   Not available.
# }
#
# \section{References}{
#  [1] @include "../incl/BengtssonH_2003.bib.Rdoc" \cr
# }
#
# % Building HTML documentation from RSP example files
#*/#########################################################################  


# @eval "path <- '../inst/doc'; unlink(path, recursive=TRUE); mkdirs(path); sourceAllRsp(path='../inst/rsp/', outputPath='../inst/doc/', extension='html'); ''"
