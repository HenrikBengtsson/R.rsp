###########################################################################/**
# @RdocDefault rargs
#
# @title "Expands a set of arguments"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{args}{A @vector or a @list of arguments.}
#   \item{defaults}{A named @list of default arguments.}
#   \item{unique}{If @TRUE, the returned set of arguments contains only
#     unique arguments such that if two or more arguments has then same
#     name, it is only the last occurance that is returned.}
#   \item{...}{Not used.}
# }
#
# \value{
#   Returns a named @list of arguments, where all arguments have a name.
# }
#
# \details{
#   All elements of argument \code{args} must be named, except for so called
#   argument templates which have special meanings.  Currently the following
#   template is supported:
#   \itemize{
#    \item \code{"*"}: 
#      Will replaced by the parsed and cleanup set of command line arguments
#      used when launching R.  More precise, it will take the value of
#      \code{R.utils::commandArgs(asValues=TRUE, excludeReserved=TRUE)[-1L]}.
#      For further details, see @see "R.utils::commandArgs".
#      By default, the values of these command line arguments are
#      @character strings.  However, if \code{args} or \code{defaults}
#      contain arguments with the same names, the corresponding command
#      line arguments are coerced to their data types.
#   }
#
#   If argument \code{args} is a @vector (non-list), then it is coerced to
#   a @list via @see "as.list".  This is supported only for the purpose of
#   being able to specify \code{args="*"} instead of \code{args=list("*")}.
# }
#
# @examples "../incl/rargs.Rex"
#
# @author
#*/###########################################################################
setMethodS3("rargs", "default", function(args="*", defaults=list(), unique=TRUE, ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local functions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  assertNamedList <- function(x, .name=as.character(substitute(x))) {
    # Nothing todo?
    if (length(x) == 0L) return(x);

    keys <- names(x);
    if (is.null(keys)) {
      throw(sprintf("None of the elements in '%s' are named.", .name));
    }
  
    if (any(nchar(keys) == 0L)) {
      throw(sprintf("Detected one or more non-named arguments in '%s' after parsing.", .name));
    }

    x;
  } # assertNamedList()


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'args':
  args <- as.list(args);

  # Argument 'defaults':
  defaults <- as.list(defaults);
  defaults <- assertNamedList(defaults);


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Prepend defaults
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  args <- c(defaults, args);

  # Allocate result
  argsR <- list();

  # Nothing to do?
  if (length(args) == 0L) {
    return(argsR);
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Record data types of explicitly named arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  keys <- names(args);
  if (length(keys) > 0L) {
    types <- sapply(args[(nchar(keys) > 0L)], FUN=storage.mode);
  } else {
    types <- c();
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Expand arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  for (kk in seq_along(args)) {
    key <- keys[kk];

    # Unnamed argument?
    if (is.null(key) || nchar(key) == 0L) {
      value <- args[[kk]];
      if (identical(value, "*")) {
        argsT <- R.utils::commandArgs(asValues=TRUE, excludeReserved=TRUE)[-1L];

        # Corce arguments to known data types
        keysT <- names(argsT);
        idxs <- which(is.element(keysT, names(types)));
        if (length(idxs) > 0L) {
          argsTT <- argsT[idxs];
          typesTT <- types[names(argsTT)];
          for (jj in seq_along(argsTT)) {
            storage.mode(argsTT[[jj]]) <- typesTT[jj];
          }
          argsT[idxs] <- argsTT;
        }
      } else {
        throw(sprintf("Unknown argument template (cannot expand): '%s'", key));
      }
      arg <- argsT;
    } else {
      arg <- args[kk];
    }

##    printf("Argument #%d:\n", kk); str(arg);

    # Append
    if (length(arg) > 0L) {
      argsR <- append(argsR, arg);
    }
  } # for (kk ...)

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  argsR <- assertNamedList(argsR);


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Keep unique arguments?
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (unique && length(argsR) > 0L) {
    keep <- !duplicated(names(argsR), fromLast=TRUE);
    argsR <- argsR[keep];
  }

  argsR;
}, protected=TRUE) # rargs()



##############################################################################
# HISTORY:
# 2013-02-16
# o Added rargs().
##############################################################################
