## Using the following non-exported functions from 'tools':
##  * .get_vignette_metadata()
##  * vignette_is_tex()
##  * find_vignette_product()
import_tools <- function(name, mode = "function",
                         envir = getNamespace("tools")) {
  get(name, mode = mode, envir = envir)
}

stop_if_not <- function(...) {
  res <- list(...)
  n <- length(res)
  if (n == 0L) return()

  for (ii in 1L:n) {
    res_ii <- .subset2(res, ii)
    if (length(res_ii) != 1L || is.na(res_ii) || !res_ii) {
        mc <- match.call()
        call <- deparse(mc[[ii + 1]], width.cutoff = 60L)
        if (length(call) > 1L) call <- paste(call[1L], "...")
        stop(sQuote(call), " is not TRUE", call. = FALSE, domain = NA)
    }
  }
}

