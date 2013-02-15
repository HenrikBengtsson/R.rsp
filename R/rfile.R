###########################################################################/**
# @RdocDefault rfile
#
# @title "Evaluates an RSP file and outputs the generated string"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{file, path}{Specifies the RSP file to processed, which can
#      be a file, a URL or a @connection.
#      If a file, the \code{path} is prepended to the file, iff given.}
#   \item{output}{A @character string or a @connection specifying where
#      output should be directed.
#      The default is a file with a filename where the file extension
#      (typically \code{".rsp"}) has been dropped from \code{file}
#      in the directory given by the \code{workdir} argument.}
#   \item{workdir}{The working directory to use after parsing and 
#      preprocessing, but while \emph{evaluating} and \emph{postprocessing}
#      the RSP document.  
#      If argument \code{output} specifies an absolute pathname, 
#      then the directory of \code{output} is used, otherwise the
#      current directory is used.}
#   \item{type}{The default content type of the RSP document.  By default, it
#      is inferred from the \code{output} filename extension, iff possible.}
#   \item{envir}{The @environment in which the RSP document is 
#      preprocessed and evaluated.}
#   \item{postprocess}{If @TRUE, and a postprocessing method exists for
#      the generated RSP product, it is postprocessed as well.}
#   \item{...}{Additional arguments passed to the RSP engine.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns an @see "RspProduct".
# }
#
# @examples "../incl/rfile.Rex"
#
# @author
#
# @keyword file
# @keyword IO
#*/########################################################################### 
setMethodS3("rfile", "default", function(file, path=NULL, output=NULL, workdir=NULL, type=NA, envir=parent.frame(), postprocess=TRUE, ..., verbose=FALSE) {
  # Load the package (super quietly), in case R.rsp::nnn() was called.
  suppressPackageStartupMessages(require("R.rsp", quietly=TRUE)) || throw("Package not loaded: R.rsp");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'file' & 'path':
  if (inherits(file, "connection")) {
  } else if (is.character(file)) {
    if (!is.null(path)) {
      file <- file.path(path, file);
    }
    if (!isUrl(file)) {
      file <- Arguments$getReadablePathname(file, absolute=TRUE);
    }
  }

  # Argument 'workdir':
  if (is.null(workdir)) {
    if (isAbsolutePath(output)) {
      workdir <- getParent(output);
    } else {
      workdir <- ".";
    }
  }
  workdir <- Arguments$getWritablePath(workdir);
  if (is.null(workdir)) workdir <- ".";

  # Argument 'output':
  if (is.null(output)) {
    if (inherits(file, "connection")) {
      throw("When argument 'file' is a connection, then 'output' must be specified.");
    }
    pattern <- "((.*)[.]([^.]+))[.]([^.]+)$";
    outputF <- gsub(pattern, "\\1", basename(file));
    output <- Arguments$getWritablePathname(outputF, path=workdir);
    output <- getAbsolutePath(output);
    if (output == file) {
      throw("Cannot process RSP file. The inferred argument 'output' is the same as argument 'file' & 'path': ", output, " == ", file);
    }
  } else if (inherits(output, "connection")) {
  } else if (identical(output, "")) {
    output <- stdout();
  } else if (is.character(output)) {
    if (isAbsolutePath(output)) {
      output <- Arguments$getWritablePathname(output);
    } else {
      output <- Arguments$getWritablePathname(output, path=workdir);
      output <- getAbsolutePath(output);
    }
    if (is.character(file) && (output == file)) {
      throw("Cannot process RSP file. Argument 'output' specifies the same file as argument 'file' & 'path': ", output, " == ", file);
    }
  } else {
    throw("Argument 'output' of unknown type: ", class(output)[1L]);
  }

  # Argument 'type':
  if (is.na(type)) {
    if (is.character(output)) {
      ext <- gsub(".*[.]([^.]+)$", "\\1", basename(output));
      type <- tolower(ext);
    }
  }
  type <- Arguments$getCharacter(type);

  # Argument 'envir':
#  envir <- Arguments$getEnvironment(envir);


  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "Processing RSP file");

  if (verbose) {
    if (is.character(file)) {
      cat(verbose, "Input pathname: ", file);
    } else if (inherits(file, "connection")) {
      ci <- summary(file);
      printf(verbose, "Input '%s' connection: %s\n", 
          class(ci)[1L], ci$description);
    }

    if (is.character(output)) {
      cat(verbose, "Output pathname: ", output);
    } else if (inherits(output, "connection")) {
      ci <- summary(output);
      printf(verbose, "Output '%s' connection: %s\n", 
          class(ci)[1L], ci$description);
    }

    printf(verbose, "Default content type: %s\n", type);
  }

  verbose && enter(verbose, "Reading RSP document");
  str <- readLines(file);
  verbose && printf(verbose, "Number of lines: %d\n", length(str));
  str <- paste(str, collapse="\n");
  verbose && printf(verbose, "Number of characters: %d\n", nchar(str));
  verbose && str(verbose, str);
  verbose && exit(verbose);

  verbose && enter(verbose, "Parsing RSP document");
  rstr <- RspString(str, type=type, source=file);
  doc <- parse(rstr, envir=envir, ...);
  verbose && print(verbose, doc);
  rm(rstr, str);
  verbose && exit(verbose);

  verbose && enter(verbose, "Translating RSP document (to R)");
  rcode <- toR(doc, envir=envir, ...);
  verbose && printf(verbose, "Number of R source code lines: %d\n", length(rcode));
  rm(doc);
  verbose && exit(verbose);


  verbose && enter(verbose, "Evaluating RSP document");

  # Change working directory
  opwd <- NULL;
  if ((workdir != ".") && (workdir != getwd())) {
    opwd <- getwd();
    on.exit({ if (!is.null(opwd)) setwd(opwd) }, add=TRUE);
    verbose && cat(verbose, "Temporary working directory: ", getAbsolutePath(workdir));
    setwd(workdir);
  }

  res <- rcat(rcode, file=output, envir=envir, ...);
  type <- attr(res, "type");
  rm(rcode, res);

  if (isFile(output)) {
    res <- RspFileProduct(output, type=type);
  } else {
    res <- RspProduct(output, type=type);
  }
  verbose && print(verbose, res);
  rm(output, type);

  # Reset the working directory?
  if (!is.null(opwd)) {
    setwd(opwd);
    opwd <- NULL;
  }

  verbose && exit(verbose);

  if (postprocess && hasProcessor(res)) {
    res <- process(res, workdir=workdir, ..., verbose=verbose);
  }

  verbose && exit(verbose);

  invisible(res);
}, protected=TRUE) # rfile()



############################################################################
# HISTORY:
# 2013-02-13
# o Added argument 'postprocess' to rfile().
# o Now rfile() sets the default content type based on the filename
#   extension, iff possible.
# o Added argument 'workdir' to rfile().
# o Added support for 'pathname' also being a connection or a URL.
# o Added some protection against overwriting the input file.
# o Renamed rspPlain() to rfile(), cf. rstring() and rcat().
# o rspPlain() is now utilizing the new RSP engine, e.g. rcat().
# o CLEANUP: Removed all dependencies on RspResponse, FileRspResponse etc.
# 2013-02-08
# o Extracted rspPlain() from rsp().
# o Created.
############################################################################
