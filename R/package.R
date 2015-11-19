#' An S3 class representing metadata about a package.
#'
#' @param name character. The name of the package. It
#'   must be installed in the user's currently active
#'   library.
#' @param check_installed logical. Check whether the
#'   package is installed or not, by default \code{TRUE}.
#' @return An S3 \code{package} object.
package <- function(name, check_installed = TRUE) {
  if (isTRUE(check_installed) && !is.installed_package(name)) {
    stop(m("non_installed_package", pkgname = name))
  }

  structure(list(name = name), class = "package")
}

