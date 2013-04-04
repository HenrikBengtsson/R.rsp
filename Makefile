# CORE MACROS
ifeq ($(OS), Windows_NT)
CD=cd
else
CD=cd -P "$(CURDIR)"; cd   # This handles the case when CURDIR is a softlink
endif
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
FILES_INST := $(wildcard inst/* inst/*/* inst/*/*/* inst/*/*/*/*)
FILES_VIGNETTES := $(wildcard vignettes/*)
FILES_SRC := $(wildcard src/* src/*/* src/*/*/* src/*/*/*/* src/*/*/*/*/* src/*/*/*/*/*/* src/*/*/*/*/*/*/* src/*/*/*/*/*/*/*/*)
FILES_TESTS := $(wildcard tests/*.R)
FILES_ROOT := DESCRIPTION NAMESPACE .Rbuildignore
PKG_FILES := $(FILES_ROOT) $(FILES_R) $(FILES_MAN) $(FILES_INST) $(FILES_VIGNETTES) $(FILES_SRC) $(FILES_TESTS)

# Has vignettes in 'vignettes/' or 'inst/doc/'?
DIR_VIGNS := $(wildcard vignettes inst/doc)

# R MACROS
R_HOME := $(shell echo "$(R_HOME)" | tr "\\\\" "/")
R = R --no-init-file
R_CMD = $(R) CMD
R_SCRIPT = Rscript
R_VERSION := $(shell $(R_SCRIPT) -e "cat(as.character(getRversion()))")
R_LIBS_USER_X := $(shell $(R_SCRIPT) -e "cat(.libPaths()[1])")
R_OUTDIR := _R-$(R_VERSION)
R_CHECK_OUTDIR := $(R_OUTDIR)/$(PKG_NAME).Rcheck
R_CHECK_OPTS = --as-cran --timings


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

debug_full: debug
	@echo
	@echo FILES_ROOT=\'$(FILES_ROOT)\'
	@echo FILES_R=\'$(FILES_R)\'
	@echo FILES_MAN=\'$(FILES_MAN)\'
	@echo FILES_INST=\'$(FILES_INST)\'
	@echo FILES_VIGNETTES=\'$(FILES_VIGNETTES)\'
	@echo FILES_SRC=\'$(FILES_SRC)\'
	@echo FILES_TESTS=\'$(FILES_TESTS)\'
	@echo FILES_INCL=\'$(FILES_INCL)\'
	@echo
	@echo DIR_VIGNS=\'$(DIR_VIGNS)\'
	@echo dirname\(DIR_VIGNS\)=\'$(shell dirname $(DIR_VIGNS))\'


# Build source tarball
../$(R_OUTDIR)/$(PKG_TARBALL): $(PKG_FILES)
	$(MKDIR) ../$(R_OUTDIR)
	$(CD) ../$(R_OUTDIR);\
	$(R_CMD) build ../$(PKG_DIR)

build: ../$(R_OUTDIR)/$(PKG_TARBALL)


# Install on current system
$(R_LIBS_USER_X)/$(PKG_NAME)/DESCRIPTION: ../$(R_OUTDIR)/$(PKG_TARBALL)
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
	$(CD) ../$(R_OUTDIR);\
	$(R_CMD) INSTALL --build --merge-multiarch $(PKG_TARBALL)


# Build Rd help files from Rdoc comments
Rd: install
	$(R_SCRIPT) -e "setwd('..'); Sys.setlocale(locale='C'); R.oo::compileRdoc('$(PKG_NAME)')"


# Build package vignettes
../$(R_OUTDIR)/vigns: install
	$(MKDIR) ../$(R_OUTDIR)/vigns/$(shell dirname $(DIR_VIGNS))
	$(CP) DESCRIPTION ../$(R_OUTDIR)/vigns/
	$(CP) -r $(DIR_VIGNS) ../$(R_OUTDIR)/vigns/$(shell dirname $(DIR_VIGNS))
	$(CD) ../$(R_OUTDIR)/vigns;\
	$(R_SCRIPT) -e "v <- tools::buildVignettes(dir='.'); file.path(getwd(), v[['outputs']])"

vignettes: ../$(R_OUTDIR)/vigns


# Run package tests
../$(R_OUTDIR)/tests/%.R: $(FILES_TESTS)
	$(MKDIR) ../$(R_OUTDIR)/tests
	$(CP) $? ../$(R_OUTDIR)/tests

test_files: ../$(R_OUTDIR)/tests/*.R

test: ../$(R_OUTDIR)/tests/%.R
	$(CD) ../$(R_OUTDIR)/tests;\
	$(R_SCRIPT) -e "for (f in list.files(pattern='[.]R$$')) { source(f, echo=TRUE) }"
