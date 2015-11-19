# TODO: (RK) Dcoument modules more extensively.
## Typical modularization of R code is done through [packages](http://r-pkgs.had.co.nz/).
## However, packages have a few design limitations that prevents
## their widespread use by developers.
##
##   1. Packages do not solve the problem of hierarchical namespacing.
##      In particular, languages like Ruby have good support for
##      a primitive called a [module](http://ruby-doc.org/core-2.2.0/Module.html) and
##      C++ has a primitive termed a [namespace](https://en.wikipedia.org/wiki/Namespace);
##      R, despite being a functional language with roots to the [LISP](https://en.wikipedia.org/wiki/LISP)
##      currently does not have a good hierachical namespacing system.
##   2. Hierarchical file structures and exports. In particular, R packages
##      are limited to flat directory structures for historical reasons
##      decided by the R core team.
##
## Both of these limitations are legitimate problems because organizing
## large codebases managed by teams of dozens or hundreds of developers
## is difficult or unpleasant without a sane hierarchical namespacing system.
## 
## **Modules** aim to partially allay this problem by building a hierarchical
## namespacing mechanism on top of [environments](http://adv-r.had.co.nz/Environments.html),
## a well-defined and well-understood primitive data structure in R.
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

  module_new(path2module_object(path))
}

path2module_object <- function(path) {
  if (is.installed_package(path)) {
    package(path, check_installed = FALSE)
  } else {
    file(path)
  }
}

module_new <- function(object) {
  UseMethod("module_new")
}

module_new.file <- function(object) {
  if (!file.exists(object)) {
    stop(m("invalid_module_filepath", path = object))
  }

  build_module(construct_env_from_dir(object), dirname(object), "file")
}

module_new.package <- function(object) {
  build_module(getNamespace(object$name), object$name, "package")
}

build_module <- function(env, name, type) {
  structure(list(
    env  = env,
    name = name,
    type = type
  ), class = "module")
}

construct_env_from_dir <- function(dir) {
  # TODO: (RK) Build the module.
  new.env()
}

