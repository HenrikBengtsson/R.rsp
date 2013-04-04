# CORE MACROS
CD=cd -P "$(CURDIR)"; cd   # This handles the case when CURDIR is a softlink
CP=cp
MV=mv
RM=rm -f
MKDIR=mkdir -p

# PACKAGE MACROS
PKG_VERSION := $(shell grep -i ^version DESCRIPTION | cut -d : -d \  -f 2)
PKG_NAME    := $(shell grep -i ^package DESCRIPTION | cut -d : -d \  -f 2)
PKG_DIR     := $(shell basename "$(CURDIR)")
PKG_TARBALL := $(PKG_NAME)_$(PKG_VERSION).tar.gz

# FILE MACROS
FILES_R := $(wildcard R/*.R)
FILES_MAN := $(wildcard man/*.Rd)
FILES_INCL := $(wildcard incl/*)
FILES_INST := $(wildcard inst/*)
FILES_SRC := $(wildcard src/*)
FILES_TESTS := $(wildcard tests/*.R)
FILES_ROOT := DESCRIPTION NAMESPACE .Rbuildignore $(wildcard *.R*)
PKG_FILES := $(FILES_ROOT) $(FILES_R) $(FILES_MAN) $(FILES_INST) $(FILES_SRC) $(FILES_TESTS)

# R MACROS
R_HOME := $(shell echo "$(R_HOME)" | tr "\\\\" "/")
R = R --no-init-file
R_CMD = $(R) CMD
R_SCRIPT = Rscript
R_VERSION := $(shell $(R_SCRIPT) -e "cat(as.character(getRversion()))")
R_LIBS_USER_X := $(shell $(R_SCRIPT) -e "cat(.libPaths()[1])")
R_OUTDIR := $(R_VERSION)
R_CHECK_OUTDIR := $(R_OUTDIR)/$(PKG_NAME).Rcheck
R_CHECK_OPTS = --outdir=$(R_CHECK_OUTDIR) --as-cran --timings


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
	@echo R=\'$(R)\'
	@echo R_CMD=\'$(R_CMD)\'
	@echo R_SCRIPT=\'$(R_SCRIPT)\'
	@echo R_VERSION=\'$(R_VERSION)\'
	@echo R_LIBS_USER_X=\'$(R_LIBS_USER_X)\'
	@echo R_OUTDIR=\'$(R_OUTDIR)\'
	@echo R_CHECK_OUTDIR=\'$(R_CHECK_OUTDIR)\'
	@echo R_CHECK_OPTS=\'$(R_CHECK_OPTS)\'


# Build source tarball
../$(R_OUTDIR)/$(PKG_TARBALL): $(PKG_FILES)
	$(MKDIR) ../$(R_OUTDIR)
	$(CD) ../$(R_OUTDIR);\
	$(R_CMD) build ../$(PKG_DIR)

build: ../$(R_OUTDIR)/$(PKG_TARBALL)


# Install on current system
$(R_LIBS_USER_X)/$(PKG_NAME)/DESCRIPTION:
	$(CD) ../$(R_OUTDIR);\
	$(R_CMD) INSTALL $(PKG_TARBALL)

install: $(R_LIBS_USER_X)/$(PKG_NAME)/DESCRIPTION


# Check source tarball
../$(R_CHECK_OUTDIR)/00check.log: ../$(R_OUTDIR)/$(PKG_TARBALL)
	$(CD) ../$(R_OUTDIR);\
	$(R_CMD) check $(R_CHECK_OPTS) $(PKG_TARBALL)

check: ../$(R_CHECK_OUTDIR)/00check.log


# Install and build binaries
binary: ../$(R_OUTDIR)/$(PKG_TARBALL)
	$(CD) ..;\
	$(R_CMD) INSTALL --build --merge-multiarch $(PKG_TARBALL)


# Build Rd help files from Rdoc comments
Rd: install
	$(R_SCRIPT) -e "setwd('..'); Sys.setlocale(locale='C'); R.oo::compileRdoc('$(PKG_NAME)')"


# Build package vignettes
../$(R_OUTDIR)/vigns: install
	$(MKDIR) ../$(R_OUTDIR)/vigns
	$(R_SCRIPT) -e "r <- '../$(R_OUTDIR)/vigns'; d <- c('vignettes', 'inst/doc'); d <- d[file_test('-d', d)]; if (!length(d)) quit('no'); d <- d[1]; file.copy('DESCRIPTION', r); t <- file.path(r, dirname(d)); dir.create(t, showWarnings=FALSE); file.copy(d, t, recursive=TRUE); setwd(r); v <- tools::buildVignettes(dir='.'); file.path(r, d, v[['outputs']])"

vignettes: ../$(R_OUTDIR)/vigns


# Run package tests
../$(R_OUTDIR)/tests/%.R: $(FILES_TESTS)
	$(MKDIR) ../$(R_OUTDIR)/tests
	$(CP) $? ../$(R_OUTDIR)/tests

test_files: ../$(R_OUTDIR)/tests/*.R

test:
	$(CD) ../$(R_OUTDIR)/tests;\
	$(R_SCRIPT) -e "for (f in list.files(pattern='[.]R$$')) { source(f, echo=TRUE) }"


