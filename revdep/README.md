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
85 packages

## AEDForecasting (0.20.0)
Maintainer: Nhat Cuong Pham <acmetal74@gmail.com>

0 errors | 0 warnings | 0 notes

## AFLPsim (0.4-2)
Maintainer: Francisco Balao <fbalao@us.es>

0 errors | 0 warnings | 0 notes

## aroma.core (3.0.0)
Maintainer: Henrik Bengtsson <henrikb@braju.com>  
Bug reports: https://github.com/HenrikBengtsson/aroma.core/issues

0 errors | 0 warnings | 1 note 

```
checking package dependencies ... NOTE
Packages suggested but not available for checking:
  ‘expectile’ ‘HaarSeg’ ‘mpcbs’
```

## babar (1.0)
Maintainer: Matthew Hartley <Matthew.Hartley@jic.ac.uk>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
.generateTransform: no visible global function definition for ‘sd’
.generateUnitHyperCube: no visible global function definition for
  ‘runif’
.makeBoundedSingleStep: no visible global function definition for
  ‘runif’
.makeBoundedStep: no visible global function definition for ‘runif’
.makeStep: no visible global function definition for ‘runif’
.staircaseSampling: no visible global function definition for ‘runif’
GaussianPrior: no visible global function definition for ‘qnorm’
LogNormalPrior: no visible global function definition for ‘qnorm’
Undefined global functions or variables:
  qnorm runif sd
Consider adding
  importFrom("stats", "qnorm", "runif", "sd")
to your NAMESPACE file.
```

## babel (0.3-0)
Maintainer: Adam B. Olshen <adam.olshen@ucsf.edu>

0 errors | 0 warnings | 0 notes

## bayesGDS (0.6.2)
Maintainer: Michael Braun <braunm@smu.edu>

0 errors | 0 warnings | 0 notes

## bootTimeInference (0.1.0)
Maintainer: Aleksandar Spasojevic <aleksandar.spasojevic@outlook.com>

0 errors | 0 warnings | 0 notes

## brms (1.2.0)
Maintainer: Paul-Christian Buerkner <paul.buerkner@gmail.com>  
Bug reports: https://github.com/paul-buerkner/brms/issues

0 errors | 0 warnings | 0 notes

## brotli (0.8)
Maintainer: Jeroen Ooms <jeroen.ooms@stat.ucla.edu>  
Bug reports: http://github.com/jeroenooms/brotli/issues

0 errors | 0 warnings | 1 note 

```
checking installed package size ... NOTE
  installed size is  5.9Mb
  sub-directories of 1Mb or more:
    bin    2.3Mb
    doc    1.3Mb
    libs   2.2Mb
```

## brr (1.0.0)
Maintainer: Stéphane Laurent <laurent_step@yahoo.fr>

0 errors | 0 warnings | 0 notes

## bst (0.3-14)
Maintainer: Zhu Wang <zwang@connecticutchildrens.org>

0 errors | 0 warnings | 0 notes

## bujar (0.2-1)
Maintainer: Zhu Wang <zwang@connecticutchildrens.org>

0 errors | 0 warnings | 0 notes

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

## causaleffect (1.3.0)
Maintainer: Santtu Tikka <santtuth@gmail.com>

0 errors | 0 warnings | 0 notes

## comf (0.1.6)
Maintainer: Marcel Schweiker <marcel.schweiker@kit.edu>

0 errors | 0 warnings | 0 notes

## Compind (1.1.2)
Maintainer: Francesco Vidoli <fvidoli@gmail.com>

0 errors | 0 warnings | 0 notes

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

## CryptRndTest (1.2.2)
Maintainer: Haydar Demirhan <haydarde@hacettepe.edu.tr>

0 errors | 0 warnings | 0 notes

## deBInfer (0.4.1)
Maintainer: Philipp H Boersch-Supan <pboesu@gmail.com>

0 errors | 0 warnings | 0 notes

## debrowser (1.2.3)
Maintainer: Alper Kucukural <alper.kucukural@umassmed.edu>  
Bug reports: https://github.com/UMMS-Biocore/debrowser/issues/new

1 error  | 0 warnings | 0 notes

```
checking whether package ‘debrowser’ can be installed ... ERROR
Installation failed.
See ‘/home/hb/repositories/R.rsp/revdep/checks/debrowser.Rcheck/00install.out’ for details.
```

## dggridR (0.1.11)
Maintainer: Richard Barnes <rbarnes@umn.edu>  
Bug reports: https://github.com/r-barnes/dggridR/

0 errors | 0 warnings | 1 note 

```
checking installed package size ... NOTE
  installed size is 26.7Mb
  sub-directories of 1Mb or more:
    bin  24.6Mb
    doc   1.7Mb
