## These are various infix operators that make it easier
## to interface with modules.

#' @aliases base::colon
#' @export
`:` <- function(e1, e2) {
  UseMethod(":")
}

#' @export
`:.default` <- base::`:`

`:.module` <- function(e1, e2) {
  .NotYetImplemented()
}

