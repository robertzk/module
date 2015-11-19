context("module")
library(testthatsomemore)

describe("Failure cases", {
  test_that("it fails to construct a module if a character is not passed as the first argument", {
    lapply(bag_of_objects, function(el) {
      expect_error(module(el), "Invalid path passed")
      expect_error(module(el), class(el)[1L])
    })
  })

  test_that("it fails to construct a module if a simple character vector is not passed as the first argument", {
    expect_error(module(""), "I expected a non-NA")
  })
})

describe("Interfacing with packages", {
  test_that("it can construct a module from a package name", {
    test_that("it can build a module from the base package", {
      expect_is(module("base"), "module")
    })
  })

  test_that("it recognizes a module derived from a package name as a package module", {
    test_that("it can build a module from the base package", {
      expect_equal(module("base")$type, "package")
    })
  })
})

describe("Interfacing with directories", {
  test_that("it can construct a module from a simple directory", {
    testthatsomemore::within_file_structure(list("a" = "a <- function(x) x + 1"), {
      expect_is(module(tempdir), "module")
    })
  })
})

