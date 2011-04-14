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
  An RSP document is a text-based document containing an R-embedded template of the final document.  An RSP document is preprocessed, parsed and translated into an R script, which when sourced generates the final document.  This way it is possible to dynamically generate reports in plain text, HTML, TeX etc.  It can also be used to enhance other literate programming languanges such as Sweave.  In addition to RSP, this package also provides an internal cross-platform web server and built-in dynamic RS_embedded HTML help pages, which can be launched by browseRsp().  If other packages provide RSP help pages, these are automatically linked to as well.
}

\section{Requirements}{
  This is a cross-platform package implemented in plain \R.
  This package depends on the packages \pkg{R.oo} [1] and \pkg{R.utils}.

  Note that no webserver is required to process RSP documents.
}

\section{Installation}{
  To install this package, do \code{install.packages("R.rsp")}.
}

\section{To get started}{
  To get started, see:
  \enumerate{
    \item \code{\link{rsp}}() - To compiles any RSP-embedded document.
    \item \code{\link{browseRsp}}() - Luanches a locally running RSP website powered by an internal web server and RSP-embedded HTML pages.  From this page you access not only help pages and demos on how to use RSP, but also other package RSP pages.
  }
}

\section{Wishlist}{
 Here is a list of features that would be useful, but which I have
 too little time to add myself. Contributions are appreciated.
 \itemize{
   \item Extract the HTTP daemon part of this package and create
         a standalone package named R.httpd or similar.  It should
         provide a method to register simple modules, such as an
         RSP module.  The R.rsp package should then only be a
         simple module.
   \item Write "plugins" to common web servers, e.g. modules to
         the Apache webserver.
   \item Add support for multiple default files; needs Tcl coding.
   \item Create a root ServletRequest class to support not only
         HTTP requests, but also other types of request, e.g.
         FileRequest etc.  This requires some thinking of
         user cases and design.
 }

 If you consider implement some of the above, make sure it is not
 already implemented by downloading the latest "devel" version!
}

\section{License}{
  The releases of this package is licensed under
  LGPL version 2.1 or newer.

  The development code of the packages is under a private licence
  (where applicable) and patches sent to the author fall under the
  latter license, but will be, if incorporated, released under the
  "release" license above.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\section{How to cite this package}{
  Not available.
}

\section{References}{
 [1] H. Bengtsson, \emph{The R.oo package - Object-Oriented Programming with References Using Standard R Code}, In Kurt Hornik, Friedrich Leisch and Achim Zeileis, editors, Proceedings of the 3rd International Workshop on Distributed Statistical Computing (DSC 2003), March 20-22, Vienna, Austria. \url{http://www.ci.tuwien.ac.at/Conferences/DSC-2003/Proceedings/}
 \cr
}

% Building HTML documentation from RSP example files
\keyword{package}