```

## DiffusionRgqd (0.1.3)
Maintainer: Etienne A.D. Pienaar <etiennead@gmail.com>  
Bug reports: https://github.com/eta21/DiffusionRgqd/issues

0 errors | 0 warnings | 1 note 

```
checking installed package size ... NOTE
  installed size is  6.5Mb
  sub-directories of 1Mb or more:
    doc   5.2Mb
```

## DiffusionRimp (0.1.2)
Maintainer: Etienne A.D. Pienaar <etiennead@gmail.com>  
Bug reports: https://github.com/eta21/DiffusionRimp/issues

0 errors | 0 warnings | 0 notes

## DiffusionRjgqd (0.1.1)
Maintainer: Etienne A.D. Pienaar <etiennead@gmail.com>  
Bug reports: https://github.com/eta21/DiffusionRjgqd/issues

0 errors | 0 warnings | 1 note 

```
checking installed package size ... NOTE
  installed size is  6.8Mb
  sub-directories of 1Mb or more:
    doc   5.6Mb
```

## doFuture (0.3.0)
Maintainer: Henrik Bengtsson <henrikb@braju.com>  
Bug reports: https://github.com/HenrikBengtsson/doFuture/issues

0 errors | 0 warnings | 0 notes

## easyVerification (0.3.0)
Maintainer: Jonas Bhend <jonas.bhend@meteoswiss.ch>

0 errors | 0 warnings | 0 notes

## ecp (3.0.0)
Maintainer: Nicholas A. James <nj89@cornell.edu>

0 errors | 0 warnings | 0 notes

## enaR (2.9.1)
Maintainer: Matthew K. Lau <enaR.maintainer@gmail.com>

0 errors | 0 warnings | 0 notes

## EnsemblePCReg (1.1.1)
Maintainer: Alireza S. Mahani <alireza.s.mahani@gmail.com>

0 errors | 0 warnings | 0 notes

## erah (1.0.4)
Maintainer: Xavier Domingo-Almenara <xavier.domingo@urv.cat>

0 errors | 0 warnings | 0 notes

## future.BatchJobs (0.13.1)
Maintainer: Henrik Bengtsson <henrikb@braju.com>  
Bug reports: https://github.com/HenrikBengtsson/future.BatchJobs/issues

0 errors | 0 warnings | 0 notes

## future (1.2.0)
Maintainer: Henrik Bengtsson <henrikb@braju.com>  
Bug reports: https://github.com/HenrikBengtsson/future/issues

0 errors | 0 warnings | 0 notes

## FuzzyLP (0.1-3)
Maintainer: Carlos A. Rabelo <carabelo@gmail.com>

0 errors | 0 warnings | 0 notes

## FuzzyStatProb (2.0.2)
Maintainer: Pablo J. Villacorta <pjvi@decsai.ugr.es>

0 errors | 0 warnings | 0 notes

## GameTheory (2.4)
Maintainer: Sebastian Cano-Berlanga <cano.berlanga@gmail.com>

0 errors | 0 warnings | 0 notes

## gdm (1.2.3)
Maintainer: Matthew C. Fitzpatrick <mfitzpatrick@al.umces.edu>

0 errors | 0 warnings | 0 notes

## generalCorr (1.0.3)
Maintainer: H. D. Vinod <vinod@fordham.edu>

0 errors | 0 warnings | 0 notes

## GHap (1.2.1)
Maintainer: Yuri Tani Utsunomiya <ytutsunomiya@gmail.com>

0 errors | 0 warnings | 0 notes

## gitlabr (0.6.4)
Maintainer: Jirka Lewandowski <jirka.lewandowski@wzb.eu>  
Bug reports: 
        http://gitlab.points-of-interest.cc/points-of-interest/gitlabr/
        issues/

0 errors | 0 warnings | 0 notes

## haplo.stats (1.7.7)
Maintainer: Jason P. Sinnwell <sinnwell.jason@mayo.edu>

0 errors | 0 warnings | 0 notes

## IsoriX (0.4-1)
Maintainer: Alexandre Courtiol <alexandre.courtiol@gmail.com>

0 errors | 0 warnings | 0 notes

## jsonlite (1.1)
Maintainer: Jeroen Ooms <jeroen.ooms@stat.ucla.edu>  
Bug reports: http://github.com/jeroenooms/jsonlite/issues

0 errors | 0 warnings | 0 notes

## kdecopula (0.7.0)
Maintainer: Thomas Nagler <thomas.nagler@tum.de>  
Bug reports: https://github.com/tnagler/kdecopula

0 errors | 0 warnings | 0 notes

## listenv (0.6.0)
Maintainer: Henrik Bengtsson <henrikb@braju.com>  
Bug reports: https://github.com/HenrikBengtsson/listenv/issues

0 errors | 0 warnings | 0 notes

## lqmm (1.5.3)
Maintainer: Marco Geraci <geraci@mailbox.sc.edu>

0 errors | 0 warnings | 0 notes

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

## manifestoR (1.2.3)
Maintainer: Jirka Lewandowski <jirka.lewandowski@wzb.eu>  
Bug reports: https://github.com/ManifestoProject/manifestoR/issues

0 errors | 0 warnings | 0 notes

## marmap (0.9.5)
Maintainer: Eric Pante <pante.eric@gmail.com>

0 errors | 0 warnings | 1 note 

```
checking Rd cross-references ... NOTE
Package unavailable to check Rd xrefs: ‘maptools’
```

## matrixpls (1.0.1)
Maintainer: Mikko Rönkkö <mikko.ronkko@aalto.fi>  
Bug reports: https://github.com/mronkko/matrixpls/issues

0 errors | 0 warnings | 0 notes

## matrixStats (0.51.0)
Maintainer: Henrik Bengtsson <henrikb@braju.com>  
Bug reports: https://github.com/HenrikBengtsson/matrixStats/issues

0 errors | 0 warnings | 1 note 

```
checking installed package size ... NOTE
  installed size is  8.1Mb
  sub-directories of 1Mb or more:
    libs   7.4Mb
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

