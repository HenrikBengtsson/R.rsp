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
	"$(R)" -e "R.rsp::buildNonSweaveTexToPdf()"

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

#########################################################################
# HISTORY:
# 2013-03-05
# o Now using $(R_HOME)/bin/Rscript to avoid the --vanilla argument.
# 2012-06-22
# o Now using $(R_HOME)/bin/R. Thanks Kasper Hansen for the suggestion.
# 2012-03-20
# o Now removing more files in the cleanup.
# 2012-01-21
# o Now removing more files in the cleanup.
# 2011-11-23
# o Now utilizing new buildNowSweaveVignettes().
# 2011-11-22
# o Now this Makefile is completely generic and no longer needs
#   to be modified.
# o Now this Makefile compiles all *.rsp files it finds.
# o Now the index.html.rsp template is copied from the R.rsp package.
# o No longer deleting the dummy *.Rnw files, because they are needed
#   in order for R to believe there are (Sweave) vignettes.  This trick
#   makes the PDFs to show up with browseVignettes() and on CRAN.
# 2011-04-13
# o Now using new rsp() throughout.
# 2011-04-04
# o Added macro definitions.
#########################################################################
