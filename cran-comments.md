# CRAN submission R.rsp 0.45.0

on 2022-06-27

I've verified that this submission does not cause issues for the 326 reverse package dependencies available on CRAN and Bioconductor.

Thanks in advance


## Notes not sent to CRAN

### R CMD check validation

The package has been verified using `R CMD check --as-cran` on:

| R version     | GitHub | R-hub    | mac/win-builder |
| ------------- | ------ | -------- | --------------- |
| 3.4.x         | L      |          |                 |
| 3.6.x         | L      |          |                 |
| 4.1.x         | L      |          |                 |
| 4.2.x         | L M W  | L M M1 W | M1 W            |
| devel         | L   W  | L        |    W            |

*Legend: OS: L = Linux, M = macOS, M1 = macOS M1, W = Windows*


R-hub checks:

```r
res <- rhub::check(platform = c(
  "debian-clang-devel", "debian-gcc-patched", "linux-x86_64-centos-epel",
  "macos-highsierra-release-cran", "macos-m1-bigsur-release",
  "windows-x86_64-release"))
print(res)
```

gives

```
── R.rsp 0.45.0: OK

  Build ID:   R.rsp_0.45.0.tar.gz-d37bc97b821641ec818eef8db59476dc
  Platform:   Debian Linux, R-devel, clang, ISO-8859-15 locale
  Submitted:  15m 22.5s ago
  Build time: 14m 53.1s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

── R.rsp 0.45.0: OK

  Build ID:   R.rsp_0.45.0.tar.gz-cea18fcb9b304540af4a4b85dd5cfc5a
  Platform:   Debian Linux, R-patched, GCC
  Submitted:  15m 22.5s ago
  Build time: 13m 10.2s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

── R.rsp 0.45.0: WARNING

  Build ID:   R.rsp_0.45.0.tar.gz-f5ebf482002c47b192207e4eb4340bf9
  Platform:   CentOS 8, stock R from EPEL
  Submitted:  15m 22.5s ago
  Build time: 13m 25.4s

❯ checking re-building of vignette outputs ... WARNING
  Error(s) in re-building vignettes:
  --- re-building ‘R_packages-Static_PDF_and_HTML_vignettes.pdf.asis’ using asis
  --- finished re-building ‘R_packages-Static_PDF_and_HTML_vignettes.pdf.asis’
  
  --- re-building ‘R_packages-LaTeX_vignettes.ltx’ using tex
  --- finished re-building ‘R_packages-LaTeX_vignettes.ltx’
  
  --- re-building ‘Dynamic_document_creation_using_RSP.tex.rsp’ using rsp
  --- finished re-building ‘Dynamic_document_creation_using_RSP.tex.rsp’
  
  --- re-building ‘RSP_intro.html.rsp’ using rsp
  --- finished re-building ‘RSP_intro.html.rsp’
  
  --- re-building ‘RSP_refcard.tex.rsp’ using rsp
  Error: processing vignette 'RSP_refcard.tex.rsp' failed with diagnostics:
  Running 'texi2dvi' on 'RSP_refcard.tex' failed.
  LaTeX errors:
  ! LaTeX Error: File `titlesec.sty' not found.
  
  Type X to quit or <RETURN> to proceed,
  or enter new name. (Default extension: sty)
  
  ! Emergency stop.
  <read *> 
           
  l.37 \titlespacing
                    {\section}{0pt}{2.0ex}{0.5ex}^^M
  !  ==> Fatal error occurred, no output PDF file produced!
  --- failed re-building ‘RSP_refcard.tex.rsp’
  
  --- re-building ‘R_packages-RSP_vignettes.md.rsp’ using rsp
  --- finished re-building ‘R_packages-RSP_vignettes.md.rsp’
  
  --- re-building ‘R_packages-Vignettes_prior_to_R300.tex.rsp’ using rsp
  Warning in file(con, "r") :
    file("") only supports open = "w+" and open = "w+b": using the former
  Warning in file(con, "r") :
    file("") only supports open = "w+" and open = "w+b": using the former
  Warning in file(con, "r") :
    file("") only supports open = "w+" and open = "w+b": using the former
  --- finished re-building ‘R_packages-Vignettes_prior_to_R300.tex.rsp’
  
  SUMMARY: processing the following file failed:
    ‘RSP_refcard.tex.rsp’
  
  Error: Vignette re-building failed.
  Execution halted