## metaplus (0.7-9)
Maintainer: Ken Beath <ken.beath@mq.edu.au>

0 errors | 0 warnings | 0 notes

## metaSEM (0.9.10)
Maintainer: Mike W.-L. Cheung <mikewlcheung@nus.edu.sg>

0 errors | 0 warnings | 0 notes

## MIAmaxent (0.3.7)
Maintainer: Julien Vollering <julien.vollering@hisf.no>  
Bug reports: https://github.com/julienvollering/MIAmaxent/issues

0 errors | 0 warnings | 0 notes

## micromapST (1.0.5)
Maintainer: Jim Pearson <jpearson@statnetconsulting.com>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
micromapST : rlStateBoxplot: no visible global function definition for
  ‘segments’
micromapST: no visible global function definition for ‘adjustcolor’
Undefined global functions or variables:
  adjustcolor segments
Consider adding
  importFrom("grDevices", "adjustcolor")
  importFrom("graphics", "segments")
to your NAMESPACE file.
```

## mpath (0.2-4)
Maintainer: Zhu Wang <zwang@connecticutchildrens.org>

0 errors | 0 warnings | 0 notes

## MRH (2.2)
Maintainer: Yolanda Hagar <yolanda.hagar@colorado.edu>

0 errors | 0 warnings | 0 notes

## opencpu (1.6.1)
Maintainer: Jeroen Ooms <jeroen.ooms@stat.ucla.edu>  
Bug reports: https://github.com/jeroenooms/opencpu/issues

0 errors | 0 warnings | 0 notes

## OpenML (1.1)
Maintainer: Giuseppe Casalicchio <giuseppe.casalicchio@stat.uni-muenchen.de>  
Bug reports: https://github.com/openml/openml-r/issues

0 errors | 0 warnings | 0 notes

## PAFit (0.8.7)
Maintainer: Thong Pham <thongpham@thongpham.net>

0 errors | 0 warnings | 0 notes

## pleio (1.1)
Maintainer: Jason Sinnwell <sinnwell.jason@mayo.edu>

0 errors | 0 warnings | 0 notes

## plsRglm (1.1.1)
Maintainer: Frederic Bertrand <frederic.bertrand@math.unistra.fr>

0 errors | 0 warnings | 2 notes

```
checking dependencies in R code ... NOTE
'library' or 'require' calls in package code:
  ‘MASS’ ‘plsdof’
  Please use :: or requireNamespace() instead.
  See section 'Suggested packages' in the 'Writing R Extensions' manual.

