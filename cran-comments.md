# CRAN submission R.rsp 0.43.1

on 2019-02-05

This submission addresses the issue that package 'ascii' has been archived on CRAN as of 2019-01-26.

Thanks in advance


## Notes not sent to CRAN

### R CMD check --as-cran validation

The package has been verified using `R CMD check --as-cran` on:

* Platform x86_64-apple-darwin15.6.0 (64-bit) [Travis CI]:
  - R version 3.4.4 (2018-03-15)
  - R version 3.5.2 (2018-12-20)

* Platform x86_64-unknown-linux-gnu (64-bit) [Travis CI]:
  - R version 3.4.4 (2017-01-27) [sic!]
  - R version 3.5.2 (2017-01-27) [sic!]
  - R Under development (unstable) (2019-02-05 r76062)

* Platform x86_64-pc-linux-gnu (64-bit) [r-hub]:
  - R version 3.4.4 (2018-03-15)
  - R Under development (unstable) (2019-02-02 r76050)

* Platform x86_64-pc-linux-gnu (64-bit):
  - R version 3.5.2 (2018-12-20)

* Platform x86_64-w64-mingw32 (64-bit) [r-hub]:
  - R Under development (unstable) (2019-01-26 r76018)

* Platform x86_64-w64-mingw32/x64 (64-bit) [win-builder]:
  - R version 3.5.2 (2018-12-20)
  - R Under development (unstable) (2019-02-04 r76055)


Failed to be checked:

* Platform i386-w64-mingw32 (32-bit) [AppVeyor CI]:
  - R Under development (unstable) (2019-02-04 r76055)
  - REASON: Rtools appears to be broken on AppVeyor
  
* Platform x86_64-w64-mingw32/x64 (64-bit) [AppVeyor CI]:
  - R version 3.5.2 (2018-12-20)
  - R Under development (unstable) (2019-02-04 r76055)
  - REASON: Rtools appears to be broken on AppVeyor
