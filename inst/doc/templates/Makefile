# MACRO DEFINITIONS
RM=rm -f
R=$(R_HOME)/bin/R

# TARGET DEFINITIONS
all: rnw index.html

rnw: *.Rnw
	"$(R)" --vanilla -e "R.rsp::buildNonSweaveVignettes()"

index.html:
	"$(R)" --vanilla -e "R.rsp::buildPkgIndexHtml()"

clean:
	$(RM) index.html.rsp
	$(RM) *.aux *.bbl *.blg *.bst *.log *.out *.sty *.toc *.tex *.rsp.R
	$(RM) -r figures/
	$(RM) Makefile
