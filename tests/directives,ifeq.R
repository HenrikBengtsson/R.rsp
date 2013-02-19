library("R.rsp")

text='
<%@define version="${\'R.rsp/HttpDaemon/RspVersion\'}" default="2.0"%>
Current version is <%=version%>.
<%@ifeq version="1.0"%>
<%@foo version="1.0"%>
v1.0!
<%@else%>
Not v1.0, but v<%=version%>.
<%@endif%>
<%@ifneq version="2.0"%>
<%@foo version="2.0"%>
Not v1.0!
<%@else%>
Not "not v1.0", but v<%=version%>.
<%@endif%>
\n'

rcat(text)
