###########################################################################/**
# @RdocDefault findAsciiDoc
#
# @title "Locates the asciidoc executable"
#
# \description{
#  @get "title" on the current system.
# }
#
# @synopsis
#
# \arguments{
#   \item{mustExist}{If @TRUE, an exception is thrown if the executable
#      could not be located.}
#   \item{...}{Not used.}
#   \item{verbose}{See @see "R.utils::Verbose".}
# }
#
# \details{
#  The 'asciidoc' executable is searched for as follows:
#  \enumerate{
#   \item \code{Sys.which("asciidoc")}
#  }
# }
#
# @author
#*/###########################################################################
setMethodS3("findAsciiDoc", "default", function(mustExist=TRUE, ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'mustExist':
  mustExist <- Arguments$getLogical(mustExist);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "Locating 'asciidoc' software");

  command <- "asciidoc";
  verbose && cat(verbose, "Command: ", command);

  pathname <- Sys.which(command);
  if (identical(pathname, "")) pathname <- NULL;
  if (!isFile(pathname)) pathname <- NULL;

  verbose && cat(verbose, "Located pathname: ", pathname);

  if (mustExist && !isFile(pathname)) {
    throw(sprintf("Failed to located Perl (executable '%s').", command));
  }

  verbose && exit(verbose);

  pathname;
}) # findAsciiDoc()


############################################################################
# HISTORY:
# 2013-03-29
# o Created.
############################################################################
