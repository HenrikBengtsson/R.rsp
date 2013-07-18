###########################################################################/**
# @RdocDefault rfile
# @alias rfile.RspString
# @alias rfile.RspDocument
# @alias rfile.RspRSourceCode
# @alias rfile.function
#
# @title "Evaluates and postprocesses an RSP document and outputs the final RSP document file"
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
#   \item{args}{A named @list of arguments assigned to the environment
#     in which the RSP string is parsed and evaluated.
#     See @see "R.utils::cmdArgs".}
#   \item{postprocess}{If @TRUE, and a postprocessing method exists for
#      the generated RSP product, it is postprocessed as well.}
#   \item{...}{Additional arguments passed to the RSP engine.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns an @see "RspProduct".
#   If argument \code{output} specifies a file, then this is
#   an @see "RspFileProduct".
# }
#
# \section{Processing RSP files from the command line}{
#   Using @see "Rscript" and \code{rfile()}, it is possible to process
#   an RSP file from the command line.  For example,
#
#   \code{Rscript -e "R.rsp::rfile(file='RSP-refcard.tex.rsp', path=system.file('doc', package='R.rsp'))"}
#
#   parses and evaluates \file{RSP-refcard.tex.rsp} and output \file{RSP-refcard.pdf} in the current directory.
# }
#
# @examples "../incl/rfile.Rex"
#
# @author
#
# \seealso{
#  @see "rstring" and @see "rcat".
# }
#
# @keyword file
# @keyword IO
#*/###########################################################################
setMethodS3("rfile", "default", function(file, path=NULL, output=NULL, workdir=NULL, type=NA, envir=parent.frame(), args="*", postprocess=TRUE, ..., verbose=FALSE) {
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
    filename <- basename(file);
    if (isUrl(file)) {
      # Extract the filename of the URL
      url <- splitUrl(file);
      filename <- basename(url$path);
    }
    pattern <- "((.*)[.]([^.]+)|([^.]+))[.]([^.]+)$";
    outputF <- gsub(pattern, "\\1", filename, ignore.case=TRUE);
    output <- Arguments$getWritablePathname(outputF, path=workdir);
    output <- getAbsolutePath(output);
    # Don't overwrite the input file
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
  if (is.null(type)) {
    if (is.character(output)) {
      type <- extentionToIMT(output);
      attr(type, "fixed") <- TRUE;
    } else {
      type <- NA;
    }
  }
  if (is.na(type)) {
    if (is.character(output)) {
      type <- extentionToIMT(output);
    }
  }
  fixed <- attr(type, "fixed");
  type <- Arguments$getCharacter(type);
  attr(type, "fixed") <- fixed;

  # Argument 'envir':
  stopifnot(is.environment(envir));

  # Argument 'args':
  args <- cmdArgs(args=args);

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


  verbose && enter(verbose, "Assigning RSP arguments");
  verbose && cat(verbose, "Environment: ", getName(envir));
  if (length(args) > 0L) {
    verbose && cat(verbose, "Arguments assigned: ", hpaste(names(args)));
    # Assign arguments to the parse/evaluation environment
    attachLocally(args, envir=envir);
  } else {
    verbose && cat(verbose, "Arguments assigned: <none>");
  }
  verbose && exit(verbose);

  verbose && enter(verbose, "Reading RSP document");
  str <- .readText(file);
  verbose && printf(verbose, "Number of characters: %d\n", nchar(str));
  verbose && str(verbose, str);
  verbose && exit(verbose);


  verbose && enter(verbose, "Parsing RSP document");
  rstr <- RspString(str, type=type, source=file);
  doc <- parse(rstr, envir=envir, ...);
  verbose && print(verbose, doc);
  rstr <- str <- NULL; # Not needed anymore
  verbose && exit(verbose);

  res <- rfile(doc, output=output, workdir=workdir, envir=envir, args=NULL, postprocess=postprocess, ..., verbose=verbose);

  verbose && exit(verbose);

  res;
}) # rfile()



setMethodS3("rfile", "RspString", function(rstr, ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "Processing RSP string");

  verbose && enter(verbose, "Parsing RSP document");
  doc <- parse(rstr, ...);
  verbose && print(verbose, doc);
  rstr <- str <- NULL; # Not needed anymore
  verbose && exit(verbose);

  verbose && enter(verbose, "Translating RSP document (to R)");
  rcode <- toR(doc, ...);
  verbose && printf(verbose, "Number of R source code lines: %d\n", length(rcode));
  doc <- NULL; # Not needed anymore
  verbose && exit(verbose);

  res <- rfile(rcode, ..., verbose=verbose);

  verbose && exit(verbose);

  res;
}, protected=TRUE) # rfile()