checking R code for possible problems ... NOTE
PLS_glm: no visible global function definition for ‘Gamma’
PLS_glm: no visible global function definition for ‘gaussian’
PLS_glm: no visible global function definition for ‘inverse.gaussian’
PLS_glm: no visible global function definition for ‘binomial’
PLS_glm: no visible global function definition for ‘poisson’
PLS_glm: no visible global function definition for ‘weighted.mean’
PLS_glm: no visible binding for global variable ‘weighted.mean’
PLS_glm: no visible global function definition for ‘pnorm’
PLS_glm: no visible global function definition for ‘coef’
... 213 lines ...
  importFrom("graphics", "abline", "arrows", "axis", "barplot",
             "boxplot", "legend", "par", "plot", "points", "strwidth",
             "text")
  importFrom("stats", "AIC", "Gamma", "binomial", "coef", "contrasts",
             "family", "gaussian", "glm", "inverse.gaussian",
             "is.empty.model", "lm", "make.link", "model.frame",
             "model.matrix", "model.offset", "model.response",
             "model.weights", "na.exclude", "na.pass", "pnorm",
             "poisson", "predict", "rbinom", "residuals.glm",
             "weighted.mean")
to your NAMESPACE file.
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

## profmem (0.4.0)
Maintainer: Henrik Bengtsson <henrikb@braju.com>  
Bug reports: https://github.com/HenrikBengtsson/profmem/issues

0 errors | 0 warnings | 0 notes

## PSCBS (0.62.0)
Maintainer: Henrik Bengtsson <henrikb@braju.com>  
Bug reports: https://github.com/HenrikBengtsson/PSCBS/issues

0 errors | 0 warnings | 0 notes

## Qtools (1.1)
Maintainer: Marco Geraci <geraci@mailbox.sc.edu>

0 errors | 0 warnings | 0 notes

## randomUniformForest (1.1.5)
Maintainer: Saip Ciss <saip.ciss@wanadoo.fr>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
HuberDist: no visible global function definition for ‘median’
MDSscale: no visible global function definition for ‘plot’
OOBquantiles : <anonymous>: no visible global function definition for
  ‘quantile’
OOBquantiles : <anonymous>: no visible global function definition for
  ‘sd’
OOBquantiles: no visible global function definition for ‘quantile’
OOBquantiles: no visible global function definition for ‘plot’
bCICore: no visible global function definition for ‘quantile’
... 185 lines ...
Consider adding
  importFrom("grDevices", "dev.new", "dev.off", "graphics.off",
             "heat.colors")
  importFrom("graphics", "abline", "barplot", "grid", "legend",
             "mosaicplot", "par", "persp", "plot", "points", "title")
  importFrom("stats", "aggregate", "cor", "dist", "kmeans", "lm",
             "median", "model.frame", "model.matrix", "model.response",
             "na.omit", "pbinom", "predict", "qnorm", "quantile",
             "rnorm", "runif", "sd")
  importFrom("utils", "head", "memory.limit")
