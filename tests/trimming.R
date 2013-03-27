library("R.rsp")
verbose <- Arguments$getVerbose(TRUE)

# TRIMMING:
# RSP constructs do not take up space in the output document,
# except from their returned or echoed output.
# Special case: RSP constructs on their own lines trims off:
#  (1) all surrounding whitespace,
#  (2) including the following newline, unless there is a
#      suffix specification that will be applied later.


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Assert that white-space and newline trimming works
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
text='
<%-- Assign a preprocessor variable a value from an R option.
     If not available, a default value is used. --%>
<%@string version="${\'R.rsp/HttpDaemon/RspVersion\'}" default="2.0"%>

<%-- Include the value of the preprocessor variable to the document. --%>
Current version is <%@include content="${version}"%> (at preprocessing).

<%-- Assign the value of the preprocessor variable to an R variable.
     Note how the preprocessor directive is inside a code expression --%>
<%
# This is an RSP code section
ver <- "<%@include content="${version}"%>"
%>
Current version is <%=ver%> (at runtime).

<%-- Include or exclude parts of an RSP document during preprocessing
     conditioned on the value of a preprocessor variable. --%>
<%@ifeq version="1.0"%>
<%@foo version="1.0"%>
v1.0!
<%@else%>
Not v1.0, but v<%=ver%>.
<%@endif #@ifeq version="1.0" %>

<%-- Include or exclude parts of an RSP document during preprocessing
     conditioned on the value of a preprocessor variable. --%>
<%@ifneq version="2.0"%>
<%@foo version="2.0"%>
Not v1.0!
<%@else%>
Not "not v1.0", but v<%=ver%>.
<%@endif %>
'

s <- rstring(text)

# Generate ground truth reference
text0='

Current version is 2.0 (at preprocessing).

Current version is 2.0 (at runtime).

Not v1.0, but v2.0.

Not "not v1.0", but v2.0.
'

s0 <- rstring(text0)

verbose && enter(verbose, "rstring()")
verbose && ruler(verbose, char="--- INPUT ")
cat(text)
verbose && ruler(verbose, char="--- OUTPUT ")
cat(s)
verbose && ruler(verbose, char="--- REFERENCE ")
cat(s0)
verbose && ruler(verbose)
stopifnot(all.equal(s, s0))
verbose && exit(verbose)
