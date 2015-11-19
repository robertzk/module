## These are various infix operators that make it easier
## to interface with modules.
##
## The most significant operator is the colon `:` operator.
## Typically, this would be used for generating sequences of
## numbers. This makes sense when the left and right hand
## side are themselves numeric. However, there is no reason
## why we should not extend the syntax to act as a namespacing
## mechanism. In particular, if module `animal` contains a submodule
## `dog`, we should be allowed to retrieve it through `animal:dog`,
## and thereafter access any members within.
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

