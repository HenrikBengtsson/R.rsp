library("R.rsp")
verbose <- Arguments$getVerbose(TRUE)

text='
<%@string name="page_size" content="a4paper"%>
Page size: <%@string name="page_size"%>
'

text0='\nPage size: a4paper\n'

s <- rstring(text)
cat(s)

s0 <- rstring(text0)
stopifnot(all.equal(s, s0))
