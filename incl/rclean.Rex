# RSP-embedded text to a preprocessed and validated RSP string
s <- rclean('Current <%@include content="time"%> is <%=Sys.time()%>\n')
print(s)
