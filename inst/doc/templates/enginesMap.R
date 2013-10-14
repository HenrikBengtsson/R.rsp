# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Functions for weaving and tangling different vignette formats
# [only for R (< 3.0.0)]
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# RSP vignettes
`R.rsp::rsp` <- `rsp` <- function(file, ...) {
  R.rsp::rspWeave(file, ...);
  R.rsp::rspTangle(file, ...);
}

# Sweave vignettes
`utils::Sweave` <- `Sweave` <- function(file, ...) {
  utils::Sweave(file, ...);
  utils::Stangle(file, ...);
}

# knitr vignettes
`knitr::knitr` <- `knitr` <- function(file, ...) {
  knitr:::vweave(file, ...);
  knitr:::vtangle(file, ...);
}

# noweb vignettes
`noweb::noweb` <- `noweb` <- function(file, ...) {
  noweb::noweave(file, ...);
  noweb::notangle(file, ...);
}
