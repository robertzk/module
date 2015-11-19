context("module")

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
})

