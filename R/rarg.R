###########################################################################/**
# @RdocFunction rarg
#
# @title "Gets a variable by name"
#
# \description{
#  @get "title".  If non-existing, the default value is returned.
# }
#
# @synopsis
#
# \arguments{
#   \item{name}{A @character string specifying the variable name.}
#   \item{default}{The default value to return.}
#   \item{coerce}{If @TRUE, the returned value is coerced to the mode
#     of the default value (unless @NULL).}
#   \item{envir}{A @environment or a named @list where to look
#     for the variable.}
#   \item{inherits}{A @logical specifying whether the enclosing frames
#     of the environment should be searched or not.}
#   \item{...}{Additional arguments pass to @see "base::get".}
# }
#
# \value{
#   Returns an object.
# }
#
# @author
#
# \seealso{
#   To retrieve command-line arguments, see @see "R.utils::cmdArg".
#   See also @see "base::mget".
# }
#
# @keyword file
# @keyword IO
# @keyword internal
#*/###########################################################################
rarg <- function(name, default=NULL, coerce=TRUE, envir=parent.frame(), inherits=TRUE, ...) {
  # Argument 'name':
  name <- as.character(name);
  stopifnot(length(name) == 1L);

  # Argument 'envir':
  if (is.list(envir)) {
  } else {
    stopifnot(is.environment(envir));
  }


  # Retrieve the variable, if available.
  value <- default;
  if (is.list(envir)) {
    if (is.element(name, names(envir))) {
      value <- envir[[name]];
    }
  } else if (exists(name, envir=envir, inherits=inherits, ...)) {
    value <- get(name, envir=envir, inherits=inherits, ...);
  }

  # Coerce?
  if (coerce) {
    if (!identical(value, default)) {
      mode <- storage.mode(default);
      if (mode != "NULL") {
        storage.mode(value) <- mode;
      }
    }
  }

  value
} # rarg()


############################################################################
# HISTORY:
# 2013-03-20
# o Created.
############################################################################
