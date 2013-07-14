library("R.rsp")

rcode <- rscript('# Report <%=i%>\n\nHello world!\n')
print(rcode)

for (i in 1:5) {
  output <- sprintf("report,i=%i.md", i)
  res <- rfile(rcode, output=output, args=list(i=i))
  print(res)
}
