## covr: skip=all
.onUnload <- function(libpath) {
  # Force finalize() on HttpDaemon objects
  base::gc()
}

.onLoad <- function(libname, pkgname) {
  .registerVignetteEngines(pkgname)

  ns <- getNamespace(pkgname)
  pkg <- RRspPackage(pkgname)
  assign(pkgname, pkg, envir=ns)
}

.onAttach <- function(libname, pkgname) {
  startupMessage(get(pkgname, envir=getNamespace(pkgname)))
}
