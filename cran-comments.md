# CRAN submission R.rsp 0.42.0

on 2018-01-09

This package failed to install when suggested package 'digest' was
not installed (related to new _R_CHECK_DEPENDS_ONLY_=true test).
Now package imports 'digest' instead.

I've verified that this submission causes *no* issues for
any of the 140 reverse (non-recursive) package dependencies
available on CRAN and Bioconductor.

Thanks in advance


## Notes not sent to CRAN

### R CMD check --as-cran validation

The package has been verified using `R CMD check --as-cran` on:

* Platform x86_64-apple-darwin13.4.0 (64-bit) [Travis CI]:
  - R version 3.3.3 (2017-03-06)

* Platform x86_64-apple-darwin15.6.0 (64-bit) [Travis CI]:
  - R version 3.4.3 (2017-11-30)

* Platform x86_64-unknown-linux-gnu (64-bit) [Travis CI]:
  - R version 3.3.3 (2017-03-06)
  - R version 3.4.2 (2017-09-28)
  - R Under development (unstable) (2018-01-09 r74103)

* Platform x86_64-pc-linux-gnu (64-bit) [r-hub]:
  - R version 3.4.2 (2017-09-28)
  - R Under development (unstable) (2018-01-07 r74091)

* Platform x86_64-pc-linux-gnu (64-bit):
  - R version 2.14.0 (2011-10-31)
  - R version 2.15.3 (2013-03-01)
  - R version 3.0.3 (2014-03-06)
  - R version 3.1.0 (2014-04-10)
  - R version 3.2.0 (2015-04-16)
  - R version 3.4.3 (2017-11-30)
  - R Under development (unstable) (2018-01-07 r74096)

* Platform i686-pc-linux-gnu (32-bit):
  - R version 3.4.3 (2017-11-30)

* Platform i386-w64-mingw32 (32-bit) [Appveyor CI]:
  - R Under development (unstable) (2018-01-08 r74099)

* Platform x86_64-w64-mingw32/x64 (64-bit) [Appveyor CI]:
  - R Under development (unstable) (2018-01-08 r74099)

* Platform x86_64-w64-mingw32/x64 (64-bit) [win-builder]:
  - R version 3.4.3 (2017-11-30)
  - R Under development (unstable) (2018-01-09 r74104)
