# Weaves and tangles for RSP vignettes
"R.rsp::rsp" <- function(file, ...) {
  R.rsp::rspWeave(file, ...);
  R.rsp::rspTangle(file, ...);
}
