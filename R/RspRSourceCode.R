###########################################################################/**
# @RdocClass RspRSourceCode
#
# @title "The RspRSourceCode class"
#
# \description{
#  @classhierarchy
#
#  An RspRSourceCode object is an @see "RspSourceCode" holding R source code.
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{@character strings.}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
#
# @author
#
# @keyword internal
#*/###########################################################################
setConstructorS3("RspRSourceCode", function(...) {
  extend(RspSourceCode(...), "RspRSourceCode");
})



#########################################################################/**
# @RdocMethod parse
#
# @title "Parses the R code"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns an @expression.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("parse", "RspRSourceCode", function(object, ...) {
  # Get the source code
  code <- as.character(object);

  # Write R code?
  pathname <- getOption("R.rsp/debug/writeCode", NULL);
  if (!is.null(pathname)) {
    if (regexpr("%s", pathname, fixed=TRUE) != -1) {
      pathname <- sprintf(pathname, digest::digest(code));
    }
    pathname <- Arguments$getWritablePathname(pathname, mustNotExist=FALSE);
    writeLines(code, con=pathname);
##    verbose && cat(verbose, "R source code written to file: ", pathname);
  }

  # Parse R source code
  expr <- base::parse(text=code);

  expr;
}, protected=TRUE) # parse()



#########################################################################/**
# @RdocMethod evaluate
# @aliasmethod findProcessor
#
# @title "Parses and evaluates the R code"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{envir}{The @environment in which the RSP string is evaluated.}
#   \item{args}{A named @list of arguments assigned to the environment
#     in which the RSP string is parsed and evaluated.
#     See @see "R.utils::cmdArgs".}
#   \item{...}{Optional arguments passed to @see "base::eval".}
# }
#
# \value{
#  Returns the outputted @character string, iff any.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("evaluate", "RspRSourceCode", function(object, envir=parent.frame(), args="*", ..., verbose=FALSE) {
  # Argument 'args':
  args <- cmdArgs(args);


  # Parse R RSP source code
  expr <- parse(object);

  # Assign arguments to the parse/evaluation environment
  attachLocally(args, envir=envir);

  # Evaluate R source code and capture output
  res <- capture.output({
    eval(expr, envir=envir, ...);
    # Force a last complete line
    cat("\n");
  });
  res <- paste(res, collapse="\n");

  RspStringProduct(res, attrs=getAttributes(object));
}) # evaluate()


setMethodS3("findProcessor", "RspRSourceCode", function(object, ...) {
  function(..., fake=FALSE) {
    evaluate(...);
  }
}) # findProcess()



#########################################################################/**
# @RdocMethod tangle
#
# @title "Drops all text-outputting calls from the R code"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns an @see "RspRSourceCode" objects without output calls.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("tangle", "RspRSourceCode", function(code, ...) {
  # Remember attributes
  attrs <- attributes(code);

  # Drop all .ro("...")
  excl <- (regexpr(".ro(\"", code, fixed=TRUE) != -1L);
  code <- code[!excl];

  # Replace all .ro({...}) with {...}
  idxs <- grep(".ro(", code, fixed=TRUE);
  code[idxs] <- gsub(".ro(", "", code[idxs], fixed=TRUE);
  code[idxs] <- gsub("[)]$", "", code[idxs], fixed=FALSE);

  # Reset attributes
  attributes(code) <- attrs;

  code;
}, protected=TRUE) # tangle()


##############################################################################
# HISTORY:
# 2013-03-14
# o Moved getCompleteCode() from RspRSourceCode to RspRSourceCodeFactory.
# 2013-03-12
# o Renamed annotations to metadata.
# 2013-02-23
# o Added support for getCompleteCode(..., output="stdout")
# o Added debug option() for have parse() write R code to file.
# 2013-02-16
# o Added findProcessor() for RspRSourceCode, which returns the evaluate()
#   method.
# o Added getCompleteCode() for RspRSourceCode.
# o Renamed RSourceCode to RspRSourceCode.
# 2013-02-14
# o Added tangle() for RSourceCode.
# 2013-02-11
# o Added Rdoc help.
# 2013-02-09
# o Created.
##############################################################################
