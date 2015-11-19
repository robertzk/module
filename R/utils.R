`%||%` <- function(x, y) if (is.null(x)) y else x

is.simple_character_vector <- function(x) {
  is.character(x) && all(nzchar(x)) &&
  !any(is.na(x)) && length(x) > 0 &&
  length(unique(x)) == length(x)
}

