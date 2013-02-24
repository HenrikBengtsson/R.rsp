library("R.rsp")

rcat("A random integer in [1,100]: <%=sample(1:100, size=1)%>\n")

# Passing arguments
rcat("A random integer in [1,<%=K%>]: <%=sample(1:K, size=1)%>\n", args=list(K=50))

text <- 'The <%=n <- length(letters)%> letters in the English alphabet are:
<% for (i in 1:n) { %>
<%=letters[i]%>/<%=LETTERS[i]%><%=if(i < n) ", "-%>
<% } %>.\n'
rcat(text)
