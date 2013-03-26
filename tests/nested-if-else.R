library("R.rsp")

setMethodS3("parse", "RspDocument", function(object, what=c("directives", "expressions"), ...) {
  # Argument 'what':
  what <- match.arg(what);

  class <- switch(what,
    "directives" = "RspUnparsedDirective",
    "expressions" = "RspUnparsedExpression"
  )
  idxs <- which(sapply(object, FUN=inherits, class));
  for (ii in idxs) {
    object[[ii]] <- parse(object[[ii]], ...);
  }
  object;
})

text0='

  (A,B) = (TRUE, TRUE)
'

text='
<%@string A="TRUE"%>
<%@string B="TRUE"%>

<%@ifeq A="TRUE"%>
 <%@ifeq B="TRUE"%>
  (A,B) = (TRUE, TRUE)
 <%@else # ifeq B | A %>
  (A,B) = (TRUE, FALSE)
 <%@endif # ifeq B | A %>
<%@else # ifeq A %>
 <%@ifeq B="TRUE"%>
  (A,B) = (FALSE, TRUE)
 <%@else # ifeq B | !A %>
  (A,B) = (FALSE, FALSE)
 <%@endif # ifeq B | !A %>
<%@endif # ifeq A %>
'



## d0 <- rcompile(text, until="directives", as="RspDocument")
## d1 <- parse(d0, what="directives")
##
## idx <- which(sapply(d1, FUN=inherits, "RspIfDirective"))[1L];
## stopifnot(!is.na(idx))
## d2 <- parseIfElseDirectives(d1, firstIdx=idx, verbose=verbose);
## print(d2)
##
## d3 <- preprocess(d1, verbose=-100)
##
## s <- RspString(text)
## d1 <- parse(s, until="directives")
## d2 <- parse(s, until="expressions")

s <- rstring(text)
cat(s)

s0 <- rstring(text0)
stopifnot(all.equal(s, s0))
