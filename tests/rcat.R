library("R.rsp")

rcat("A random integer in [1,100]: <%=sample(1:100, size=1)%>\n")

# Passing arguments
rcat("A random integer in [1,<%=K%>]: <%=sample(1:K, size=1)%>\n", args=list(K=50))


