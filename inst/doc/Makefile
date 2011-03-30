all: rsp index

rsp:
	R --no-save --no-restore -e "library('R.rsp'); rsptex('report.tex.rsp', force=TRUE)"

index: index.html.rsp
	R --vanilla -e "library('R.rsp'); rspToHtml('index.html.rsp')"
	mv -f index.html.html index.html

clean:
	$(RM) -f *.Rnw
	$(RM) -f *.aux *.log *.toc *.tex *.tex.rsp.R
	$(RM) -rf figures/
	$(RM) -f index.html.rsp
	$(RM) -f Makefile
