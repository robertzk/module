## A dictionary of messages used by the package.
## We separate these into its own file to avoid cluttering
## the R code with a multitude of strings.
messages <- list(
  invalid_module_path = c("Invalid path passed to the ",
    sQuote("path"), " parameter to the ", sQuote("module"),
    " function: I received a ", crayon::red("{{{klass}}}"), 
    " but was expecting a ", crayon::yellow("character"), "."),

  invalid_module_character_path = c("Invalid path passed to the ",
    sQuote("path"), " parameter to the ", sQuote("module"),
    " function: I expected an non-NA non-blank character vector
    of length 1")
)

## Cleanse the message a little after fetching it from the `messages` list.
msg <- function(name) {
  stopifnot(name %in% names(messages))

  ## The `gsub` will squish multiple spaces into a single space,
  ## while the `paste(collapse = "", ...)` usage will ensure we
  ## can take vectors of characters in the above `messages` list.
  paste(collapse = "", gsub("[ ]+", " ", messages[[name]]))
}

## We use the [whisker](https://github.com/edwindj/whisker) templating
## engine to inject any additional values into the message string.
## For example,
## 
## ```r
## m("invalid_module_path", klass = "bloop")
## ```
##
## would return the appropriate error with the string "bloop" injected
## in the appropriate place.
m <- function(name, ...) {
  ## Note the use of [`do.call`](http://www.inside-r.org/r-doc/base/do.call),
  ## a very handy R metaprogramming tool when we do not know exactly which 
  ## arguments we will pass.
  do.call(whisker::whisker.render, list(msg(name), list(...)))
}


