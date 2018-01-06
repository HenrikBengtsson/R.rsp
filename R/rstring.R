###########################################################################/**
# @RdocDefault rstring
# @alias rstring.RspString
# @alias rstring.RspDocument
# @alias rstring.RspSourceCode
# @alias rstring.function
# @alias rstring.expression
#
# @title "Evaluates an RSP string and returns the generated string"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{A @character string with RSP markup.}
#   \item{file, path}{Alternatively, a file, a URL or a @connection from
#      with the strings are read.
#      If a file, the \code{path} is prepended to the file, iff given.}
#   \item{envir}{The @environment in which the RSP string is
#      preprocessed and evaluated.}
#   \item{args}{A named @list of arguments assigned to the environment
#     in which the RSP string is parsed and evaluated.
#     See @see "R.utils::cmdArgs".}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \value{
#   Returns an @see "RspStringProduct".
# }
#
# @examples "../incl/rstring.Rex"
#
# @author
#
# \seealso{
#  To display the output (instead of returning a string), see
#  @see "rcat".
#  For evaluating and postprocessing an RSP document and
#  writing the output to a file, see @see "rfile".
# }
#
# @keyword file
# @keyword IO
#*/###########################################################################
setMethodS3("rstring", "default", function(..., file=NULL, path=NULL, envir=parent.frame(), args="*", verbose=FALSE) {
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

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "rstring() for default");

  if (is.null(file)) {
    s <- RspString(...);
  } else {
    verbose && cat(verbose, "Input file: ", file);
    s <- .readText(file);
    s <- RspString(s, source=file, ...);
    s <- setMetadata(s, name="source", value=file);
  }
  verbose && cat(verbose, "Length of RSP string: ", nchar(s));

  res <- rstring(s, envir=envir, args=args, verbose=verbose);

  verbose && exit(verbose);

  res;
}) # rstring()


setMethodS3("rstring", "RspString", function(object, envir=parent.frame(), args="*", ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'args':
  args <- cmdArgs(args);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "rstring() for ", class(object)[1L]);

  if (length(args) > 0L) {
    verbose && enter(verbose, "Assigning RSP arguments to processing environment");
    verbose && cat(verbose, "Environment: ", getName(envir));

    verbose && cat(verbose, "RSP arguments:");
    verbose && str(verbose, args);

    # Assign arguments to the parse/evaluation environment
    names <- attachLocally(args, envir=envir);
    if (verbose) {
      if (length(names) > 0L) {
        printf(verbose, "Variables assigned: [%d] %s\n", length(names), hpaste(names));
        member <- NULL; rm(list="member"); # To please R CMD check
        ll <- subset(ll(envir=envir), member %in% names);
        print(verbose, ll);
      }
    }
    verbose && exit(verbose);
  } else {
    names <- NULL;
  }

  if (verbose) {
    enter(verbose, "Parse RSP string to RSP document");
    cat(verbose, "Parse environment: ", getName(envir));
    if (length(names) > 0L) {
      ll <- subset(ll(envir=envir), member %in% names);
      print(verbose, ll);
    }
  }
  doc <- parseDocument(object, envir=envir, ..., verbose=verbose);
  verbose && print(verbose, doc);
  verbose && exit(verbose);

  res <- rstring(doc, envir=envir, args=NULL, ..., verbose=verbose);

  verbose && exit(verbose);

  res;
}) # rstring()


setMethodS3("rstring", "RspDocument", function(object, envir=parent.frame(), ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "rstring() for ", class(object)[1L]);

  verbose && enter(verbose, "Coerce RSP document to source code");
  language <- getAttribute(object, "language", default="R");
  language <- capitalize(tolower(language));
  className <- sprintf("Rsp%sSourceCodeFactory", language);
  ns <- getNamespace("R.rsp");
  clazz <- Class$forName(className, envir=ns);
  factory <- newInstance(clazz);
  verbose && cat(verbose, "Language: ", getLanguage(factory));
  code <- toSourceCode(factory, object, verbose=verbose);
  verbose && cat(verbose, "Generated source code:");
  verbose && cat(verbose, head(code, n=3L));
  verbose && cat(verbose);
  verbose && cat(verbose, "[...]");
  verbose && cat(verbose);
  verbose && cat(verbose, tail(code, n=3L));
  verbose && exit(verbose);

  res <- rstring(code, ..., envir=envir, verbose=verbose);

  verbose && exit(verbose);

  res;
}) # rstring()


setMethodS3("rstring", "RspSourceCode", function(object, envir=parent.frame(), ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "rstring() for ", class(object)[1L]);
  verbose && cat(verbose, "Environment: ", getName(envir));

  res <- process(object, envir=envir, ..., verbose=less(verbose,10));

  verbose && exit(verbose);

  res;
}) # rstring()



setMethodS3("rstring", "function", function(object, envir=parent.frame(), ..., verbose=FALSE) {
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

  verbose && enter(verbose, "rstring() for ", class(object)[1L]);
  verbose && cat(verbose, "Environment: ", getName(envir));

  ## Temporarily assign the function to the evaluation environment
  ## and set its own environment also to the evaluation environment
  fcn <- object;
  environment(fcn) <- envir;
  fcnName <- tempvar(".rfcn", value=fcn, envir=envir);
  on.exit({
    rm(list=fcnName, envir=envir, inherits=FALSE);
  }, add=TRUE);
  code <- sprintf("%s()", fcnName);
  rcode <- RspRSourceCode(code);
  res <- rstring(rcode, envir=envir, ..., verbose=less(verbose,10));

  verbose && exit(verbose);

  res;
}) # rstring()


setMethodS3("rstring", "expression", function(object, envir=parent.frame(), ..., verbose=FALSE) {
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

  verbose && enter(verbose, "rstring() for ", class(object)[1L]);
  verbose && cat(verbose, "Environment: ", getName(envir));
  # Deparsing 'object[[1L]]' instead of 'object' in order to drop
  # the 'expression({ ... })' wrapper.
  code <- deparse(object[[1L]]);
  rcode <- RspRSourceCode(code);
  res <- rstring(rcode, envir=envir, ..., verbose=less(verbose,10));
  verbose && exit(verbose);

  res;
}) # rstring()
