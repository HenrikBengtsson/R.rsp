setMethodS3("compileRsp", "default", function(..., envir=parent.frame(), force=FALSE, verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'envir':
  if (!is.environment(envir)) {
    throw("Argument 'envir' is not an environment: ", class(envir)[1]);
  }

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Translate an RSP file to an R RSP source file
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  pathname2 <- translateRsp(..., force=force, verbose=less(verbose,5));


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Run R RSP file to generate output document
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  path2 <- dirname(pathname2);
  filename2 <- basename(pathname2);

  path3 <- path2;
  filename3 <- gsub("[.](rsp|RSP)[.](r|R)$", "", filename2);
  pathname3 <- Arguments$getWritablePathname(filename3,
                                       path=path3, overwrite=TRUE);

  # Is output file up to date?
  isUpToDate <- FALSE;
  if (!force && isFile(pathname3)) {
    date <- file.info(pathname2)$mtime;
    verbose && cat(verbose, "Source file modified on: ", date);
    outDate <- file.info(pathname3)$mtime;
    verbose && cat(verbose, "Output file modified on: ", outDate);
    if (is.finite(date) && is.finite(outDate)) {
      isUpToDate <- (outDate >= date);
    }
    verbose && printf(verbose, "Output file is %sup to date.\n", ifelse(isUpToDate, "", "not "));
  }

  if (force || !isUpToDate) {
    response <- FileRspResponse(pathname3, overwrite=TRUE);
    envir$response <- response;
    sourceTo(pathname2, envir=envir);
  }

  invisible(pathname3);
}) # compileRsp()


###########################################################################
# HISTORY:
# 2009-02-23
# o Updated to use parseRsp().
# 2009-02-22
# o Created.
###########################################################################
