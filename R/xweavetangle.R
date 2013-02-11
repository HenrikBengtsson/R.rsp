rspWeave <- function(file, ..., quiet=FALSE) {
  pathname <- rspPlain(pathname=file, verbose=!quiet);
  wasFileGenerated <- inherits(pathname, "character");
  if (wasFileGenerated) {
    pathname <- getAbsolutePath(pathname);
  }
  pathname;
} # rspWeave()

rspTangle <- function(file, ...) {
  pathname <- rspWeave(file=file, ..., quiet=TRUE);
  pathnameR <- sprintf("%s.R", pathname);
  pathnameR <- getAbsolutePath(pathnameR);
  pathnameR;
} # rspWeave()
