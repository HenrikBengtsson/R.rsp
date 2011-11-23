#########################################################################
# MACRO DEFINITIONS
#########################################################################
RM=rm -f
MV=mv -f
CP=cp -p


#########################################################################
# TARGET DEFINITIONS
#########################################################################
all: rsp index.html

rsp:
	R --no-save --no-restore -e "files <- list.files(pattern='[.]rsp$$'); for (file in files) { library('R.rsp'); rsp(file, force=TRUE); }"

index.html.rsp:
	R --vanilla -e "file.copy(system.file('doc/templates/index.html.rsp', package='R.rsp'), to='.')"

index.html: index.html.rsp
	R --vanilla -e "library('R.rsp'); rsp('index.html.rsp')"

clean:
	$(RM) dummy.Rnw
	$(RM) index.html.rsp
	$(RM) *.aux *.log *.toc *.tex *.rsp.R
	$(RM) -r figures/
	$(RM) Makefile


#########################################################################
# HISTORY:
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
