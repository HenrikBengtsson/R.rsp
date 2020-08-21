.pkgEnv <- new.env()

getRspBrackets <- function() {
  .pkgEnv$brackets
}

setRspBrackets <- function(open = "<%", close = "%>") {
  if (is.list(open)) {
    brackets <- open
    open <- brackets$open
    close <- brackets$close
  }
  
  stopifnot(
    is.character(open), length(open) == 1L, !is.na(open),
    is.character(close), length(close) == 1L, !is.na(close)
  )

  old <- getRspBrackets()
  
  .pkgEnv$brackets <- list(
    open        = open,
    close       = close,
    openEscape  = paste(open, substring(open, nchar(open)), sep = ""),
    closeEscape = paste(substring(close, 1L, 1L), close, sep = "")
  )

  invisible(old)
}
