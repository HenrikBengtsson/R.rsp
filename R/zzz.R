.conflicts.OK <- TRUE

.onLoad <- function(lib, pkg) {
  # Register vignette engine via tools::vignetteEngine(), if it exists.
  ns <- getNamespace("tools");
  name <- "vignetteEngine";
  if (exists(name, envir=ns, mode="function")) {
    fcn <- get(name, envir=ns, mode="function");
    fcn("rsp", weave=rspWeave, tangle=rspTangle);
  }
}


.onAttach <- function(libname, pkgname) {  
  pkg <- Package(pkgname);
  assign(pkgname, pkg, pos=getPosition(pkg));
  startupMessage(pkg);
}


############################################################################
# HISTORY: 
# 2013-02-08
# o Added .onLoad() registering an R v3.0.0 vignette engine.
# 2011-07-23
# o Added a namespace to the package.
############################################################################
