`%||%` <- function(x, y) if (is.null(x)) y else x

is.simple_string <- function(x) {
  is.character(x) && length(x) == 1 &&
  !is.na(x) && nzchar(x)
}

file <- function(path) {
  structure(path, class = "file")
}

is.installed_package <- function(package) {
  is.element(package, utils::installed.packages()[, 1L])
}

