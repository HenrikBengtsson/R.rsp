library("R.rsp")
verbose <- Arguments$getVerbose(TRUE)

text='You don\'t have to worry too much about whitespace, e.g. the
  <%
     s <- "will have its surrounding whitespace"
  %>
above RSP expression <%=s%>
trimmed off as well as its trailing line break.
'

text0='You don\'t have to worry too much about whitespace, e.g. the
above RSP expression will have its surrounding whitespace
trimmed off as well as its trailing line break.
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

s <- rstring(text)
cat(s)

s0 <- rstring(text0)
stopifnot(all.equal(s, s0))
