context("package")
library(testthatsomemore)

describe("Failure cases", {
  test_that("it fails if the package is not installed", {
    expect_error(package("gormalabookapook"), "is not installed")
  })
})

describe("Trivial asserts", {
  test_that("it does not fail if the package is installed", {
    testthatsomemore::assert(package("base"))
  })
})