to your NAMESPACE file.
```

## RAppArmor (2.0.2)
Maintainer: Jeroen Ooms <jeroen.ooms@stat.ucla.edu>  
Bug reports: http://github.com/jeroenooms/RAppArmor/issues

0 errors | 0 warnings | 0 notes

## rccmisc (0.3.7)
Maintainer: Erik Bulow <erik.bulow@rccvast.se>  
Bug reports: https://bitbucket.com/cancercentrum/rccmisc/issues

0 errors | 0 warnings | 0 notes

## rcss (1.1)
Maintainer: Jeremy Yee <jeremyyee@outlook.com.au>  
Bug reports: https://github.com/YeeJeremy/rcss/issues

0 errors | 0 warnings | 1 note 

```
checking installed package size ... NOTE
  installed size is 11.9Mb
  sub-directories of 1Mb or more:
    libs  11.5Mb
```

## R.devices (2.15.1)
Maintainer: Henrik Bengtsson <henrikb@braju.com>  
Bug reports: https://github.com/HenrikBengtsson/R.devices/issues

0 errors | 0 warnings | 0 notes

## RLumModel (0.1.2)
Maintainer: Johannes Friedrich <johannes.friedrich@uni-bayreuth.de>

0 errors | 0 warnings | 0 notes

## rSARP (1.0.0)
Maintainer: John Hutcheson <jacknx8a@gmail.com>

0 errors | 0 warnings | 0 notes

## SemiCompRisks (2.5)
Maintainer: Kyu Ha Lee <klee@hsph.harvard.edu>

0 errors | 0 warnings | 0 notes

## SetRank (1.1.0)
Maintainer: Cedric Simillion <cedric.simillion@dkf.unibe.ch>

0 errors | 0 warnings | 0 notes

## sgd (1.1)
Maintainer: Dustin Tran <dustin@cs.columbia.edu>  
Bug reports: https://github.com/airoldilab/sgd/issues

0 errors | 0 warnings | 0 notes

## spam (1.4-0)
Maintainer: Reinhard Furrer <reinhard.furrer@math.uzh.ch>

0 errors | 0 warnings | 0 notes

## SRCS (1.1)
Maintainer: Pablo J. Villacorta <pjvi@decsai.ugr.es>

0 errors | 0 warnings | 0 notes

## ssfa (1.1)
Maintainer: Elisa Fusco <fusco_elisa@libero.it>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
L_hNV: no visible global function definition for ‘pnorm’
L_hNV_rho: no visible global function definition for ‘pnorm’
eff.ssfa: no visible global function definition for ‘pnorm’
plot_fitted: no visible global function definition for ‘lines’
plot_moran: no visible global function definition for ‘residuals’
print.summary.ssfa: no visible global function definition for
  ‘printCoefmat’
ssfa: no visible global function definition for ‘model.frame’
ssfa: no visible global function definition for ‘model.response’
... 8 lines ...
u.ssfa: no visible global function definition for ‘dnorm’
u.ssfa: no visible global function definition for ‘pnorm’
Undefined global functions or variables:
  df dnorm lines lm logLik model.frame model.response pchisq pnorm
  printCoefmat residuals var
Consider adding
  importFrom("graphics", "lines")
  importFrom("stats", "df", "dnorm", "lm", "logLik", "model.frame",
             "model.response", "pchisq", "pnorm", "printCoefmat",
             "residuals", "var")
to your NAMESPACE file.
```

