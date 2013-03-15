# RSP-embedded text to a preprocessed and validated RSP string
s <- rclean('Current <%@include text="time"%> is <%=Sys.time()%>\n')
print(s)
