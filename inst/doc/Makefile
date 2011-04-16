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
	R --no-save --no-restore -e "library('R.rsp'); rsp('report.tex.rsp', force=TRUE)"

index: index.html.rsp
	R --vanilla -e "library('R.rsp'); rsp('index.html.rsp')"

clean:
	$(RM) *.Rnw
	$(RM) index.html.rsp
	$(RM) *.aux *.log *.toc *.tex *.rsp.R
	$(RM) -r figures/
	$(RM) Makefile


#########################################################################
# HISTORY:
# 2011-04-13
# o Now using new rsp() throughout.
# 2011-04-04
# o Added macro definitions.
#########################################################################
