############################################################################
# This source file should be launched by inst/doc/Makefile.
# For each PDF vignette, it builds an *.Rnw place holder, iff missing.
# It require the R.rsp package.
#
# Author: Henrik Bengtsson
############################################################################

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Read and parse the inst/doc/00index.dcf of the package being built
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
toc <- read.dcf("00Index.dcf");
toc <- as.data.frame(toc, stringsAsFactors=FALSE);
toc$Files <- lapply(toc$Files, FUN=function(x) {
  files <- unlist(strsplit(x, split=",", fixed=TRUE));
  files <- gsub("^[ \t]*", "", files);
  files <- gsub("[ \t]*$", "", files);
  types <- gsub("(|(.*):).*", "\\2", files);
  exts <- gsub(".*[.]([^.]*)$", "\\1", files);
  types[nchar(types) == 0] <- exts[nchar(types) == 0];
  files <- gsub(".*:", "", files);
  names(files) <- types;
  files;
});
toc$hasPDF <- lapply(toc$Files, FUN=function(x) {
  is.element("pdf", tolower(names(x)));
});
toc$hasSource <- lapply(toc$Files, FUN=function(x) {
  any(is.element(c("html.rsp", "tex.rsp", "Rnw"), tolower(names(x))));
});


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Add missing Rnw files
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
for (ii in seq(length=nrow(toc))) {
  files <- toc$Files[[ii]];
  types <- names(files);
  
  # Create a dummy Rnw for each PDF file, iff missing
  if (toc$hasPDF[[ii]]) {
    filename <- files["pdf"];
    rnwFilename <- gsub("pdf$", "Rnw", filename);
    if (!file.exists(rnwFilename)) {
      rspFilename <- sprintf("%s.rsp", rnwFilename);
      if (!file.exists(rspFilename)) {
        pathname <- system.file("doc/templates/dummy.Rnw.rsp", package="R.rsp");
        file.copy(pathname, to=rspFilename);
      }
      local({
        hasSource <- toc$hasSource[[ii]];
        title <- toc$Title[ii];
        keywords <- toc$Keywords[ii];
        library("R.rsp");
        rsp(rspFilename, force=TRUE);
      });
      file.remove(rspFilename);
    }
  } # if (toc$hasPDF[ii])
} # for (ii ...)


############################################################################
# HISTORY:
# 2011-11-22
# o Created.
############################################################################
