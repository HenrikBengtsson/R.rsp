library("R.rsp")

if (Sys.getenv("_R_CHECK_FULL_") != "") {
  urlPath <- "https://raw.github.com/yihui"
  filenames <- c(
    "knitr/master/inst/examples/knitr-minimal.Rnw",
    "knitr-examples/master/001-minimal.Rmd",
    "knitr-examples/master/003-minimal.Rhtml",
    "knitr-examples/master/005-latex.Rtex",
    "knitr-examples/master/006-minimal.Rrst"
  );
  urls <- file.path(urlPath, filenames);
  outPath <- file.path("demos", "knitr");
  for (kk in seq_along(urls)) {
    url <- urls[kk];
    workdir <- file.path(outPath, gsub(".*[.]", "", url));
    output <- rfile(url, workdir=workdir, verbose=TRUE);
    print(output)
  }
}

