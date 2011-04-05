#########################################################################
# MACRO DEFINITIONS
#########################################################################
RM=rm -f
MV=mv -f
CP=cp -p


#########################################################################
# TARGET DEFINITIONS
#########################################################################
all: rsp index

rsp:
	R --no-save --no-restore -e "library('R.rsp'); rsptex('report.tex.rsp', force=TRUE)"

index: index.html.rsp
	R --vanilla -e "library('R.rsp'); rspToHtml('index.html.rsp')"
	$(MV) index.html.html index.html

clean:
	$(RM) *.Rnw
	$(RM) *.aux *.log *.toc *.tex *.tex.rsp.R
	$(RM) -r figures/
	$(RM) index.html.rsp
	$(RM) Makefile


#########################################################################
# HISTORY:
# 2011-04-04
# o Added macro definitions.
#########################################################################
