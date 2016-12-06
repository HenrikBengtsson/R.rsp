# CRAN submission R.rsp 0.40.0
on 2016-12-05

As requested by Kurt per email on 2016-11-29:

* All vignette formats now output a tangle file even if empty.
  This fixes the issue reported in PR #17185.

I've verified that this submission causes *no* issues for
any of the 81 reverse (non-recursive) package dependencies
available on CRAN and Bioconductor.

Thanks in advance


## Notes not sent to CRAN
The package has been verified using `R CMD check --as-cran` on:

* Platform x86_64-apple-darwin13.4.0 (64-bit) [Travis CI]:
  - R 3.2.4 Revised (2016-03-16)
  - R version 3.3.2 (2016-10-31)
  
* Platform x86_64-unknown-linux-gnu (64-bit) [Travis CI]:
  - R version 3.2.5 (2016-04-14)
  - R version 3.3.1 (2016-06-21)
  - R Under development (unstable) (2016-12-05 r71729)

* Platform x86_64-pc-linux-gnu (64-bit):
  - R version 2.15.3 (2013-03-01)
  - R version 3.0.3 (2014-03-09)
  - R version 3.1.3 (2015-03-09)
  - R version 3.3.2 (2016-10-31)

* Platform x86_64-pc-linux-gnu (64-bit) [r-hub]:
  - R version 3.3.1 (2016-06-21)
  - R Under development (unstable) (2016-11-13 r71655)

* Platform i386-w64-mingw32 (32-bit) [Appveyor CI]:
  - R Under development (unstable) (2016-12-04 r71726)

* Platform x86_64-w64-mingw32/x64 (64-bit) [Appveyor CI]:
  - R version 3.3.2 (2016-10-31)
  - R Under development (unstable) (2016-12-04 r71726)

* Platform x86_64-w64-mingw32 (64-bit) [r-hub]:
  - R Under development (unstable) (2016-11-13 r71655)

* Platform x86_64-w64-mingw32/x64 (64-bit) [win-builder]:
  - R version 3.3.2 (2016-10-31)
  - R Under development (unstable) (2016-12-04 r71726)
  
