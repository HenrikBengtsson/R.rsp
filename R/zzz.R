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
  .registerVignetteEngines(pkgname);

  ns <- getNamespace(pkgname);
  pkg <- RRspPackage(pkgname);
  assign(pkgname, pkg, envir=ns);
}


.onAttach <- function(libname, pkgname) {
  startupMessage(get(pkgname, envir=getNamespace(pkgname)));
}


############################################################################
# HISTORY:
# 2013-09-28
# o Now assigning Package object already when loading the package,
#   and not just when attaching it.
# 2013-09-19
# o Simplified .onLoad() so it's now calling .registerVignetteEngines().
# 2013-09-18
# o Added the 'md.rsp+knitr:pandoc' engine.
# 2013-03-07
# o Added the 'R.rsp::skip_Rnw' engine.
# 2013-02-08
# o Added .onLoad() registering an R v3.0.0 vignette engine.
# 2011-07-23
# o Added a namespace to the package.
############################################################################