0 errors ✔ | 1 warning ✖ | 0 notes ✔

── R.rsp 0.45.0: OK

  Build ID:   R.rsp_0.45.0.tar.gz-0ed011b921d549e6bcf05d6c7d0174f5
  Platform:   macOS 10.13.6 High Sierra, R-release, CRAN's setup
  Submitted:  15m 22.5s ago
  Build time: 3m 20.8s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

── R.rsp 0.45.0: WARNING

  Build ID:   R.rsp_0.45.0.tar.gz-ff319c4338844d2cad83f6782dd1823f
  Platform:   Apple Silicon (M1), macOS 11.6 Big Sur, R-release
  Submitted:  15m 22.5s ago
  Build time: 1m 45.9s

❯ checking re-building of vignette outputs ... WARNING
  Error(s) in re-building vignettes:
  --- re-building ‘R_packages-Static_PDF_and_HTML_vignettes.pdf.asis’ using asis
  --- finished re-building ‘R_packages-Static_PDF_and_HTML_vignettes.pdf.asis’
  
  --- re-building ‘R_packages-LaTeX_vignettes.ltx’ using tex
  --- finished re-building ‘R_packages-LaTeX_vignettes.ltx’
  
  --- re-building ‘Dynamic_document_creation_using_RSP.tex.rsp’ using rsp
  --- finished re-building ‘Dynamic_document_creation_using_RSP.tex.rsp’
  
  --- re-building ‘R_packages-RSP_vignettes.md.rsp’ using rsp
  --- finished re-building ‘R_packages-RSP_vignettes.md.rsp’
  
  --- re-building ‘R_packages-Vignettes_prior_to_R300.tex.rsp’ using rsp
  Warning in file(con, "r") :
    file("") only supports open = "w+" and open = "w+b": using the former
  Warning in file(con, "r") :
    file("") only supports open = "w+" and open = "w+b": using the former
  Warning in file(con, "r") :
    file("") only supports open = "w+" and open = "w+b": using the former
  --- finished re-building ‘R_packages-Vignettes_prior_to_R300.tex.rsp’
  
  --- re-building ‘RSP_intro.html.rsp’ using rsp
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in axis(side = side, at = at, labels = labels, ...) :
    no font could be found for family "Arial"
  Warning in title(...) : no font could be found for family "Arial"
  Warning in title(...) : no font could be found for family "Arial"
  Warning in title(...) : no font could be found for family "Arial"
  Warning in title(...) : no font could be found for family "Arial"
  --- finished re-building ‘RSP_intro.html.rsp’
  
  --- re-building ‘RSP_refcard.tex.rsp’ using rsp
  Error: processing vignette 'RSP_refcard.tex.rsp' failed with diagnostics:
  Running 'texi2dvi' on 'RSP_refcard.tex' failed.
  LaTeX errors:
  ! LaTeX Error: File `titlesec.sty' not found.
  
  Type X to quit or <RETURN> to proceed,
  or enter new name. (Default extension: sty)
  
  ! Emergency stop.
  <read *> 
           
  l.37 \titlespacing
                    {\section}{0pt}{2.0ex}{0.5ex}^^M
  !  ==> Fatal error occurred, no output PDF file produced!
  --- failed re-building ‘RSP_refcard.tex.rsp’
  
  SUMMARY: processing the following file failed:
    ‘RSP_refcard.tex.rsp’
  
  Error: Vignette re-building failed.
  Execution halted

0 errors ✔ | 1 warning ✖ | 0 notes ✔

── R.rsp 0.45.0: OK

  Build ID:   R.rsp_0.45.0.tar.gz-9f7acc54d89e40049dbaf1a1bd5c14d5
  Platform:   Windows Server 2008 R2 SP1, R-release, 32/64 bit
  Submitted:  15m 22.5s ago
  Build time: 6m 21.8s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔
```
