# Makefile for R packages

# CORE MACROS
ifeq ($(OS), Windows_NT)
CD=cd
CURDIR=$(subst \,/,"$(shell cmd.exe /C cd)")
else
CD=cd -P "$(CURDIR)"; cd   # This handles the case when CURDIR is a softlink
endif
CP=cp
MAKE=make
MV=mv
RM=rm -f
MKDIR=mkdir -p
RMDIR=$(RM) -r

# PACKAGE MACROS
PKG_VERSION := $(shell grep -i ^version DESCRIPTION | cut -d : -d \  -f 2)
PKG_NAME    := $(shell grep -i ^package DESCRIPTION | cut -d : -d \  -f 2)
PKG_DIR     := $(shell basename "$(CURDIR)")
PKG_DIR     := $(CURDIR)
PKG_TARBALL := $(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_ZIP     := $(PKG_NAME)_$(PKG_VERSION).zip
PKG_TGZ     := $(PKG_NAME)_$(PKG_VERSION).tgz

# FILE MACROS
FILES_R := $(wildcard R/*.R)
FILES_DATA := $(wildcard data/*)
FILES_MAN := $(wildcard man/*.Rd)
FILES_INCL := $(wildcard incl/*)
FILES_INST := $(wildcard inst/* inst/*/* inst/*/*/* inst/*/*/*/*)
FILES_VIGNETTES := $(wildcard vignettes/* vignettes/.install_extras)
FILES_SRC := $(wildcard src/* src/*/* src/*/*/* src/*/*/*/* src/*/*/*/*/* src/*/*/*/*/*/* src/*/*/*/*/*/*/* src/*/*/*/*/*/*/*/*)
FILES_TESTS := $(wildcard tests/*.R)
FILES_NEWS := $(wildcard NEWS inst/NEWS)
FILES_ROOT := DESCRIPTION NAMESPACE $(wildcard .Rbuildignore .Rinstignore)
PKG_FILES := $(FILES_ROOT) $(FILES_NEWS) $(FILES_R) $(FILES_DATA) $(FILES_MAN) $(FILES_INST) $(FILES_VIGNETTES) $(FILES_SRC) $(FILES_TESTS)
FILES_MAKEFILE := $(wildcard ../../Makefile)

# Has vignettes in 'vignettes/' or 'inst/doc/'?
DIR_VIGNS := $(wildcard vignettes inst/doc)

# R MACROS
R = R
R_SCRIPT = Rscript
R_HOME := $(shell echo "$(R_HOME)" | tr "\\\\" "/")

## R_USE_CRAN := $(shell $(R_SCRIPT) -e "cat(Sys.getenv('R_USE_CRAN', 'FALSE'))")
R_NO_INIT := --no-init-file
R_VERSION_STATUS := $(shell $(R_SCRIPT) -e "status <- tolower(R.version[['status']]); if (regexpr('unstable', status) != -1L) status <- 'devel'; cat(status)")
R_VERSION_X_Y := $(shell $(R_SCRIPT) -e "cat(gsub('[.][0-9]+$$', '', getRversion()))")
R_VERSION := $(shell $(R_SCRIPT) -e "cat(as.character(getRversion()))")
R_VERSION_FULL := $(R_VERSION)$(R_VERSION_STATUS)
R_LIBS_USER_X := $(shell $(R_SCRIPT) -e "cat(.libPaths()[1])")
R_OUTDIR := ../_R-$(R_VERSION_FULL)
## R_BUILD_OPTS := 
## R_BUILD_OPTS := $(R_BUILD_OPTS) --no-build-vignettes
R_CHECK_OUTDIR := $(R_OUTDIR)/$(PKG_NAME).Rcheck
_R_CHECK_CRAN_INCOMING_ = $(shell $(R_SCRIPT) -e "cat(Sys.getenv('_R_CHECK_CRAN_INCOMING_', 'FALSE'))")
_R_CHECK_XREFS_REPOSITORIES_ = $(shell if $(_R_CHECK_CRAN_INCOMING_) = "TRUE"; then echo ""; else echo "invalidURL"; fi)
_R_CHECK_FULL_ = $(shell $(R_SCRIPT) -e "cat(Sys.getenv('_R_CHECK_FULL_', ''))")
R_CHECK_OPTS = --as-cran --timings
R_RD4PDF = $(shell $(R_SCRIPT) -e "if (getRversion() < 3) cat('times,hyper')")
R_CRAN_OUTDIR := $(R_OUTDIR)/$(PKG_NAME)_$(PKG_VERSION).CRAN

HAS_ASPELL := $(shell $(R_SCRIPT) -e "cat(Sys.getenv('HAS_ASPELL', !is.na(utils:::aspell_find_program('aspell'))))")

all: build install check


# Displays macros
debug: 
	@echo CURDIR=\'$(CURDIR)\'
	@echo R_HOME=\'$(R_HOME)\'
	@echo
	@echo PKG_DIR=\'$(PKG_DIR)\'
	@echo PKG_NAME=\'$(PKG_NAME)\'
	@echo PKG_VERSION=\'$(PKG_VERSION)\'
	@echo PKG_TARBALL=\'$(PKG_TARBALL)\'
	@echo
	@echo HAS_ASPELL=\'$(HAS_ASPELL)\'
	@echo
	@echo R=\'$(R)\'
##	@echo R_USE_CRAN=\'$(R_USE_CRAN)\'
	@echo R_NO_INIT=\'$(R_NO_INIT)\'
	@echo R_SCRIPT=\'$(R_SCRIPT)\'
	@echo R_VERSION_X_Y=\'$(R_VERSION_X_Y)\'
	@echo R_VERSION=\'$(R_VERSION)\'
	@echo R_VERSION_STATUS=\'$(R_VERSION_STATUS)\'
	@echo R_VERSION_FULL=\'$(R_VERSION_FULL)\'
	@echo R_LIBS_USER_X=\'$(R_LIBS_USER_X)\'
	@echo R_OUTDIR=\'$(R_OUTDIR)\'
	@echo
	@echo "Default packages:" $(shell $(R) --slave -e "cat(paste(getOption('defaultPackages'), collapse=', '))")
	@echo
	@echo R_BUILD_OPTS=\'$(R_BUILD_OPTS)\'
	@echo
	@echo R_CHECK_OUTDIR=\'$(R_CHECK_OUTDIR)\'
	@echo _R_CHECK_CRAN_INCOMING_=\'$(_R_CHECK_CRAN_INCOMING_)\'
	@echo _R_CHECK_XREFS_REPOSITORIES_=\'$(_R_CHECK_XREFS_REPOSITORIES_)\'
	@echo _R_CHECK_FULL_=\'$(_R_CHECK_FULL_)\'
	@echo R_CHECK_OPTS=\'$(R_CHECK_OPTS)\'
	@echo R_RD4PDF=\'$(R_RD4PDF)\'
	@echo
	@echo R_CRAN_OUTDIR=\'$(R_CRAN_OUTDIR)\'


debug_full: debug
	@echo
	@echo FILES_ROOT=\'$(FILES_ROOT)\'
	@echo FILES_R=\'$(FILES_R)\'
	@echo FILES_DATA=\'$(FILES_DATA)\'
	@echo FILES_MAN=\'$(FILES_MAN)\'
	@echo FILES_INST=\'$(FILES_INST)\'
	@echo FILES_VIGNETTES=\'$(FILES_VIGNETTES)\'
	@echo FILES_SRC=\'$(FILES_SRC)\'
	@echo FILES_TESTS=\'$(FILES_TESTS)\'
	@echo FILES_INCL=\'$(FILES_INCL)\'
	@echo
	@echo DIR_VIGNS=\'$(DIR_VIGNS)\'
	@echo dirname\(DIR_VIGNS\)=\'$(shell dirname $(DIR_VIGNS))\'



# Update existing packages
update:
	$(R_SCRIPT) -e "try(update.packages(ask=FALSE)); source('http://bioconductor.org/biocLite.R'); biocLite(ask=FALSE);"

# Install missing dependencies
deps: DESCRIPTION
	$(MAKE) update
	$(R_SCRIPT) -e "x <- unlist(strsplit(read.dcf('DESCRIPTION',fields=c('Depends', 'Imports', 'Suggests')),',')); x <- gsub('([[:space:]]*|[(].*[)])', '', x); libs <- .libPaths()[file.access(.libPaths(), mode=2) == 0]; x <- unique(setdiff(x, c('R', rownames(installed.packages(lib.loc=libs))))); if (length(x) > 0) { try(install.packages(x)); x <- unique(setdiff(x, c('R', rownames(installed.packages(lib.loc=libs))))); source('http://bioconductor.org/biocLite.R'); biocLite(x); }"

setup:	update deps
	$(R_SCRIPT) -e "source('http://aroma-project.org/hbLite.R'); hbLite('R.oo')"


ns:
	$(R_SCRIPT) -e "library('$(PKG_NAME)'); source('X:/devtools/NAMESPACE.R'); writeNamespaceSection('$(PKG_NAME)'); writeNamespaceImports('$(PKG_NAME)');"

# Build source tarball
$(R_OUTDIR)/$(PKG_TARBALL): $(PKG_FILES)
	$(MKDIR) $(R_OUTDIR)
	$(RM) $@
	$(CD) $(R_OUTDIR);\
	$(R) $(R_NO_INIT) CMD build $(R_BUILD_OPTS) $(PKG_DIR)

build: $(R_OUTDIR)/$(PKG_TARBALL)

build_force:
	$(RM) $(R_OUTDIR)/$(PKG_TARBALL)
	$(MAKE) install

# Make sure the tarball is readable
build_fix: $(R_OUTDIR)/$(PKG_TARBALL)
ifeq ($(OS), Windows_NT)
  ifeq ($(USERNAME), hb)
	$(MKDIR) X:/tmp/$(R_VERSION_FULL)
	$(CP) -f $< X:/tmp/$(R_VERSION_FULL)/
	$(RM) $<
	$(MV) X:/tmp/$(R_VERSION_FULL)/$(<F) $<
  endif
endif


# Install on current system
$(R_LIBS_USER_X)/$(PKG_NAME)/DESCRIPTION: $(R_OUTDIR)/$(PKG_TARBALL) build_fix
	$(CD) $(R_OUTDIR);\
	$(R) --no-init-file CMD INSTALL $(PKG_TARBALL)

install: $(R_LIBS_USER_X)/$(PKG_NAME)/DESCRIPTION

install_force:
	$(RM) $(R_LIBS_USER_X)/$(PKG_NAME)/DESCRIPTION
	$(MAKE) install


# Check source tarball
$(R_CHECK_OUTDIR)/.check.complete: $(R_OUTDIR)/$(PKG_TARBALL) build_fix
	$(CD) $(R_OUTDIR);\
	$(RM) -r $(PKG_NAME).Rcheck;\
	export _R_CHECK_CRAN_INCOMING_=$(_R_CHECK_CRAN_INCOMING_);\
	export _R_CHECK_CRAN_INCOMING_USE_ASPELL_=$(HAS_ASPELL);\
	export _R_CHECK_XREFS_REPOSITORIES_=$(_R_CHECK_XREFS_REPOSITORIES_);\
	export _R_CHECK_DOT_INTERNAL_=1;\
	export _R_CHECK_USE_CODETOOLS_=1;\
	export _R_CHECK_FORCE_SUGGESTS_=0;\
	export R_RD4PDF=$(R_RD4PDF);\
	export _R_CHECK_FULL_=$(_R_CHECK_FULL_);\
	$(R) --no-init-file CMD check $(R_CHECK_OPTS) $(PKG_TARBALL);\
	echo done > $(PKG_NAME).Rcheck/.check.complete

check: $(R_CHECK_OUTDIR)/.check.complete


check_force:
	$(RM) -r $(R_CHECK_OUTDIR)
	$(MAKE) check


# Install and build binaries
$(R_OUTDIR)/$(PKG_ZIP): $(R_OUTDIR)/$(PKG_TARBALL) build_fix
	$(CD) $(R_OUTDIR);\
	$(R) --no-init-file CMD INSTALL --build --merge-multiarch $(PKG_TARBALL)

binary: $(R_OUTDIR)/$(PKG_ZIP)


# Check the line width of incl/*.(R|Rex) files [max 100 chars in R devel]
check_Rex:
	$(R_SCRIPT) -e "if (!file.exists('incl')) quit(status=0); setwd('incl/'); fs <- dir(pattern='[.](R|Rex)$$'); ns <- sapply(fs, function(f) max(nchar(readLines(f)))); ns <- ns[ns > 100]; print(ns); if (length(ns) > 0L) quit(status=1)"


# Build Rd help files from Rdoc comments
Rd: check_Rex
	$(R_SCRIPT) -e "setwd('..'); Sys.setlocale(locale='C'); R.oo::compileRdoc('$(PKG_NAME)', path='$(PKG_DIR)')"

%.Rd:
	$(R_SCRIPT) -e "setwd('..'); Sys.setlocale(locale='C'); R.oo::compileRdoc('$(PKG_NAME)', path='$(PKG_DIR)', '$*.R')"

missing_Rd:
	$(R_SCRIPT) -e "x <- readLines('$(R_CHECK_OUTDIR)/00check.log'); from <- grep('Undocumented code objects:', x)+1; if (length(from) > 0L) { to <- grep('All user-level objects', x)-1; x <- x[from:to]; x <- gsub('^[ ]*', '', x); x <- gsub('[\']', '', x); cat(x, sep='\n', file='999.missingdocs.txt'); }"

spell_Rd:
	$(R_SCRIPT) -e "f <- list.files('man', pattern='[.]Rd$$', full.names=TRUE); utils::aspell(f, filter='Rd')"


spell_NEWS:
	$(R_SCRIPT) -e "utils::aspell('$(FILES_NEWS)')"

spell:
	$(R_SCRIPT) -e "utils::aspell('DESCRIPTION', filter='dcf')"


# Build package vignettes
$(R_OUTDIR)/vigns: install
	$(MKDIR) $(R_OUTDIR)/vigns/$(shell dirname $(DIR_VIGNS))
	$(CP) DESCRIPTION $(R_OUTDIR)/vigns/
	$(CP) -r $(DIR_VIGNS) $(R_OUTDIR)/vigns/$(shell dirname $(DIR_VIGNS))
	$(CD) $(R_OUTDIR)/vigns;\
	$(R_SCRIPT) -e "v <- tools::buildVignettes(dir='.'); file.path(getwd(), v[['outputs']])"

vignettes: $(R_OUTDIR)/vigns


# Run package tests
$(R_OUTDIR)/tests/%.R: $(FILES_TESTS)
	$(RMDIR) $(R_OUTDIR)/tests
	$(MKDIR) $(R_OUTDIR)/tests
	$(CP) $? $(R_OUTDIR)/tests

test_files: $(R_OUTDIR)/tests/*.R

test: $(R_OUTDIR)/tests/%.R
	$(CD) $(R_OUTDIR)/tests;\
	$(R_SCRIPT) -e "for (f in list.files(pattern='[.]R$$')) { print(f); source(f, echo=TRUE) }"

test_full: $(R_OUTDIR)/tests/%.R
	$(CD) $(R_OUTDIR)/tests;\
	export _R_CHECK_FULL_=TRUE;\
	$(R_SCRIPT) -e "for (f in list.files(pattern='[.]R$$')) { print(f); source(f, echo=TRUE) }"



# Run extensive CRAN submission checks
$(R_CRAN_OUTDIR)/$(PKG_TARBALL): $(R_OUTDIR)/$(PKG_TARBALL) build_fix
	$(MKDIR) $(R_CRAN_OUTDIR)
	$(CP) $(R_OUTDIR)/$(PKG_TARBALL) $(R_CRAN_OUTDIR)

$(R_CRAN_OUTDIR)/$(PKG_NAME),EmailToCRAN.txt: $(R_CRAN_OUTDIR)/$(PKG_TARBALL)
	$(CD) $(R_CRAN_OUTDIR);\
	$(R_SCRIPT) -e "RCmdCheckTools::testPkgsToSubmit(delta=2/3)"

cran_setup: $(R_CRAN_OUTDIR)/$(PKG_TARBALL)
	$(R_SCRIPT) -e "if (!nzchar(system.file(package='RCmdCheckTools'))) { source('http://aroma-project.org/hbLite.R'); hbLite('RCmdCheckTools', devel=TRUE); }"

cran: cran_setup $(R_CRAN_OUTDIR)/$(PKG_NAME),EmailToCRAN.txt

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Local repositories
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ifeq ($(OS), Windows_NT)
REPOS_PATH = T:/My\ Repositories/braju.com/R
else
REPOS_PATH = /tmp/hb/repositories/braju.com/R
endif
REPOS_SRC := $(REPOS_PATH)/src/contrib

$(REPOS_SRC):
	$(MKDIR) "$@"

$(REPOS_SRC)/$(PKG_TARBALL): $(R_OUTDIR)/$(PKG_TARBALL) $(REPOS_SRC)
	$(CP) $(R_OUTDIR)/$(PKG_TARBALL) $(REPOS_SRC)

repos: $(REPOS_SRC)/$(PKG_TARBALL)

Makefile: $(FILES_MAKEFILE)
	$(R_SCRIPT) -e "d <- 'Makefile'; s <- '../../Makefile'; if (file_test('-nt', s, d) && (regexpr('Makefile for R packages', readLines(s, n=1L)) != -1L)) file.copy(s, d, overwrite=TRUE)"
