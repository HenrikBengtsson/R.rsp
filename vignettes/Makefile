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
# To avoid having this file being listed as a non-Sweave vignette
# because it contains a %\VignetteIndexEntry{} line in the instructions
	"$(R)" -e "if (getRversion() < 3) unlink('NonSweaveVignettes.tex')"
	"$(R)" -e "if (getRversion() < 3) R.rsp::buildPkgIndexHtml()"

# Certain LaTeX files (e.g. bib, bst, sty) must be part of the build 
# such that they are available for R CMD check.  These are excluded
# from the install using .Rinstignore in the top-level directory.
clean:
	$(RM) enginesMap.R
	$(RM) index.html.rsp
	$(RM) dummy.Rnw dummy.R dummy.html dummy.pdf
	$(RM) *.rsp.R
	$(RM) *.tex *.aux *.bbl *.blg *.log *.out *.sty *.toc
	$(RM) -r figures/
	$(RM) Makefile

#########################################################################
# HISTORY:
# 2013-07-12
# o Now the Makefile no longer deletes LaTeX files needed by 
#   R CMD check.  These should instead be handled by .Rinstignore.
# 2013-04-01
# o Now Makefile works with both R.rsp (< 0.9.1) and R.rsp (>= 0.9.1).
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
