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
  describe("Failure cases", {
    suppressWarnings({
      test_that("it fails to construct a file module if the file does not exist", {
        expect_error(
          module("/please/dont/make/a/file/like/this/on/your/system/or/this/test/will/fail"),
          "does not exist"
        )
      })
    })
  })

  test_that("it can construct a module from a simple directory", {
    suppressWarnings({
      testthatsomemore::within_file_structure(list("a" = "a <- function(x) x + 1"), {
        dir.create(tempdir)                                            
        expect_is(module(tempdir), "module")
      })
    })
  })

  test_that("it recognizes a module derived from a directory name as a file module", {
    test_that("it can build a module from the base package", {
      suppressWarnings({
        testthatsomemore::within_file_structure(list("a" = "a <- function(x) x + 1"), {
          dir.create(tempdir)                                            
          expect_equal(module(tempdir)$type, "file")
        })
      })
    })
  })
})

