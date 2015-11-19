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

}

