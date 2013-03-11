library("R.rsp")
verbose <- Arguments$getVerbose(TRUE)

# TRIMMING:
# RSP constructs do not take up space in the output document,
# except from their returned or echoed output.
# Special case: RSP constructs on their own lines trims off:
#  (1) all surrounding whitespace,
#  (2) including the following newline, unless there is a
#      suffix specification that will be applied later.


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Assert that white-space and newline trimming works
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
text='Line #1
<%--- Nested
  <%-- comments --%> are
  <% a <- 1 %>  <%@foo bar="FALSE"%>
dropped ---%>
<%@include text=""%>
<%@include text=""%>
Line #2
<%
a <- 2
%>
<%
b <- 3
%>
Line #3
'

untils <- rev(eval(formals(parse.RspParser)$until))
untils <- setdiff(untils, "*")
for (kk in seq_along(untils)) {
  until <- untils[kk]
  verbose && enter(verbose, sprintf("Until #%d ('%s') of %d", kk, until, length(untils)))
  s <- rcompile(text, until=until, as="RspString")
  verbose && ruler(verbose)
  cat(s)
  verbose && ruler(verbose)
  verbose && exit(verbose)
}

text0='Line #1
Line #2
Line #3
'

s <- rstring(text)
cat(s)

s0 <- rstring(text0)
stopifnot(identical(s, s0))
