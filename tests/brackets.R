library(R.rsp)

x <- 42L
brackets0 <- R.rsp:::getRspBrackets()
R.rsp:::setRspBrackets("<%", "%>")
s0 <- rstring("The meaning of it all: <%= x %>\n")
cat(s0)

R.rsp:::setRspBrackets("<%!", "!%>")
s <- rstring("The meaning of it all: <%!= x !%>\n")
cat(s)

R.rsp:::setRspBrackets(brackets0)
brackets <- R.rsp:::getRspBrackets()
stopifnot(identical(brackets, brackets0))

stopifnot(all.equal(s, s0))


