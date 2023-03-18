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
  extend(RspSourceCode(...), "RspRSourceCode")
})



#########################################################################/**
# @RdocMethod parseCode
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
setMethodS3("parseCode", "RspRSourceCode", function(object, ...) {
  # Get the source code
  code <- as.character(object)

  # Write R code?
  pathname <- getOption("R.rsp/debug/writeCode", NULL)
  if (!is.null(pathname)) {
    if (regexpr("%s", pathname, fixed=TRUE) != -1) {
      pathname <- sprintf(pathname, digest(code))
    }
    pathname <- Arguments$getWritablePathname(pathname, mustNotExist=FALSE)
    writeLines(code, con=pathname)
##    verbose && cat(verbose, "R source code written to file: ", pathname)
  }

  # Parse R source code
  expr <- base::parse(text=code)

  expr
}, protected=TRUE)



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
#   \item{output}{A @character string specifying how the RSP output
#     should be handled/returned.}
#   \item{...}{Not used.}
# }
#
# \value{
#  If \code{output="stdout"}, then @NULL is returned and the RSP output
#  is sent to the standard output.  This is output is "non-buffered",
#  meaning it will be sent to the output as soon as it is generated.
#  If \code{output="RspStringProduct"}, then the output is captured
#  and returned as an @see "RspStringProduct" with attributes set.
# }
#
# @author
#
# \seealso{
#   @seeclass
# }
#*/#########################################################################
setMethodS3("evaluate", "RspRSourceCode", function(object, envir=parent.frame(), args="*", output=c("RspStringProduct", "stdout"), ..., verbose=FALSE) {
  # Argument 'envir':
  envir <- as.environment(envir)

  # Argument 'args':
  args <- cmdArgs(args)

  # Argument 'output':
  output <- match.arg(output)


  # Parse R RSP source code
  expr <- parseCode(object)

  # Assign arguments to the parse/evaluation environment
  attachLocally(args, envir=envir)

  if (output == "RspStringProduct") {
##    # The default capture.output() uses textConnection()
##    # which is much slower than rawConnection().
##    res <- capture.output({
##      eval(expr, envir = envir, enclos = baseenv())
##      # Force a last complete line
##      cat("\n")
##    })
##    res <- paste(res, collapse="\n")

    # Evaluate R source code and capture output
    file <- rawConnection(raw(0L), open="w")
    on.exit({
      if (!is.null(file)) close(file)
    }, add=TRUE)
    capture.output({ eval(expr, envir = envir, enclos = baseenv()) }, file=file)
    res <- rawToChar(rawConnectionValue(file))
    close(file); file <- NULL

    res <- RspStringProduct(res, attrs=getAttributes(object))

    # Update metadata?
    if (exists("rmeta", mode="function", envir=envir)) {
      rmeta <- get("rmeta", mode="function", envir=envir)
      res <- setMetadata(res, rmeta())
    }
  } else if (output == "stdout") {
    eval(expr, envir = envir, enclos = baseenv())
    # Force a last complete line
    cat("\n")
    res <- NULL
  }

  res
}, createGeneric=FALSE) # evaluate()


setMethodS3("findProcessor", "RspRSourceCode", function(object, ...) {
  function(...) {
    evaluate(...)
  }
}) # findProcess()



setMethodS3("tidy", "RspRSourceCode", function(object, format=c("asis", "tangle", "safetangle", "demo", "unsafedemo"), collapse="\n", ...) {
  # Argument 'format':
  format <- match.arg(format)

  # Record attributes
  attrs <- attributes(object)

  code <- object

  if (is.element(format, c("tangle", "safetangle", "demo", "unsafedemo"))) {
    # Drop header
    idx <- grep('## RSP source code script [BEGIN]', code, fixed=TRUE)[1L]
    if (!is.na(idx)) code <- code[-seq_len(idx+1L)]
    # Drop footer
    idx <- grep('## RSP source code script [END]', code, fixed=TRUE)[1L]
    if (!is.na(idx)) code <- code[seq_len(idx-2L)]
  }

  if (format == "demo") {
    # (a) Display a cleaner .rout()
    hdr <- c('.rout <- function(x)\n  cat(paste(x, sep="", collapse=""))')
    code <- c(hdr, code)
  } else if (format == "unsafedemo") {
    # NOTE: The generated demo code may not display properly
    # (a) Replace .rout(<code chunk>) with cat(<code chunk>)
    for (rout in c(".rout0", ".rout")) {
      pattern <- sprintf('^%s', rout)
      idxs <- grep(pattern, code, fixed=FALSE)
      if (length(idxs) > 0L) {
        code[idxs] <- gsub(rout, "cat", code[idxs], fixed=TRUE)
      }
    }
  } else if (is.element(format, c("tangle", "safetangle"))) {
    # (a) Drop all .rout("...")
    idxs <- grep('^.rout[(]"', code, fixed=FALSE)
    if (length(idxs) > 0L) {
      code <- code[-idxs]
    }

    if (format == "tangle") {
      # (b) Drop all .rout0(...)
      idxs <- grep('^.rout0[(]', code, fixed=FALSE)
      if (length(idxs) > 0L) {
        code <- code[-idxs]
      }
    }

    # (c) Replace .rout(<code chunk>) with (<code chunk>).
    for (rout in c(".rout0", ".rout")) {
      pattern <- sprintf('^%s[(]', rout)
      idxs <- grep(pattern, code, fixed=FALSE)
      if (length(idxs) > 0L) {
        first <- nchar(rout) + 2L
        code[idxs] <- substring(code[idxs], first=first, last=nchar(code[idxs])-1L)
      }
    }
  } # if (format ...)

  # Collapse?
  if (!is.null(collapse)) {
    code <- paste(code, collapse=collapse)
  }

  # Recreate RSP source code object, i.e. restore attributes (if lost)
  object <- code
  attributes(object) <- attrs

  object
})


setMethodS3("tangle", "RspRSourceCode", function(code, format=c("safetangle", "tangle"), ...) {
  format <- match.arg(format)
  tidy(code, format=format)
})
