# acebayes

Version: 1.4.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Antony M. Overstall <A.M.Overstall@soton.ac.uk>’
    
    Insufficient package version (submitted: 1.4.1, existing: 1.4.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# AEDForecasting

Version: 0.20.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Nhat Cuong Pham <acmetal74@gmail.com>’
    
    Insufficient package version (submitted: 0.20.0, existing: 0.20.0)
    
    This build time stamp is over a month old.
    ```

# AFLPsim

Version: 0.4-2

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘AFLPsim-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: hybridindex
    > ### Title: Estimate hybrid index por 'hybridsim' objects
    > ### Aliases: hybridindex
    > ### Keywords: hybridization
    > 
    > ### ** Examples
    > 
    > ## simulate parentals and F1 hybrids
    > hybrids<-hybridsim(Nmarker=50, Na=10, Nb=10, Nf1=10, type="neutral", hybrid="F1")
    ########Neutral hybridization########> 
    > ## estimate hybrid index
    > hest<-hybridindex(hybrids)
    Error in if (is.na(x[[3]]) == F) { : the condition has length > 1
    Calls: hybridindex -> sim2introgress
    Execution halted
    ```

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Francisco Balao <fbalao@us.es>’
    
    Insufficient package version (submitted: 0.4.2, existing: 0.4.2)
    
    Found the following (possibly) invalid URLs:
      URL: http://personal.us.es/fbalao/software.html
        From: DESCRIPTION
        Status: 404
        Message: Not Found
      URL: http://www.r-project.org
        From: DESCRIPTION
        Status: 200
        Message: OK
        R-project URL not in canonical form
      Canonical www.R-project.org URLs use https.
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking top-level files ... WARNING
    ```
    Conversion of ‘README.md’ failed:
    pandoc: Could not fetch http://personal.us.es/fbalao/objetos/aflpsmall.jpg
    StatusCodeException (Status {statusCode = 404, statusMessage = "Not Found"}) [("Date","Sat, 06 Jan 2018 03:46:57 GMT"),("Server","Apache"),("Content-Length","226"),("Content-Type","text/html; charset=iso-8859-1"),("X-Cache","MISS from mvpersonal.us.es"),("X-Cache-Lookup","MISS from mvpersonal.us.es:80"),("Via","1.1 mvpersonal.us.es (squid)"),("Connection","keep-alive"),("X-Response-Body-Start","<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML 2.0//EN\">\n<html><head>\n<title>404 Not Found</title>\n</head><body>\n<h1>Not Found</h1>\n<p>The requested URL /fbalao/objetos/aflpsmall.jpg was not found on this server.</p>\n</body></html>\n"),("X-Request-URL","GET http://personal.us.es:80/fbalao/objetos/aflpsmall.jpg")] (CJ {expose = []})
    ```

# ALEPlot

Version: 1.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Dan Apley <apley@northwestern.edu>’
    
    Insufficient package version (submitted: 1.0, existing: 1.0)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# AntBioR

Version: 0.03

## In both

*   checking package dependencies ... ERROR
    ```
    Namespace dependency not required: ‘jsonlite’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

*   checking CRAN incoming feasibility ... NOTE
    ```
    ...
        From: DESCRIPTION
        Status: 404
        Message: Not Found
      URL: http://www1.data.antarctica.gov.au
        From: man/AntBioR.Rd
              man/antbio_cache_filename.Rd
              man/antbio_config.Rd
        Status: Error
        Message: libcurl error code 60:
        	SSL certificate problem: unable to get local issuer certificate
        	(Status without verification: OK)
      URL: http://www1.data.antarctica.gov.au/aadc/trophic/
        From: man/get_diet_data.Rd
        Status: Error
        Message: libcurl error code 60:
        	SSL certificate problem: unable to get local issuer certificate
        	(Status without verification: OK)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# aroma.core

Version: 3.1.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Henrik Bengtsson <henrikb@braju.com>’
    
    Insufficient package version (submitted: 3.1.1, existing: 3.1.1)
    
    Suggests or Enhances not in mainstream repositories:
      sfit, expectile, HaarSeg, mpcbs
    Availability using Additional_repositories specification:
      sfit        yes   https://henrikbengtsson.github.io/drat
      expectile   yes   http://r-forge.r-project.org          
      HaarSeg     yes   http://r-forge.r-project.org          
      mpcbs       yes   http://r-forge.r-project.org          
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking:
      ‘sfit’ ‘expectile’ ‘HaarSeg’ ‘mpcbs’
    ```

# babar

Version: 1.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Matthew Hartley <Matthew.Hartley@jic.ac.uk>’
    
    Insufficient package version (submitted: 1.0, existing: 1.0)
    
    The Description field should not start with the package name,
      'This package' or similar.
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking R code for possible problems ... NOTE
    ```
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

# babel

Version: 0.3-0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Adam B. Olshen <adam.olshen@ucsf.edu>’
    
    Insufficient package version (submitted: 0.3.0, existing: 0.3.0)
    
    This build time stamp is over a month old.
    ```

# baitmet

Version: 1.0.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Xavier Domingo-Almenara <xdomingo@scripps.edu>’
    
    Insufficient package version (submitted: 1.0.1, existing: 1.0.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# bayesGDS

Version: 0.6.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Michael Braun <braunm@smu.edu>’
    
    Insufficient package version (submitted: 0.6.2, existing: 0.6.2)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# bayesmeta

Version: 2.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Christian Roever <christian.roever@med.uni-goettingen.de>’
    
    Insufficient package version (submitted: 2.0, existing: 2.0)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# BayesRS

Version: 0.1.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Mirko Thalmann <mirkothalmann@hotmail.com>’
    
    Insufficient package version (submitted: 0.1.2, existing: 0.1.2)
    
    This build time stamp is over a month old.
    ```

# BayLum

Version: 0.1.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Anne Philippe <anne.philippe@univ-nantes.fr>’
    
    Insufficient package version (submitted: 0.1.1, existing: 0.1.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# biglasso

Version: 1.3-6

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Yaohui Zeng <yaohui-zeng@uiowa.edu>’
    
    Insufficient package version (submitted: 1.3.6, existing: 1.3.6)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 11.1Mb
      sub-directories of 1Mb or more:
        libs  10.4Mb
    ```

# bridgesampling

Version: 0.4-0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Quentin F. Gronau <Quentin.F.Gronau@gmail.com>’
    
    Insufficient package version (submitted: 0.4.0, existing: 0.4.0)
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Author field differs from that derived from Authors@R
      Author:    ‘Quentin F. Gronau [aut, cre] (<https://orcid.org/0000-0001-5510-6943>), Henrik Singmann [aut] (<https://orcid.org/0000-0002-4842-3657>), Jonathan J. Forster [ctb], Eric-Jan Wagenmakers [ths], The JASP Team [ctb], Jiqiang Guo [ctb], Jonah Gabry [ctb], Ben Goodrich [ctb]’
      Authors@R: ‘Quentin F. Gronau [aut, cre] (0000-0001-5510-6943), Henrik Singmann [aut] (0000-0002-4842-3657), Jonathan J. Forster [ctb], Eric-Jan Wagenmakers [ths], The JASP Team [ctb], Jiqiang Guo [ctb], Jonah Gabry [ctb], Ben Goodrich [ctb]’
    ```

# brms

Version: 2.0.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Paul-Christian Bürkner <paul.buerkner@gmail.com>’
    
    Insufficient package version (submitted: 2.0.1, existing: 2.0.1)
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.4Mb
      sub-directories of 1Mb or more:
        R     2.2Mb
        doc   2.4Mb
    ```

# brotli

Version: 1.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Jeroen Ooms <jeroen@berkeley.edu>’
    
    Insufficient package version (submitted: 1.0, existing: 1.0)
    
    This build time stamp is over a month old.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  5.8Mb
      sub-directories of 1Mb or more:
        bin    2.3Mb
        doc    1.2Mb
        libs   2.2Mb
    ```

# brr

Version: 1.0.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Stéphane Laurent <laurent_step@yahoo.fr>’
    
    Insufficient package version (submitted: 1.0.0, existing: 1.0.0)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# bst

Version: 0.3-14

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Zhu Wang <zwang@connecticutchildrens.org>’
    
    Insufficient package version (submitted: 0.3.14, existing: 0.3.14)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# bujar

Version: 0.2-3

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Zhu Wang <zwang@connecticutchildrens.org>’
    
    Insufficient package version (submitted: 0.2.3, existing: 0.2.3)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# canceR

Version: 1.10.0

## In both

*   R CMD check timed out
    

*   checking CRAN incoming feasibility ... NOTE
    ```
    ...
        171:                         metaData <- data.frame(labelDescription= colnames(myGlobalEnv$ClinicalData), row.names=colnames(myGlobalEnv$ClinicalData))        ## Bioconductor<e2><80><99>s Biobase package provides a class called AnnotatedDataFrame   
      R/getGenesClassifier.R
        153:             ##metaData <- data.frame(labelDescription= colnames(ClinicalData), row.names=colnames(ClinicalData))        ## Bioconductor<e2><80><99>s Biobase package provides a class called AnnotatedDataFrame   
        154:             metaData <- data.frame(labelDescription= "DiseasesType", row.names="DiseasesType")        ## Bioconductor<e2><80><99>s Biobase package provides a class called AnnotatedDataFrame   
      R/geteSet.R
        159:                         metaData <- data.frame(labelDescription= colnames(ClinicalData), row.names=colnames(ClinicalData))        ## Bioconductor<e2><80><99>s Biobase package provides a class called AnnotatedDataFrame   
      R/plotModel.R
        27:     rbValue3 <- tclVar("PNG") # le choix par d<c3><a9>faut
    
    The Title field should be in title case, current version then in title case:
    ‘A Graphical User Interface for accessing and modeling the Cancer Genomics Data of MSKCC.’
    ‘A Graphical User Interface for Accessing and Modeling the Cancer Genomics Data of MSKCC.’
    
    The Description field should not start with the package name,
      'This package' or similar.
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    
    Size of tarball: 63405630 bytes
    ```

*   checking for hidden files and directories ... NOTE
    ```
    Found the following hidden files and directories:
      .travis.yml
    These were most likely included in error. See section ‘Package
    structure’ in the ‘Writing R Extensions’ manual.
    
    CRAN-pack does not know about
      .travis.yml
    ```

# causaleffect

Version: 1.3.5

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Santtu Tikka <santtuth@gmail.com>’
    
    Insufficient package version (submitted: 1.3.5, existing: 1.3.5)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# chngpt

Version: 2018.1-3

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Youyi Fong <youyifong@gmail.com>’
    
    Insufficient package version (submitted: 2018.1.3, existing: 2018.1.3)
    Version contains large components (2018.1-3)
    
    Days since last update: 1
    ```

# comf

Version: 0.1.7

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Marcel Schweiker <marcel.schweiker@kit.edu>’
    
    Insufficient package version (submitted: 0.1.7, existing: 0.1.7)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# Compind

Version: 1.2.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Francesco Vidoli <fvidoli@gmail.com>’
    
    Insufficient package version (submitted: 1.2.1, existing: 1.2.1)
    ```

# CorporaCoCo

Version: 1.1-0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Anthony Hennessey <anthony.hennessey@nottingham.ac.uk>’
    
    Insufficient package version (submitted: 1.1.0, existing: 1.1.0)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# CryptRndTest

Version: 1.2.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Haydar Demirhan <haydarde@hacettepe.edu.tr>’
    
    Insufficient package version (submitted: 1.2.2, existing: 1.2.2)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘copula’
    ```

# ctmcd

Version: 1.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Marius Pfeuffer <marius.pfeuffer@fau.de>’
    
    Insufficient package version (submitted: 1.2, existing: 1.2)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# deBInfer

Version: 0.4.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Philipp H Boersch-Supan <pboesu@gmail.com>’
    
    Insufficient package version (submitted: 0.4.1, existing: 0.4.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# debrowser

Version: 1.6.8

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘debrowser-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: runHeatmap
    > ### Title: runHeatmap
    > ### Aliases: runHeatmap
    > 
    > ### ** Examples
    > 
    >     x <- runHeatmap(mtcars)
    Error in if (distance_method != "cor") { : the condition has length > 1
    Calls: runHeatmap -> heatmap.2 -> distfun
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in buildVignettes(dir = "/home/hb/repositories/R.rsp/revdep/checks/debrowser/new/debrowser.Rcheck/vign_test/debrowser") :
      Files named as vignettes but with no recognized vignette engine:
       ‘vignettes/DEBrowser.md’
    (Is a VignetteBuilder field missing?)
    Error: processing vignette 'DEBrowser.Rmd' failed with diagnostics:
    there is no package called ‘BiocStyle’
    Execution halted
    ```

*   checking CRAN incoming feasibility ... NOTE
    ```
    ...
      if any, to sign a "copyright disclaimer" for the program, if necessary.
      For more information on this, and how to apply and follow the GNU GPL, see
      <http://www.gnu.org/licenses/>.
      
        The GNU General Public License does not permit incorporating your program
      into proprietary programs.  If your program is a subroutine library, you
      may consider it more useful to permit linking proprietary applications with
      the library.  If this is what you want to do, use the GNU Lesser General
      Public License instead of this License.  But first, please read
      <http://www.gnu.org/philosophy/why-not-lgpl.html>.
    
    The Title field starts with the package name.
    The Title field should be in title case, current version then in title case:
    ‘debrowser: Interactive Differential Expresion Analysis Browser’
    ‘Debrowser: Interactive Differential Expresion Analysis Browser’
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    
    Size of tarball: 9303216 bytes
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.9Mb
      sub-directories of 1Mb or more:
        doc       6.4Mb
        extdata   2.1Mb
    ```

*   checking top-level files ... NOTE
    ```
    Non-standard file/directory found at top level:
      ‘README.pdf’
    ```

# dggridR

Version: 2.0.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Richard Barnes <rbarnes@umn.edu>’
    
    Insufficient package version (submitted: 2.0.1, existing: 2.0.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 27.5Mb
      sub-directories of 1Mb or more:
        doc    1.9Mb
        libs  25.2Mb
    ```

# DiffusionRgqd

Version: 0.1.3

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Etienne A.D. Pienaar <etiennead@gmail.com>’
    
    Insufficient package version (submitted: 0.1.3, existing: 0.1.3)
    
    This build time stamp is over a month old.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        doc   5.2Mb
    ```

# DiffusionRimp

Version: 0.1.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Etienne A.D. Pienaar <etiennead@gmail.com>’
    
    Insufficient package version (submitted: 0.1.2, existing: 0.1.2)
    
    This build time stamp is over a month old.
    ```

# DiffusionRjgqd

Version: 0.1.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Etienne A.D. Pienaar <etiennead@gmail.com>’
    
    Insufficient package version (submitted: 0.1.1, existing: 0.1.1)
    
    This build time stamp is over a month old.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.8Mb
      sub-directories of 1Mb or more:
        doc   5.6Mb
    ```

# doFuture

Version: 0.6.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Henrik Bengtsson <henrikb@braju.com>’
    
    Insufficient package version (submitted: 0.6.0, existing: 0.6.0)
    
    This build time stamp is over a month old.
    ```

# dynamichazard

Version: 0.5.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Benjamin Christoffersen <boennecd@gmail.com>’
    
    Insufficient package version (submitted: 0.5.1, existing: 0.5.1)
    
    This build time stamp is over a month old.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 25.0Mb
      sub-directories of 1Mb or more:
        data   4.2Mb
        doc    1.2Mb
        libs  19.3Mb
    ```

# easyVerification

Version: 0.4.4

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Jonas Bhend <jonas.bhend@meteoswiss.ch>’
    
    Insufficient package version (submitted: 0.4.4, existing: 0.4.4)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# ecp

Version: 3.1.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Wenyu Zhang <wz258@cornell.edu>’
    
    Insufficient package version (submitted: 3.1.0, existing: 3.1.0)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# EdSurvey

Version: 1.0.6

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Paul Bailey <pbailey@air.org>’
    
    Insufficient package version (submitted: 1.0.6, existing: 1.0.6)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# emdi

Version: 1.1.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Soeren Pannier <soeren.pannier@fu-berlin.de>’
    
    Insufficient package version (submitted: 1.1.1, existing: 1.1.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘FNN’ ‘ggmap’ ‘simFrame’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 2098 marked UTF-8 strings
    ```

# enaR

Version: 3.0.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Matthew K. Lau <enaR.maintainer@gmail.com>’
    
    Insufficient package version (submitted: 3.0.0, existing: 3.0.0)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# EnsemblePCReg

Version: 1.1.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Alireza S. Mahani <alireza.s.mahani@gmail.com>’
    
    Insufficient package version (submitted: 1.1.1, existing: 1.1.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# erah

Version: 1.0.5

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Xavier Domingo-Almenara <xdomingo@scripps.edu>’
    
    Insufficient package version (submitted: 1.0.5, existing: 1.0.5)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# flacco

Version: 1.7

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Pascal Kerschke <kerschke@uni-muenster.de>’
    
    Insufficient package version (submitted: 1.7, existing: 1.7)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# FLSSS

Version: 5.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Charlie Wusuo Liu <liuwusuo@gmail.com>’
    
    Insufficient package version (submitted: 5.2, existing: 5.2)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# forestinventory

Version: 0.3.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Andreas Hill <andreas.hill@usys.ethz.ch>’
    
    Insufficient package version (submitted: 0.3.1, existing: 0.3.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# future

Version: 1.6.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Henrik Bengtsson <henrikb@braju.com>’
    
    Insufficient package version (submitted: 1.6.2, existing: 1.6.2)
    
    This build time stamp is over a month old.
    ```

# future.BatchJobs

Version: 0.15.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Henrik Bengtsson <henrikb@braju.com>’
    
    Insufficient package version (submitted: 0.15.0, existing: 0.15.0)
    
    This build time stamp is over a month old.
    ```

# future.batchtools

Version: 0.6.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Henrik Bengtsson <henrikb@braju.com>’
    
    Insufficient package version (submitted: 0.6.0, existing: 0.6.0)
    
    This build time stamp is over a month old.
    ```

# FuzzyLP

Version: 0.1-5

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Carlos A. Rabelo <carabelo@gmail.com>’
    
    Insufficient package version (submitted: 0.1.5, existing: 0.1.5)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# FuzzyStatProb

Version: 2.0.3

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Pablo J. Villacorta <pjvi@decsai.ugr.es>’
    
    Insufficient package version (submitted: 2.0.3, existing: 2.0.3)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# GameTheory

Version: 2.7

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Sebastian Cano-Berlanga <cano.berlanga@gmail.com>’
    
    Insufficient package version (submitted: 2.7, existing: 2.7)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# gdm

Version: 1.3.4

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Matthew C. Fitzpatrick <mfitzpatrick@umces.edu>’
    
    Insufficient package version (submitted: 1.3.4, existing: 1.3.4)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# generalCorr

Version: 1.1.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘H. D. Vinod <vinod@fordham.edu>’
    
    Insufficient package version (submitted: 1.1.0, existing: 1.1.0)
    
    Days since last update: 1
    ```

# GHap

Version: 1.2.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Yuri Tani Utsunomiya <ytutsunomiya@gmail.com>’
    
    Insufficient package version (submitted: 1.2.2, existing: 1.2.2)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# gitlabr

Version: 0.9

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Jirka Lewandowski <jirka.lewandowski@wzb.eu>’
    
    Insufficient package version (submitted: 0.9, existing: 0.9)
    
    Found the following (possibly) invalid URLs:
      URL: https://blog.points-of-interest.cc/post/gitlabr/
        From: DESCRIPTION
        Status: Error
        Message: libcurl error code 60:
        	SSL certificate problem: certificate has expired
        	(Status without verification: OK)
      URL: https://gitlab.points-of-interest.cc/points-of-interest/gitlabr/issues/
        From: DESCRIPTION
        Status: Error
        Message: libcurl error code 60:
        	SSL certificate problem: certificate has expired
        	(Status without verification: Bad Gateway)
    
    This build time stamp is over a month old.
    ```

# graphite

Version: 1.24.1

## In both

*   checking CRAN incoming feasibility ... NOTE
    ```
    ...
    Maintainer: ‘Gabriele Sales <gabriele.sales@unipd.it>’
    
    Package duplicated from https://bioconductor.org/packages/3.6/bioc
    
    Package was archived on CRAN
    
    CRAN repository db overrides:
      X-CRAN-Comment: This package is now available from Bioconductor only,
        see
        <http://www.bioconductor.org/packages/release/bioc/html/graphite.html>.
    
    Found the following (possibly) invalid URLs:
      URL: http://pid.nci.nih.gov/
        From: man/nci.Rd
        Status: Error
        Message: libcurl error code 6:
        	Could not resolve host: pid.nci.nih.gov
    
    The Title field should be in title case, current version then in title case:
    ‘GRAPH Interaction from pathway Topological Environment’
    ‘GRAPH Interaction from Pathway Topological Environment’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.1Mb
      sub-directories of 1Mb or more:
        data   5.1Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 30 marked UTF-8 strings
    ```

# haplo.stats

Version: 1.7.7

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Jason P. Sinnwell <sinnwell.jason@mayo.edu>’
    
    Insufficient package version (submitted: 1.7.7, existing: 1.7.7)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# httk

Version: 1.7

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘John Wambaugh <wambaugh.john@epa.gov>’
    
    Insufficient package version (submitted: 1.7, existing: 1.7)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 13.8Mb
      sub-directories of 1Mb or more:
        data  12.3Mb
        doc    1.0Mb
    ```

# hyperSpec

Version: 0.99-20171005

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Claudia Beleites <chemometrie@beleites.de>’
    
    Insufficient package version (submitted: 0.99.20171005, existing: 0.99.20171005)
    Version contains large components (0.99-20171005)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘caTools’
    ```

# iprior

Version: 0.7.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Haziq Jamil <haziq.jamil@gmail.com>’
    
    Insufficient package version (submitted: 0.7.1, existing: 0.7.1)
    
    Uses the superseded package: ‘doSNOW’
    ```

*   checking top-level files ... WARNING
    ```
    Conversion of ‘README.md’ failed:
    pandoc: Could not fetch https://img.shields.io/codecov/c/github/haziqj/iprior/master.svg
    TlsExceptionHostPort (HandshakeFailed Error_EOF) "img.shields.io" 443
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 10.2Mb
      sub-directories of 1Mb or more:
        doc    1.1Mb
        libs   8.7Mb
    ```

# IsoriX

Version: 0.7

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Alexandre Courtiol <alexandre.courtiol@gmail.com>’
    
    Insufficient package version (submitted: 0.7, existing: 0.7)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# jsonlite

Version: 1.5

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Jeroen Ooms <jeroen@berkeley.edu>’
    
    Insufficient package version (submitted: 1.5, existing: 1.5)
    
    This build time stamp is over a month old.
    ```

*   checking compiled code ... NOTE
    ```
    File ‘jsonlite/libs/jsonlite.so’:
      Found non-API calls to R: ‘R_GetConnection’, ‘R_ReadConnection’
    
    Compiled code should not call non-API entry points in R.
    
    See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual.
    ```

# kdecopula

Version: 0.9.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Thomas Nagler <thomas.nagler@tum.de>’
    
    Insufficient package version (submitted: 0.9.1, existing: 0.9.1)
    
    This build time stamp is over a month old.
    ```

*   checking top-level files ... WARNING
    ```
    Conversion of ‘README.md’ failed:
    pandoc: Could not fetch https://img.shields.io/badge/License-GPL%20v3-blue.svg
    TlsExceptionHostPort (HandshakeFailed Error_EOF) "img.shields.io" 443
    ```

# LAGOSNE

Version: 1.1.0

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘sf’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Joseph Stachelek <stachel2@msu.edu>’
    
    Insufficient package version (submitted: 1.1.0, existing: 1.1.0)
    ```

# ldhmm

Version: 0.4.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Stephen H-T. Lihn <stevelihn@gmail.com>’
    
    Insufficient package version (submitted: 0.4.2, existing: 0.4.2)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# lexRankr

Version: 0.5.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Adam Spannbauer <spannbaueradam@gmail.com>’
    
    Insufficient package version (submitted: 0.5.0, existing: 0.5.0)
    ```

*   checking top-level files ... WARNING
    ```
    Conversion of ‘README.md’ failed:
    pandoc: Could not fetch https://img.shields.io/codecov/c/github/AdamSpannbauer/lexRankr/master.svg
    TlsExceptionHostPort (HandshakeFailed Error_EOF) "img.shields.io" 443
    ```

# listenv

Version: 0.6.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Henrik Bengtsson <henrikb@braju.com>’
    
    Insufficient package version (submitted: 0.6.0, existing: 0.6.0)
    
    This build time stamp is over a month old.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Error: processing vignette 'listenv.md.rsp' failed with diagnostics:
    there is no package called ‘markdown’
    Execution halted
    ```

# lmvar

Version: 1.4.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Marco Nijmeijer <nijmeijer@posthuma-partners.nl>’
    
    Insufficient package version (submitted: 1.4.0, existing: 1.4.0)
    
    Days since last update: 2
    ```

# lqmm

Version: 1.5.3

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    ...
              man/VarCorr.Rd
              man/ranef.Rd
        Status: 200
        Message: OK
        CRAN URL not in canonical form
      URL: http://CRAN.R-project.org/package=quantreg
        From: man/summary.lqm.Rd
        Status: 200
        Message: OK
        CRAN URL not in canonical form
      URL: http://CRAN.R-project.org/package=statmod
        From: man/gauss.quad.Rd
              man/gauss.quad.prob.Rd
        Status: 200
        Message: OK
        CRAN URL not in canonical form
      Canonical CRAN.R-project.org URLs use https.
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# madness

Version: 0.2.2

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/run-all.R’ failed.
    Last 13 lines of output:
              d xval
       calc: -------- 
              d xval
        val: 1.307766 1.468549 1.546559 1.280354 ...
       dvdx: 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ...
       varx:  ...
      ── 1. Failure: eigen functions (@test-correctness.r#400)  ──────────────────────
      comp_err(xval, thefun = thefun, scalfun = scalfun, eps = eps) is not strictly less than `errtol`. Difference: 1.09e-07
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 459 SKIPPED: 0 FAILED: 1
      1. Failure: eigen functions (@test-correctness.r#400) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Steven E. Pav <shabbychef@gmail.com>’
    
    Insufficient package version (submitted: 0.2.2, existing: 0.2.2)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# manifestoR

Version: 1.2.4

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Jirka Lewandowski <jirka.lewandowski@wzb.eu>’
    
    Insufficient package version (submitted: 1.2.4, existing: 1.2.4)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# marmap

Version: 0.9.6

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Eric Pante <pante.eric@gmail.com>’
    
    Insufficient package version (submitted: 0.9.6, existing: 0.9.6)
    
    Found the following (possibly) invalid URLs:
      URL: http://www.ngdc.noaa.gov/mgg/gdas/gd_designagrid.html (moved to https://www.ngdc.noaa.gov/mgg/gdas/gd_designagrid.html)
        From: man/aleutians.Rd
              man/as.xyz.Rd
              man/celt.Rd
              man/florida.Rd
              man/hawaii.Rd
              man/nw.atlantic.Rd
              man/read.bathy.Rd
        Status: 404
        Message: Not Found
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘maptools’
    ```

# MatchIt

Version: 3.0.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Kosuke Imai <kimai@Princeton.Edu>’
    
    Insufficient package version (submitted: 3.0.1, existing: 3.0.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking: ‘cem’ ‘WhatIf’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘rgenoud’
      All declared Imports should be used.
    ```

# matrixpls

Version: 1.0.5

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Mikko Rönkkö <mikko.ronkko@jyu.fi>’
    
    Insufficient package version (submitted: 1.0.5, existing: 1.0.5)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘sem’
    ```

# matrixStats

Version: 0.52.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Henrik Bengtsson <henrikb@braju.com>’
    
    Insufficient package version (submitted: 0.52.2, existing: 0.52.2)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  8.3Mb
      sub-directories of 1Mb or more:
        libs   7.6Mb
    ```

# MDplot

Version: 1.0.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Christian Margreitter <christian.margreitter@gmail.com>’
    
    Insufficient package version (submitted: 1.0.1, existing: 1.0.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.5Mb
      sub-directories of 1Mb or more:
        doc       1.9Mb
        extdata   5.3Mb
    ```

# MDSMap

Version: 1.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Bram Boskamp <bram.boskamp@bioss.ac.uk>’
    
    Insufficient package version (submitted: 1.0, existing: 1.0)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# metafor

Version: 2.0-0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Wolfgang Viechtbauer <wvb@metafor-project.org>’
    
    Insufficient package version (submitted: 2.0.0, existing: 2.0.0)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# metagear

Version: 0.4

## In both

*   checking whether package ‘metagear’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/home/hb/repositories/R.rsp/revdep/checks/metagear/new/metagear.Rcheck/00install.out’ for details.
    ```

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Marc J. Lajeunesse <lajeunesse@usf.edu>’
    
    Insufficient package version (submitted: 0.4, existing: 0.4)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

## Installation

### Devel

```
* installing *source* package ‘metagear’ ...
** package ‘metagear’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
R session is headless; GTK+ not initialized.

(R:9525): Gtk-WARNING **: gtk_disable_setlocale() must be called before gtk_init()
Error : .onLoad failed in loadNamespace() for 'cairoDevice', details:
  call: fun(libname, pkgname)
  error: GDK display not found - please make sure X11 is running
ERROR: lazy loading failed for package ‘metagear’
* removing ‘/home/hb/repositories/R.rsp/revdep/checks/metagear/new/metagear.Rcheck/metagear’

```
### CRAN

```
* installing *source* package ‘metagear’ ...
** package ‘metagear’ successfully unpacked and MD5 sums checked
** R
** data
*** moving datasets to lazyload DB
** inst
** preparing package for lazy loading
R session is headless; GTK+ not initialized.

(R:9534): Gtk-WARNING **: gtk_disable_setlocale() must be called before gtk_init()
Error : .onLoad failed in loadNamespace() for 'cairoDevice', details:
  call: fun(libname, pkgname)
  error: GDK display not found - please make sure X11 is running
ERROR: lazy loading failed for package ‘metagear’
* removing ‘/home/hb/repositories/R.rsp/revdep/checks/metagear/old/metagear.Rcheck/metagear’

```
# metaplus

Version: 0.7-9

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Ken Beath <ken.beath@mq.edu.au>’
    
    Insufficient package version (submitted: 0.7.9, existing: 0.7.9)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# metaSEM

Version: 0.9.16

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Mike W.-L. Cheung <mikewlcheung@nus.edu.sg>’
    
    Insufficient package version (submitted: 0.9.16, existing: 0.9.16)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# mets

Version: 1.2.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Klaus K. Holst <klaus@holst.it>’
    
    Insufficient package version (submitted: 1.2.2, existing: 1.2.2)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘lava.tobit’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 21.0Mb
      sub-directories of 1Mb or more:
        doc    1.0Mb
        libs  16.7Mb
        misc   1.1Mb
    ```

# MIAmaxent

Version: 0.4.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Julien Vollering <julien.vollering@hvl.no>’
    
    Insufficient package version (submitted: 0.4.0, existing: 0.4.0)
    
    This build time stamp is over a month old.
    ```

# micromapST

Version: 1.1.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Jim Pearson <jpearson@statnetconsulting.com>’
    
    Insufficient package version (submitted: 1.1.1, existing: 1.1.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# microPop

Version: 1.3

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Helen Kettle <Helen.Kettle@bioss.ac.uk>’
    
    Insufficient package version (submitted: 1.3, existing: 1.3)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# mpath

Version: 0.3-4

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Zhu Wang <zwang@connecticutchildrens.org>’
    
    Insufficient package version (submitted: 0.3.4, existing: 0.3.4)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# MRH

Version: 2.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Yolanda Hagar <yolanda.hagar@colorado.edu>’
    
    Insufficient package version (submitted: 2.2, existing: 2.2)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# MultiAssayExperiment

Version: 1.4.4

## In both

*   checking CRAN incoming feasibility ... NOTE
    ```
    Maintainer: ‘Marcel Ramos <marcel.ramosperez@roswellpark.org>’
    
    Package duplicated from https://bioconductor.org/packages/3.6/bioc
    
    The Title field should be in title case, current version then in title case:
    ‘Software for the integration of multi-omics experiments in Bioconductor’
    ‘Software for the Integration of Multi-Omics Experiments in Bioconductor’
    
    This build time stamp is over a month old.
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Maintainer field differs from that derived from Authors@R
      Maintainer: ‘Marcel Ramos <marcel.ramosperez@roswellpark.org>’
      Authors@R:  ‘Marcel Ramos <marcel.ramos@roswellpark.org>’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Unexported object imported by a ':::' call: ‘BiocGenerics:::replaceSlots’
      See the note in ?`:::` about the use of this operator.
    ```

*   checking for unstated dependencies in vignettes ... NOTE
    ```
    '::' or ':::' imports not declared from:
      ‘BiocInstaller’ ‘TCGAutils’
    'library' or 'require' calls not declared from:
      ‘TCGAutils’ ‘readr’
    ```

# MVisAGe

Version: 0.2.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Vonn Walter <vwalter1@pennstatehealth.psu.edu>’
    
    Insufficient package version (submitted: 0.2.0, existing: 0.2.0)
    
    This build time stamp is over a month old.
    ```

# MXM

Version: 1.3.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Michail Tsagris <mtsagris@csd.uoc.gr>’
    
    Insufficient package version (submitted: 1.3.1, existing: 1.3.1)
    
    Number of updates in past 6 months: 8
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# nCal

Version: 2017.12-3

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Youyi Fong <youyifong@gmail.com>’
    
    Insufficient package version (submitted: 2017.12.3, existing: 2017.12.3)
    Version contains large components (2017.12-3)
    
    This build time stamp is over a month old.
    ```

# NUCOMBog

Version: 1.0.4.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘J.W.M. Pullens <jeroenpullens@gmail.com>’
    
    Insufficient package version (submitted: 1.0.4.1, existing: 1.0.4.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# opencpu

Version: 2.0.5

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Jeroen Ooms <jeroen@berkeley.edu>’
    
    Insufficient package version (submitted: 2.0.5, existing: 2.0.5)
    
    This build time stamp is over a month old.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# OpenML

Version: 1.7

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Giuseppe Casalicchio <giuseppe.casalicchio@stat.uni-muenchen.de>’
    
    Insufficient package version (submitted: 1.7, existing: 1.7)
    
    This build time stamp is over a month old.
    ```

# optimization

Version: 1.0-7

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Kai Husmann <khusman1@uni-goettingen.de>’
    
    Insufficient package version (submitted: 1.0.7, existing: 1.0.7)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# PAFit

Version: 1.0.0.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Thong Pham <thongpham@thongpham.net>’
    
    Insufficient package version (submitted: 1.0.0.1, existing: 1.0.0.1)
    
    Found the following (possibly) invalid URLs:
      URL: http://iopscience.iop.org/article/10.1209/epl/i2003-00166-9/fulltext/
        From: man/Jeong.rd
              man/PAFit-package.Rd
        Status: 403
        Message: Forbidden
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# PakPC2017

Version: 0.4.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Muhammad Yaseen <myaseen208@gmail.com>’
    
    Insufficient package version (submitted: 0.4.0, existing: 0.4.0)
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘curl’ ‘stats’
      All declared Imports should be used.
    ```

# pleio

Version: 1.5

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Jason Sinnwell <sinnwell.jason@mayo.edu>’
    
    Insufficient package version (submitted: 1.5, existing: 1.5)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# plsRglm

Version: 1.1.1

## In both

*   checking examples ... ERROR
    ```
    ...
    ____Predicting X without NA neither in X nor in Y____
    ****________________________________________________****
    
    > modpls2NA=plsR(dataY=ypine,dataX=Xpine,nt=6,modele="pls",dataPredictY=Xpine_supNA)
    ____************************************************____
    ____Component____ 1 ____
    ____Component____ 2 ____
    ____Component____ 3 ____
    ____Component____ 4 ____
    ____Component____ 5 ____
    ____Component____ 6 ____
    ____Predicting X with NA in X and not in Y____
    ****________________________________________________****
    
    > 
    > #Identical to predict(modpls,type="response") or modpls$ValsPredictY
    > cbind(predict(modpls),predict(modplsform))
    Error in if (!(type %in% c("response", "scores"))) stop("Invalid type specification") : 
      the condition has length > 1
    Calls: cbind -> predict -> predict.plsRmodel
    Execution halted
    ```

*   checking CRAN incoming feasibility ... WARNING
    ```
    ...
              man/predict.plsRmodel.Rd
              man/print.coef.plsRglmmodel.Rd
              man/print.coef.plsRmodel.Rd
              man/print.cv.plsRglmmodel.Rd
              man/print.cv.plsRmodel.Rd
              man/print.plsRglmmodel.Rd
              man/print.plsRmodel.Rd
              man/print.summary.plsRglmmodel.Rd
              man/print.summary.plsRmodel.Rd
              man/summary.cv.plsRglmmodel.Rd
              man/summary.cv.plsRmodel.Rd
              man/summary.plsRglmmodel.Rd
              man/summary.plsRmodel.Rd
              inst/CITATION
        Status: Error
        Message: libcurl error code 47:
        	Maximum (20) redirects followed
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking dependencies in R code ... NOTE
    ```
    'library' or 'require' calls in package code:
      ‘MASS’ ‘plsdof’
      Please use :: or requireNamespace() instead.
      See section 'Suggested packages' in the 'Writing R Extensions' manual.
    ```

# PrevMap

Version: 1.4.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Emanuele Giorgi <e.giorgi@lancaster.ac.uk>’
    
    Insufficient package version (submitted: 1.4.1, existing: 1.4.1)
    
    Suggests or Enhances not in mainstream repositories:
      INLA
    Availability using Additional_repositories specification:
      INLA   yes   http://www.math.ntnu.no/inla/R/testing
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking whether package ‘PrevMap’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: no DISPLAY variable so Tk is not available
    See ‘/home/hb/repositories/R.rsp/revdep/checks/PrevMap/new/PrevMap.Rcheck/00install.out’ for details.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘INLA’
    ```

# profmem

Version: 0.4.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Henrik Bengtsson <henrikb@braju.com>’
    
    Insufficient package version (submitted: 0.4.0, existing: 0.4.0)
    
    This build time stamp is over a month old.
    ```

# PSCBS

Version: 0.63.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Henrik Bengtsson <henrikb@braju.com>’
    
    Insufficient package version (submitted: 0.63.0, existing: 0.63.0)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# Qtools

Version: 1.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Marco Geraci <geraci@mailbox.sc.edu>’
    
    Insufficient package version (submitted: 1.2, existing: 1.2)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# R.devices

Version: 2.15.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Henrik Bengtsson <henrikb@braju.com>’
    
    Insufficient package version (submitted: 2.15.1, existing: 2.15.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# randomLCA

Version: 1.0-13

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Ken Beath <ken.beath@mq.edu.au>’
    
    Insufficient package version (submitted: 1.0.13, existing: 1.0.13)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# randomUniformForest

Version: 1.1.5

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Saip Ciss <saip.ciss@wanadoo.fr>’
    
    Insufficient package version (submitted: 1.1.5, existing: 1.1.5)
    
    Found the following (possibly) invalid URLs:
      URL: http://CRAN.R-project.org/package=randomUniformForest
        From: inst/CITATION
        CRAN URL not in canonical form
      Canonical CRAN.R-project.org URLs use https.
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# RAppArmor

Version: 2.0.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Jeroen Ooms <jeroen.ooms@stat.ucla.edu>’
    
    Insufficient package version (submitted: 2.0.2, existing: 2.0.2)
    
    CRAN repository db overrides:
      OS_type: unix
    
    This build time stamp is over a month old.
    ```

# rbi

Version: 0.8.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Sebastian Funk <sebastian.funk@lshtm.ac.uk>’
    
    Insufficient package version (submitted: 0.8.0, existing: 0.8.0)
    
    This build time stamp is over a month old.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Error: processing vignette 'introduction.Rmd.rsp' failed with diagnostics:
    Failed to attach package:knitr
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘reshape2’
      All declared Imports should be used.
    ```

# rCAT

Version: 0.1.5

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Justin Moat <J.Moat@kew.org>’
    
    Insufficient package version (submitted: 0.1.5, existing: 0.1.5)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# rccmisc

Version: 0.3.7

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Erik Bulow <erik.bulow@rccvast.se>’
    
    Insufficient package version (submitted: 0.3.7, existing: 0.3.7)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘dplyr’
      All declared Imports should be used.
    ```

# rcss

Version: 1.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Jeremy Yee <jeremyyee@outlook.com.au>’
    
    Insufficient package version (submitted: 1.2, existing: 1.2)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 12.8Mb
      sub-directories of 1Mb or more:
        libs  12.4Mb
    ```

# rEDM

Version: 0.6.9

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Hao Ye <hao.ye@weecology.org>’
    
    Insufficient package version (submitted: 0.6.9, existing: 0.6.9)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 17.6Mb
      sub-directories of 1Mb or more:
        doc    2.1Mb
        libs  15.1Mb
    ```

# repfdr

Version: 1.2.3

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Ruth Heller <ruheller@gmail.com>’
    
    Insufficient package version (submitted: 1.2.3, existing: 1.2.3)
    
    This build time stamp is over a month old.
    ```

# revengc

Version: 1.0.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Samantha Duchscherer <sam.duchscherer@gmail.com>’
    
    Insufficient package version (submitted: 1.0.0, existing: 1.0.0)
    
    This build time stamp is over a month old.
    ```

# Rlda

Version: 0.2.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Pedro Albuquerque <pedroa@unb.br>’
    
    Insufficient package version (submitted: 0.2.2, existing: 0.2.2)
    
    This build time stamp is over a month old.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.6Mb
      sub-directories of 1Mb or more:
        libs   5.0Mb
    ```

# rmcfs

Version: 1.2.8

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Michal Draminski <michal.draminski@ipipan.waw.pl>’
    
    Insufficient package version (submitted: 1.2.8, existing: 1.2.8)
    ```

# robumeta

Version: 2.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Zachary Fisher <fish.zachary@gmail.com>’
    
    Insufficient package version (submitted: 2.0, existing: 2.0)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6 marked UTF-8 strings
    ```

# rSARP

Version: 1.0.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘John Hutcheson <jacknx8a@gmail.com>’
    
    Insufficient package version (submitted: 1.0.0, existing: 1.0.0)
    
    This build time stamp is over a month old.
    ```

# SemiCompRisks

Version: 2.8

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Kyu Ha Lee <klee@hsph.harvard.edu>’
    
    Insufficient package version (submitted: 2.8, existing: 2.8)
    
    Days since last update: 3
    ```

# SetRank

Version: 1.1.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Cedric Simillion <cedric.simillion@dkf.unibe.ch>’
    
    Insufficient package version (submitted: 1.1.0, existing: 1.1.0)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# sgd

Version: 1.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Dustin Tran <dustin@cs.columbia.edu>’
    
    Insufficient package version (submitted: 1.1, existing: 1.1)
    
    This build time stamp is over a month old.
    ```

# sourceR

Version: 1.0.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Poppy Miller <p.miller@lancaster.ac.uk>’
    
    Insufficient package version (submitted: 1.0.1, existing: 1.0.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘gtools’ ‘hashmap’ ‘reshape2’
      All declared Imports should be used.
    ```

# spam

Version: 2.1-2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Reinhard Furrer <reinhard.furrer@math.uzh.ch>’
    
    Insufficient package version (submitted: 2.1.2, existing: 2.1.2)
    
    Found the following (possibly) invalid URLs:
      URL: https://sparse.tamu.edu/
        From: man/import.Rd
        Status: 403
        Message: Forbidden
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘magic’
    ```

# SpatialEpiApp

Version: 0.3

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Paula Moraga <p.e.moraga-serrano@lancaster.ac.uk>’
    
    Insufficient package version (submitted: 0.3, existing: 0.3)
    
    Suggests or Enhances not in mainstream repositories:
      INLA
    Availability using Additional_repositories specification:
      INLA   yes   https://inla.r-inla-download.org/R/stable
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘INLA’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘RColorBrewer’ ‘SpatialEpi’ ‘dplyr’ ‘dygraphs’ ‘ggplot2’
      ‘htmlwidgets’ ‘knitr’ ‘leaflet’ ‘mapproj’ ‘maptools’ ‘rgdal’ ‘rgeos’
      ‘rmarkdown’ ‘shinyjs’ ‘spdep’ ‘xts’
      All declared Imports should be used.
    ```

# spmoran

Version: 0.1.2

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Daisuke Murakami <dmuraka@ism.ac.jp>’
    
    Insufficient package version (submitted: 0.1.2, existing: 0.1.2)
    
    This build time stamp is over a month old.
    ```

# SRCS

Version: 1.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Pablo J. Villacorta <pjvi@decsai.ugr.es>’
    
    Insufficient package version (submitted: 1.1, existing: 1.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking Rd cross-references ... NOTE
    ```
    Packages unavailable to check Rd xrefs: ‘RColorBrewer’, ‘colorspace’
    ```

# ssfa

Version: 1.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Elisa Fusco <fusco_elisa@libero.it>’
    
    Insufficient package version (submitted: 1.1, existing: 1.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
      ‘printCoefmat’
    ssfa: no visible global function definition for ‘model.frame’
    ssfa: no visible global function definition for ‘model.response’
    ssfa.fit: no visible global function definition for ‘lm’
    ssfa.fit: no visible global function definition for ‘var’
    ssfa.fit: no visible global function definition for ‘logLik’
    summary.ssfa: no visible global function definition for ‘pnorm’
    summary.ssfa: no visible global function definition for ‘logLik’
    summary.ssfa: no visible global function definition for ‘pchisq’
    summary.ssfa: no visible binding for global variable ‘df’
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

# stagePop

Version: 1.1-1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘David Nutter <david.nutter@bioss.ac.uk>’
    
    Insufficient package version (submitted: 1.1.1, existing: 1.1.1)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    genericPlot: no visible binding for global variable ‘png’
    genericPlot: no visible binding for global variable ‘tiff’
    plotStrains: no visible global function definition for ‘rainbow’
    plotStrains: no visible global function definition for ‘dev.new’
    plotStrains: no visible global function definition for ‘par’
    plotStrains: no visible global function definition for ‘plot’
    plotStrains: no visible global function definition for ‘lines’
    plotStrains: no visible global function definition for ‘legend’
    plotStrains: no visible global function definition for ‘dev.copy2pdf’
    plotStrains: no visible global function definition for ‘dev.copy2eps’
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

# STPGA

Version: 4.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Deniz Akdemir <deniz.akdemir.work@gmail.com>’
    
    Insufficient package version (submitted: 4.0, existing: 4.0)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# surrosurv

Version: 1.1.24

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Federico Rotolo <federico.rotolo@gustaveroussy.fr>’
    
    Insufficient package version (submitted: 1.1.24, existing: 1.1.24)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# tailDepFun

Version: 1.0.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Anna Kiriliouk <anna.kiriliouk@uclouvain.be>’
    
    Insufficient package version (submitted: 1.0.0, existing: 1.0.0)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# timma

Version: 1.2.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Jing Tang <jing.tang@helsinki.fi>’
    
    Insufficient package version (submitted: 1.2.1, existing: 1.2.1)
    
    Found the following (possibly) invalid URLs:
      URL: http://cancerres.aacrjournals.org/content/73/1/285/suppl/DC1
        From: man/tyner_interaction_binary.Rd
              man/tyner_interaction_multiclass.Rd
              man/tyner_sensitivity.Rd
        Status: 403
        Message: Forbidden
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# TSCS

Version: 0.1.1

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Tianjian Yang <yangtj5@mail2.sysu.edu.cn>’
    
    Insufficient package version (submitted: 0.1.1, existing: 0.1.1)
    
    This build time stamp is over a month old.
    ```

# tsdisagg2

Version: 0.1.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Jorge Vieira <jorgealexandrevieira@gmail.com>’
    
    Insufficient package version (submitted: 0.1.0, existing: 0.1.0)
    
    This build time stamp is over a month old.
    ```

# WACS

Version: 1.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Denis Allard <allard@avignon.inra.fr>’
    
    Insufficient package version (submitted: 1.0, existing: 1.0)
    
    Found the following (possibly) invalid URLs:
      URL: http://informatique-mia.inra.fr/biosp/allard#WACS
        From: DESCRIPTION
        Status: 404
        Message: Not Found
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

# WCE

Version: 1.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Marie-Pierre Sylvestre <marie-pierre.sylvestre@umontreal.ca>’
    
    Insufficient package version (submitted: 1.0, existing: 1.0)
    
    Found the following (possibly) invalid URLs:
      URL: http://cran.r-project.org/web/packages/PermAlgo/index.html
        From: man/drugdata.Rd
        Status: 200
        Message: OK
        CRAN URL not in canonical form
      The canonical URL of the CRAN page for a package is 
        https://CRAN.R-project.org/package=pkgname
    
    The Description field should not start with the package name,
      'This package' or similar.
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

*   checking S3 generic/method consistency ... NOTE
    ```
    Found the following apparent S3 methods exported but not registered:
      knots.WCE
    See section ‘Registering S3 methods’ in the ‘Writing R Extensions’
    manual.
    ```

*   checking R code for possible problems ... NOTE
    ```
    ...
    .EstimateSplineUnconstrainedNCC: no visible global function definition
      for ‘vcov’
    .knots.equi: no visible global function definition for ‘quantile’
    .sumWCEall: no visible global function definition for ‘pnorm’
    .sumWCEbest: no visible global function definition for ‘pnorm’
    checkWCE: no visible global function definition for ‘na.omit’
    plot.WCE: no visible global function definition for ‘matplot’
    plot.WCE: no visible global function definition for ‘title’
    plot.WCE: no visible global function definition for ‘points’
    plot.WCE: no visible global function definition for ‘legend’
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

# webglobe

Version: 1.0.2

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘geojsonio’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Richard Barnes <rbarnes@umn.edu>’
    
    Insufficient package version (submitted: 1.0.2, existing: 1.0.2)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    
    Size of tarball: 5002654 bytes
    ```

# Wrapped

Version: 2.0

## In both

*   checking CRAN incoming feasibility ... WARNING
    ```
    Maintainer: ‘Saralees Nadarajah <mbbsssn2@manchester.ac.uk>’
    
    Insufficient package version (submitted: 2.0, existing: 2.0)
    
    The Date field is over a month old.
    
    This build time stamp is over a month old.
    ```

