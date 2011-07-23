.conflicts.OK <- TRUE

## .First.lib <- function(libname, pkgname) {
.onAttach <- function(libname, pkgname) {  
  pkg <- Package(pkgname);
  assign(pkgname, pkg, pos=getPosition(pkg));

  packageStartupMessage(getName(pkg), " v", getVersion(pkg), " (", 
    getDate(pkg), ") successfully loaded. See ?", pkgname, " for help.\n",
    " Type browseRsp() to open the RSP main menu in your browser.");
}


############################################################################
# HISTORY: 
# 2011-07-23
# o Added a namespace to the package.
############################################################################
