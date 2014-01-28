# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Make functions callable from the command line
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# FIXME: Remove when depending on R.utils (>= 1.29.7)
CmdArgsFunction <- function(...) extend(..., "CmdArgsFunction");

rcat <- CmdArgsFunction(rcat)
rclean <- CmdArgsFunction(rclean)
rcompile <- CmdArgsFunction(rcompile)
rfile <- CmdArgsFunction(rfile)
rscript <- CmdArgsFunction(rscript)
rsource <- CmdArgsFunction(rsource)
rstring <- CmdArgsFunction(rstring)

# FIXME: Remove when depending on R.utils (>= 1.29.7)
if (exists("CmdArgsFunction", inherits=FALSE)) rm(list="CmdArgsFunction")



# BACKWARD compatibility until package depends on R.utils (>= 1.28.5)
withoutGString <- function(..., envir=parent.frame()) {
  if (packageVersion("R.utils") < "1.28.5") {
    fcn <- function(..., envir) { eval(..., envir=envir) }
  } else {
    ns <- asNamespace("R.utils");
    fcn <- get("withoutGString", envir=ns);
  }
  invisible(fcn(..., envir=envir));
} # withoutGString()


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
