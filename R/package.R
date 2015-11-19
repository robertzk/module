#' An S3 class representing metadata about a package.
#'
#' @param name character. The name of the package. It
#'   must be installed in the user's currently active
#'   library.
package <- function(name) {
  if (!is.installed_package(name)) {
    stop(m("non_installed_package", pkgname = name))
  }

  structure(list(name = name), class = "package")
}

