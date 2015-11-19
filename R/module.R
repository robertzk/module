# TODO: (RK) Dcoument modules more extensively.
#' Load and attach an R module in the current environment.
#'
#' Modules are light wrappers around environments that provide
#' better support for hierarching namespacing.
#'
#' @param path character. If \code{path} is a character vector giving
#'   an installed package in the current library path, a module
#'   encompassing that package will be returned. Otherwise, the
#'   directory given by the path will be loaded as a module.
#' @return a \code{module} object.
module <- function(path) {
  if (!is.character(path)) {
    stop(m("invalid_module_path", klass = class(path)[1L]))
  }
  
  if (!is.simple_string(path)) {
    stop(m("invalid_module_character_path"))
  }

  module_(path)
}

module_ <- function(path) {
  if (package_exists(path)) {
    object <- package(path)
  } else {
    object <- file(path)
  }

  module_new(object)
}

module_new <- function(object) {
  UseMethod("module_new")
}

module_new.file <- function(object) {
  NULL
}

module_new.package <- function(object) {
  NULL
}

