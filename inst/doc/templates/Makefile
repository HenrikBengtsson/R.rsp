# MACRO DEFINITIONS
RM=rm -f
R=$(R_HOME)/bin/Rscript

# TARGET DEFINITIONS
all: vignettes tex index.html

# Build all vignettes that has a %\VignetteBuild{} markup
vignettes:
	"$(R)" -e "if (getRversion() < 3) R.rsp::buildNonSweaveVignettes()"

# Compile any TeX files for which a PDF is missing
tex:
	"$(R)" -e "if (packageVersion('R.rsp') >= '0.9.1') R.rsp::buildNonSweaveTexToPdf()"

# Create an HTML vignette index page
index.html:
	"$(R)" -e "if (getRversion() < 3) R.rsp::buildPkgIndexHtml()"

clean:
	$(RM) enginesMap.R
	$(RM) dummy.Rnw
	$(RM) index.html.rsp
	$(RM) *.aux *.bbl *.blg *.bst *.log *.out *.sty *.toc
	$(RM) *.tex
	$(RM) *.rsp.R
	$(RM) -r figures/
	$(RM) Makefile
