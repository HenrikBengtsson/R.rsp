.conflicts.OK <- TRUE

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
  }, silent=TRUE)
}


.onAttach <- function(libname, pkgname) {  
  pkg <- Package(pkgname);
  assign(pkgname, pkg, pos=getPosition(pkg));
  startupMessage(pkg);
}


############################################################################
# HISTORY: 
# 2013-03-07
# o Added the 'R.rsp::skip_Rnw' engine.
# 2013-02-08
# o Added .onLoad() registering an R v3.0.0 vignette engine.
# 2011-07-23
# o Added a namespace to the package.
############################################################################
