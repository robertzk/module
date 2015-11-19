#' An S3 class representing metadata about a package.
#'
#' @param name character. The name of the package. It
#'   must be installed in the user's currently active
#'   library.
package <- function(name) {
  # TODO: (RK) Find path using system.file, determine
  # if installed.
  structure(list(name = name), class = "package")
}

