# CRAN submission R.rsp 0.20.0
on 2015-02-13

Changes related to R/CRAN updates:

* Using Title Case.
* Using single-keyword %\VignetteKeyword{}:s in vignettes.
* Using requireNamespace() instead of require().
* Declaring all S3 methods.
* Added forgotten imports.

Follow up on 2015-02-14:
* Using \dontrun{} in example(rfile) instead of non-approved
  \donttest{}, which was there to avoid 'R CMD check --as-cran'
  reporting on "Examples with CPU or elapsed time > 5s".

Follow up on 2015-02-18:
* Renamed static vignette *.latex to *.ltx, because *.latex is
 _not_ a recognized filename extension by texi2dvi, causing
  vignette compilation errors.  Updated the corresponding RSP
  vignette engine accordingly.  Validated on Linux and OS X
  that have 'texidvi' on the PATH.
