# CRAN submission future 0.44.0

on 2020-07-09

I've verified that this submission does not cause issues for the 277 reverse package dependencies available on CRAN and Bioconductor.

Thanks in advance


## Notes not sent to CRAN

### R CMD check validation

The package has been verified using `R CMD check --as-cran` on:

| R version | GitHub Actions | Travis CI | AppVeyor CI | Rhub      | Win-builder | Other  |
| --------- | -------------- | --------- | ----------- | --------- | ----------- | ------ |
| 3.3.x     |                |           |             |           |             |        |
| 3.4.x     |                |           |             |           |             |        |
| 3.5.x     |                |           |             |           |             |        |
| 3.6.x     |                | L, M      |             | L         |             |        |
| 4.0.x     |                | L, M      | W           |        S  | W           |        |
| devel     |                | L         | W (32 & 64) | L,   W    |             |        |

*Legend: OS: L = Linux, S = Solaris, M = macOS, W = Windows.  Architecture: 32 = 32-bit, 64 = 64-bit*
