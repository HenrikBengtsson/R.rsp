# MACRO DEFINITIONS
RM=rm -f
R=$(R_HOME)/bin/Rscript

# TARGET DEFINITIONS
all: rnw index.html

rnw: *.Rnw
	"$(R)" -e "R.rsp::buildNonSweaveVignettes()"

index.html:
	"$(R)" -e "R.rsp::buildPkgIndexHtml()"

clean:
	$(RM) index.html.rsp
	$(RM) *.aux *.bbl *.blg *.bst *.log *.out *.sty *.toc
	$(RM) *.tex *.rsp.R
	$(RM) -r figures/
	$(RM) Makefile
