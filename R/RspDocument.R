###########################################################################/**
# @RdocClass RspDocument
#
# @title "The RspDocument class"
#
# \description{
#  @classhierarchy
#
#  An RspDocument represents a @list of @see "RspExpression":s.
# }
# 
# @synopsis
#
# \arguments{
#   \item{expressions}{A @list of @see "RspExpression":s.}
#   \item{...}{Not used.}
# }
#
# \section{Fields and Methods}{
#  @allmethods
# }
# 
# @author
#*/###########################################################################
setConstructorS3("RspDocument", function(expressions=list(), ...) {
  extend(expressions, "RspDocument");
})


#########################################################################/**
# @RdocMethod evaluate
#
# @title "Parses, translates, and evaluates the RSP document"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{envir}{The @environment where the RSP document is evaluated.}
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns the last evaluated expression, iff any.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("evaluate", "RspDocument", function(object, envir=parent.frame(), ...) {
  rCode <- toR(object);
  evaluate(rCode, envir=envir, ...);
}) # evaluate()



#########################################################################/**
# @RdocMethod trim
#
# @title "Trims each of the RSP expressions"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{envir}{The @environment where the RSP document is evaluated.}
#   \item{...}{Not used.}
# }
#
# \value{
#  Returns the last evaluated expression, iff any.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("trim", "RspDocument", function(object, ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local function
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  trimTextParts <- function(parts, ...) {
    ## cat("TRIMMING...\n");
    # Identify RSP-only lines by looking at the preceeding
    # and succeeding text parts of each RSP part

    # This code assumes that the first and the last part in 'parts'
    # is always a "text" part.
    stopifnot(names(parts)[1] == "text");
    stopifnot(names(parts)[length(parts)] == "text");

    # Identify all text parts
    idxs <- which(names(parts) == "text");
    partsT <- unlist(parts[idxs], use.names=FALSE);

    # Find text parts that ends with a new line
    endsWithNewline <- (regexpr("(\n|\r|\r\n)[ \t\v]*$", partsT[-length(partsT)]) != -1L);
    endsWithNewline <- which(endsWithNewline);

    # Any candidates?
    if (length(endsWithNewline) > 0L) {
      # Check the following text part
      nextT <- endsWithNewline + 1L;
      partsTT <- partsT[nextT];

      # Among those, which starts with a new line?
      startsWithNewline <- (regexpr("^[ \t\v]*(\n|\r|\r\n)", partsTT) != -1L);
      startsWithNewline <- nextT[startsWithNewline];

      # Any remaining candidates?
      if (length(startsWithNewline) > 0L) {
        # Trim matching text blocks
        endsWithNewline <- startsWithNewline - 1L;

        # Trim to the right (excluding new line because it belongs to text)
        partsT[endsWithNewline] <- sub("[ \t\v]*$", "", partsT[endsWithNewline]);

        # Trim to the left (drop also any new line because it then
        # belongs to preceeding RSP expression)
        partsT[startsWithNewline] <- sub("^[ \t\v]*(\n|\r|\r\n)", "", partsT[startsWithNewline]);

        for (kk in seq_along(partsT)) {
          value <- RspText(partsT[kk]);
          parts[[idxs[kk]]] <- value;
        }
      }
    }
    ## cat("TRIMMING...done\n");

    parts;
  } # trimTextParts()

  res <- trimTextParts(object);
##  class(res) <- class(object);

  res;
}, protected=TRUE) # trim()




#########################################################################/**
# @RdocMethod toR
#
# @title "Translates the RSP document into R source code"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{engine}{A @see "RspEngine".}
#   \item{...}{Optional arguments passed to \code{toSourceCode()} for
#              the @see "RspEngine".}
# }
#
# \value{
#  Returns the R source code as an @see "RSourceCode".
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/######################################################################### 
setMethodS3("toR", "RspDocument", function(object, engine=RRspEngine(), ...) {
  # Argument 'engine':
  engine <- Arguments$getInstanceOf(engine, "RspEngine");

  toSourceCode(engine, object, ...);
}) # toR()


##############################################################################
# HISTORY:
# 2013-02-09
# o Created.
##############################################################################
