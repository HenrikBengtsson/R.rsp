%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  sourceAllRsp.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{sourceAllRsp}
\alias{sourceAllRsp.default}
\alias{sourceAllRsp}

\title{Processes one or several RSP files}

\description{
 Processes one or several RSP files.
}

\usage{\method{sourceAllRsp}{default}(pattern="[.]rsp$", path=".", extension="html", outputPath=extension, overwrite=FALSE, ..., envir=parent.frame())}

\arguments{
  \item{pattern}{A filename pattern.}
  \item{path}{The pathname of the directory to be search for RSP files.}
  \item{extension}{The filename extension to be used for the output files.}
  \item{outputPath}{The pathname of the directory where to save the
        output files.}
  \item{overwrite}{If \code{\link[base:logical]{FALSE}}, an error is thrown if an output file already
    exists, otherwise not.}
  \item{...}{Additional arguments passed to \code{\link{sourceRsp}}().}
  \item{envir}{An \code{\link[base]{environment}} to be the working environment of the
    servlets, i.e. where RSP variables and objects are stored.}
}

\value{
  Returns (invisibly) a \code{\link[base]{character}} \code{\link[base]{list}} of pathnames of all processed
  RSP files.
}

\section{Exceptions}{
  If an exception occurs while processing a file, the methods skips to
  the next one and records the error.
}

\examples{
# Copy the complete directory tree contain RSP files
rspPath <- system.file("rsp", package="R.rsp")
cat("RSP directory: ", rspPath, "\n")

# Create an output path to contain HTML files
outputPath <- tempdir()
cat("HTML directory: ", outputPath, "\n")

# Process all RSP files (not recursively)
files <- sourceAllRsp(path=rspPath, outputPath=outputPath, extension="html")

cat("Processed the following RSP files:\n")
print(files)

# View generated documents
if (interactive()) {
  library(tools)
  indexFile <- filePath(outputPath, "index.html")
  cat("Trying to open '", indexFile, "' in default browser...\n", sep="")
  browseURL(getAbsolutePath(indexFile))
}
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  \code{\link{sourceRsp}}().
}



\keyword{file}
\keyword{IO}
