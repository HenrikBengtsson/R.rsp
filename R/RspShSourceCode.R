###########################################################################/**
# @RdocClass RspShSourceCode
#
# @title "The RspShSourceCode class"
#
# \description{
#  @classhierarchy
#
#  An RspShSourceCode object is an @see "RspSourceCode" holding R source code.
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
setConstructorS3("RspShSourceCode", function(...) {
  extend(RspSourceCode(...), "RspShSourceCode");
})



#########################################################################/**
# @RdocMethod evaluate
# @aliasmethod findProcessor
#
# @title "Evaluates the shell (sh) code"
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
setMethodS3("evaluate", "RspShSourceCode", function(object, envir=parent.frame(), args="*", ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local functions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  evalSh <- function(text, ...) {
    pathnameT <- tempfile(pattern="RSP-sh-", fileext=".sh")
    writeLines(text, con=pathnameT);
    on.exit({
      file.remove(pathnameT);
    })
    res <- system2("sh", args=list(pathnameT), stdout=TRUE);
    res <- paste(res, collapse="\n");
    res;
  } # evalSh()


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'args':
  args <- cmdArgs(args=args);


  code <- object;

  # Assign arguments to the parse/evaluation environment
  attachLocally(args, envir=envir);

  # Evaluate R source code and capture output
  res <- evalSh(code);

  RspStringProduct(res, type=getType(object));
}) # evaluate()


setMethodS3("findProcessor", "RspShSourceCode", function(object, ...) {
  function(...) {
    evaluate(...);
  }
}) # findProcess()



##############################################################################
# HISTORY:
# 2013-03-14
# o Created from RspRSourceCode.
##############################################################################
