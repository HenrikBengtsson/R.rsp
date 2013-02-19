library("R.rsp")

text='
<%@define version="${\'R.rsp/HttpDaemon/RspVersion\'}" default="2.0"%>
Current version is <%@ifeq version="1.0"%>1.0<%@endif%>
<%@ifeq version="2.0"%>2.0<%@endif%>
<%@ifeq version="1.0"%>
<%@foo version="3.0"%>
Text 2.0
<%@endif%>
<%@ifeq version="3.0"%>
<%@bar version="3.0"%>
<%@endif%>
\n'

rcat(text)