setMethodS3("rfile", "RspDocument", function(doc, ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "Processing RSP document");

  verbose && enter(verbose, "Translating RSP document (to R)");
  rcode <- toR(doc, ...);
  verbose && printf(verbose, "Number of R source code lines: %d\n", length(rcode));
  doc <- NULL; # Not needed anymore
  verbose && exit(verbose);

  res <- rfile(rcode, ..., verbose=verbose);

  verbose && exit(verbose);

  res;
}, protected=TRUE) # rfile()


setMethodS3("rfile", "RspRSourceCode", function(rcode, output, workdir=NULL, envir=parent.frame(), args="*", postprocess=TRUE, ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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
  if (inherits(output, "connection")) {
  } else if (identical(output, "")) {
    output <- stdout();
  } else if (is.character(output)) {
    if (isAbsolutePath(output)) {
      output <- Arguments$getWritablePathname(output);
    } else {
      output <- Arguments$getWritablePathname(output, path=workdir);
      output <- getAbsolutePath(output);
    }
  } else {
    throw("Argument 'output' of unknown type: ", class(output)[1L]);
  }

  # Argument 'envir':
  stopifnot(is.environment(envir));

  # Argument 'args':
  args <- cmdArgs(args=args);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "Processing RSP R source code");

  if (verbose) {
    if (is.character(output)) {
      cat(verbose, "Output pathname: ", output);
    } else if (inherits(output, "connection")) {
      ci <- summary(output);
      printf(verbose, "Output '%s' connection: %s\n",
          class(ci)[1L], ci$description);
    }
  }


  verbose && enter(verbose, "Assigning RSP arguments");
  verbose && cat(verbose, "Environment: ", getName(envir));
  if (length(args) > 0L) {
    verbose && cat(verbose, "Arguments assigned: ", hpaste(names(args)));
    # Assign arguments to the parse/evaluation environment
    attachLocally(args, envir=envir);
  } else {
    verbose && cat(verbose, "Arguments assigned: <none>");
  }
  verbose && exit(verbose);


  verbose && enter(verbose, "Evaluating RSP R source code");

  # Change working directory
  opwd <- NULL;
  if ((workdir != ".") && (workdir != getwd())) {
    opwd <- getwd();
    on.exit({ if (!is.null(opwd)) setwd(opwd) }, add=TRUE);
    verbose && cat(verbose, "Temporary working directory: ", getAbsolutePath(workdir));
    setwd(workdir);
  }

  res <- rcat(rcode, output=output, envir=envir, args=NULL, ...);

  if (isFile(output)) {
    res <- RspFileProduct(output, attrs=getAttributes(res));
  } else {
    res <- RspProduct(output, attrs=getAttributes(res));
  }
  verbose && print(verbose, res);
  rcode <- output <- NULL; # Not needed anymore

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

  res;
}, protected=TRUE) # rfile()


setMethodS3("rfile", "function", function(object, ..., envir=parent.frame(), verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'object':

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "rfile() for ", class(object)[1L]);

  ## Temporarily assign the function to the evaluation environment
  ## and set its own environment also to the evaluation environment
  fcn <- object;
  environment(fcn) <- envir;
  fcnName <- tempvar(".rfcn", value=fcn, envir=envir);
  on.exit({
    rm(list=fcnName, envir=envir, inherits=FALSE);
  }, add=TRUE);

  rcode <- RspRSourceCode(sprintf("%s()", fcnName));
  res <- rfile(rcode, ..., envir=envir, verbose=verbose);

  verbose && exit(verbose);

  res;
}, protected=TRUE) # rfile()


############################################################################
# HISTORY:
# 2013-07-16
# o Added rstring(), rcat() and rfile() for function:s.
# 2013-07-14
# o Added rfile() for RspSourceCode, which now is utilized by the default
#   rfile().
# 2013-05-22
# o ROBUSTNESS: Now rfile() handles files with only one filename extension.
# 2013-02-23
# o Now rfile() can also infer default filenames from URLs with parameters.
# 2013-02-18
# o Added argument 'fake' to rfile().
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
