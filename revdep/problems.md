# Setup

## Platform

|setting  |value                        |
|:--------|:----------------------------|
|version  |R version 3.3.2 (2016-10-31) |
|system   |x86_64, linux-gnu            |
|ui       |X11                          |
|language |en                           |
|collate  |en_US.UTF-8                  |
|tz       |US/Pacific                   |
|date     |2016-12-04                   |

## Packages

|package     |*  |version     |date       |source                           |
|:-----------|:--|:-----------|:----------|:--------------------------------|
|ascii       |   |2.1         |2011-09-29 |cran (@2.1)                      |
|base64enc   |   |0.1-4       |2016-11-11 |cran (@0.1-4)                    |
|digest      |   |0.6.10      |2016-08-02 |CRAN (R 3.3.1)                   |
|knitr       |   |1.15.2      |2016-12-04 |cran (@1.15.2)                   |
|markdown    |   |0.7.7       |2015-04-22 |cran (@0.7.7)                    |
|R.cache     |   |0.12.0      |2015-11-12 |cran (@0.12.0)                   |
|R.devices   |   |2.15.1      |2016-11-10 |cran (@2.15.1)                   |
|R.methodsS3 |   |1.7.1       |2016-02-16 |cran (@1.7.1)                    |
|R.oo        |   |1.21.0      |2016-11-01 |cran (@1.21.0)                   |
|R.rsp       |   |0.30.0-9000 |2016-12-05 |local (HenrikBengtsson/R.rsp@NA) |
|R.utils     |   |2.5.0       |2016-11-07 |cran (@2.5.0)                    |

# Check results
6 packages with problems

## canceR (1.6.0)
Maintainer: Karim Mezhoud <kmezhoud@gmail.com>

1 error  | 0 warnings | 1 note 

```
checking whether package ‘canceR’ can be installed ... ERROR
Installation failed.
See ‘/home/hb/repositories/R.rsp/revdep/checks/canceR.Rcheck/00install.out’ for details.

checking for hidden files and directories ... NOTE
Found the following hidden files and directories:
  .travis.yml
These were most likely included in error. See section ‘Package
structure’ in the ‘Writing R Extensions’ manual.
```

## crisprseekplus (1.0.0)
Maintainer: Alper Kucukural <alper.kucukural@umassmed.edu>  
Bug reports: https://github.com/UMMS-Biocore/crisprseekplus/issues/new

0 errors | 1 warning  | 1 note 

```
checking re-building of vignette outputs ... WARNING
Error in re-building vignettes:
  ...
Error: processing vignette 'crisprseekplus.Rmd' failed with diagnostics:
unused arguments (self_contained, lib_dir, output_dir)
Execution halted


checking top-level files ... NOTE
Non-standard file/directory found at top level:
  ‘docs’
```

## debrowser (1.2.3)
Maintainer: Alper Kucukural <alper.kucukural@umassmed.edu>  
Bug reports: https://github.com/UMMS-Biocore/debrowser/issues/new

1 error  | 0 warnings | 0 notes

```
checking whether package ‘debrowser’ can be installed ... ERROR
Installation failed.
See ‘/home/hb/repositories/R.rsp/revdep/checks/debrowser.Rcheck/00install.out’ for details.
```

## madness (0.2.0)
Maintainer: Steven E. Pav <shabbychef@gmail.com>  
Bug reports: https://github.com/shabbychef/madness/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/run-all.R’ failed.
Last 13 lines of output:
    val: 1.307766 1.468549 1.546559 1.280354 ...
   dvdx: 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
   varx:  ...
  1. Failure: eigen functions (@test-correctness.r#400) --------------------------
  comp_err(xval, thefun = thefun, scalfun = scalfun, eps = eps) is not strictly less than 1e-06. Difference: 1.09e-07
  
  
  testthat results ================================================================
  OK: 459 SKIPPED: 0 FAILED: 1
  1. Failure: eigen functions (@test-correctness.r#400) 
  
  Error: testthat unit tests failed
  Execution halted
```

## metafor (1.9-9)
Maintainer: Wolfgang Viechtbauer <wvb@metafor-project.org>  
Bug reports: https://github.com/wviechtb/metafor/issues

1 error  | 0 warnings | 0 notes

```
checking tests ... ERROR
Running the tests in ‘tests/testthat.R’ failed.
Last 13 lines of output:
  1. Error: results are correct for example 1. (@test_analysis_example_law2016.r#74) 
  Optimizer (nlminb) did not achieve convergence (convergence = 1).
  1: rma.mv(y, S1, mods = X, intercept = FALSE, random = list(~contr | study, ~contr | 
         design), rho = 1/2, phi = 1/2, data = EG1) at testthat/test_analysis_example_law2016.r:74
  2: stop(paste0("Optimizer (", optimizer, ") did not achieve convergence (convergence = ", 
         opt.res$convergence, ")."))
  
  testthat results ================================================================
  OK: 776 SKIPPED: 30 FAILED: 1
  1. Error: results are correct for example 1. (@test_analysis_example_law2016.r#74) 
  
  Error: testthat unit tests failed
  Execution halted
```

## PrevMap (1.4)
Maintainer: Emanuele Giorgi <e.giorgi@lancaster.ac.uk>

0 errors | 1 warning  | 1 note 

```
checking whether package ‘PrevMap’ can be installed ... WARNING
Found the following significant warnings:
  Warning: no DISPLAY variable so Tk is not available
See ‘/home/hb/repositories/R.rsp/revdep/checks/PrevMap.Rcheck/00install.out’ for details.

checking package dependencies ... NOTE
Package suggested but not available for checking: ‘INLA’
```