## stagePop (1.1-1)
Maintainer: David Nutter <david.nutter@bioss.ac.uk>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
genericPlot: no visible global function definition for ‘dev.new’
genericPlot: no visible global function definition for ‘par’
genericPlot: no visible global function definition for ‘rainbow’
genericPlot: no visible global function definition for ‘plot’
genericPlot: no visible global function definition for ‘lines’
genericPlot: no visible global function definition for ‘legend’
genericPlot: no visible global function definition for ‘dev.copy2pdf’
genericPlot: no visible global function definition for ‘dev.copy2eps’
genericPlot: no visible global function definition for ‘dev.print’
... 11 lines ...
plotStrains: no visible global function definition for ‘dev.print’
plotStrains: no visible binding for global variable ‘png’
plotStrains: no visible binding for global variable ‘tiff’
Undefined global functions or variables:
  dev.copy2eps dev.copy2pdf dev.new dev.print legend lines par plot png
  rainbow tiff
Consider adding
  importFrom("grDevices", "dev.copy2eps", "dev.copy2pdf", "dev.new",
             "dev.print", "png", "rainbow", "tiff")
  importFrom("graphics", "legend", "lines", "par", "plot")
to your NAMESPACE file.
```

## tailDepFun (1.0.0)
Maintainer: Anna Kiriliouk <anna.kiriliouk@uclouvain.be>

0 errors | 0 warnings | 0 notes

## timma (1.2.1)
Maintainer: Jing Tang <jing.tang@helsinki.fi>

0 errors | 0 warnings | 1 note 

```
checking R code for possible problems ... NOTE
drawGraph: no visible global function definition for ‘pdf’
drawGraph: no visible global function definition for ‘par’
drawGraph: no visible global function definition for ‘plot’
drawGraph: no visible global function definition for ‘segments’
drawGraph: no visible global function definition for ‘lines’
drawGraph: no visible global function definition for ‘text’
drawGraph: no visible global function definition for ‘dev.off’
drugRank: no visible global function definition for ‘aggregate’
floating2: no visible global function definition for ‘cor’
timma: no visible global function definition for ‘median’
timma: no visible global function definition for ‘write.table’
Undefined global functions or variables:
  aggregate cor dev.off lines median par pdf plot segments text
  write.table
Consider adding
  importFrom("grDevices", "dev.off", "pdf")
  importFrom("graphics", "lines", "par", "plot", "segments", "text")
  importFrom("stats", "aggregate", "cor", "median")
  importFrom("utils", "write.table")
to your NAMESPACE file.
```

## tsdisagg2 (0.1.0)
Maintainer: Jorge Vieira <jorgealexandrevieira@gmail.com>

0 errors | 0 warnings | 0 notes

## WACS (1.0)
Maintainer: Denis Allard <allard@avignon.inra.fr>

0 errors | 0 warnings | 0 notes

## WCE (1.0)
Maintainer: Marie-Pierre Sylvestre <marie-pierre.sylvestre@umontreal.ca>

0 errors | 0 warnings | 2 notes

```
checking S3 generic/method consistency ... NOTE
Found the following apparent S3 methods exported but not registered:
  knots.WCE
See section ‘Registering S3 methods’ in the ‘Writing R Extensions’
manual.

checking R code for possible problems ... NOTE
.EstimateSplineConstrainedC: no visible global function definition for
  ‘as.formula’
.EstimateSplineConstrainedC: no visible global function definition for
  ‘vcov’
.EstimateSplineConstrainedCC: no visible global function definition for
  ‘as.formula’
.EstimateSplineConstrainedCC: no visible global function definition for
  ‘glm’
.EstimateSplineConstrainedCC: no visible binding for global variable
... 36 lines ...
plot.WCE: no visible global function definition for ‘plot’
plot.WCE: no visible global function definition for ‘lines’
Undefined global functions or variables:
  as.formula binomial glm legend lines logLik matplot na.omit plot
  pnorm points quantile title vcov
Consider adding
  importFrom("graphics", "legend", "lines", "matplot", "plot", "points",
             "title")
  importFrom("stats", "as.formula", "binomial", "glm", "logLik",
             "na.omit", "pnorm", "quantile", "vcov")
to your NAMESPACE file.
```

