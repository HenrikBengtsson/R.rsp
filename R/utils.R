## Using the following non-exported functions from 'tools':
##  * .get_vignette_metadata()
##  * vignette_is_tex()
##  * find_vignette_product()
import_tools <- function(name, mode = "function",
                         envir = getNamespace("tools")) {
  get(name, mode = mode, envir = envir)
}
