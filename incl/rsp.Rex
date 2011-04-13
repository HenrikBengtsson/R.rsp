# EXAMPLE #1
rsp(text="A random number in [1,100]: <%=sample(1:100, size=1)%>\n")

# EXAMPLE #2
path <- system.file("doc", package="R.rsp")
pathname <- rsp("report.tex.rsp", path=path)
printf("Created document: %s\n", pathname)

