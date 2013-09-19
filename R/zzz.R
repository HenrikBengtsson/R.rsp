.conflicts.OK <- TRUE

# Temporary workaround until R.oo::Class$forName() supports
# searching namespaces as well. /HB 2013-09-16
.Class_forName <- function(name, envir=NULL) {
  if (is.environment(envir) && exists(name, mode="function", envir=envir)) {
    clazz <- get(name, mode="function", envir=envir);
    if (inherits(clazz, "Class")) return(clazz);
  }
  Class$forName(name);
} # .Class_forName()


.requirePkg <- function(name, quietly=FALSE) {
  # Nothing to do?
  if (is.element(sprintf("package:%s", name), search())) {
    return(invisible(TRUE));
  }
  if (quietly) {
    # Load the package (super quietly)
    res <- suppressPackageStartupMessages(require(name, character.only=TRUE, quietly=TRUE));
  } else {
    res <- require(name, character.only=TRUE);
  }
  if (!res) throw("Package not loaded: ", name);
  invisible(res);
} # .requirePkg()


.onLoad <- function(libname, pkgname) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Register vignette engines
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  try({
    vignetteEngine <- get("vignetteEngine", envir=asNamespace("tools"));

    # Skip engine
    vignetteEngine("skip_Rnw", package=pkgname, pattern="[.]Rnw$", weave=NA);

    # RSP engine
    vignetteEngine("rsp", package=pkgname, pattern="[.][^.]*[.]rsp$",
                    weave=rspWeave, tangle=rspTangle);

    # Markdown RSP + knitr::pandoc engine (non-offical trial version)
    vignetteEngine("md.rsp+knitr:pandoc", package=pkgname,
                    pattern="[.]md[.]rsp$",
                    weave=`.weave_md.rsp+knitr:pandoc`,
                    tangle=rspTangle);

##    # "as-is" engine
##    vignetteEngine("asis", package=pkgname, pattern="[.](pdf|html)[.]asis$",
##                    weave=asisWeave, tangle=function(...) NULL);
##
##    # LaTeX engine
##    vignetteEngine("tex", package=pkgname, pattern="[.]tex$",
##                    weave=texWeave, tangle=function(...) NULL);
##
##    # Markdown engine
##    vignetteEngine("markdown", package=pkgname, pattern="[.]md$",
##                    weave=markdownWeave, tangle=function(...) NULL);
  }, silent=TRUE)
}


.onAttach <- function(libname, pkgname) {
  pkg <- RRspPackage(pkgname);
  assign(pkgname, pkg, pos=getPosition(pkg));
  startupMessage(pkg);
}


############################################################################
# HISTORY:
# 2013-09-18
# o Added the 'md.rsp+knitr:pandoc' engine.
# 2013-03-07
# o Added the 'R.rsp::skip_Rnw' engine.
# 2013-02-08
# o Added .onLoad() registering an R v3.0.0 vignette engine.
# 2011-07-23
# o Added a namespace to the package.
############################################################################
