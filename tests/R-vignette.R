library("R.rsp")

text='
<%-------------------------------%><%@eval language="R-vignette" text="
  DIRECTIVES FOR R:

%\\VignetteIndexEntry{Paired PSCBS}
%\\VignetteKeyword{copy numbers, allele specific, parent specific, genomic aberrations}
%\\VignetteEngine{rsp}
                                                                            
"%><%----------------------------------------------------------------%>

[...]
\\title{<%@title%>}

[...]

\\keywords{<%@keywords%>}
'

rcat(text)

