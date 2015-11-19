context("package")
library(testthatsomemore)

describe("Failure cases", {
  test_that("it fails if the package is not installed", {
    expect_error(package("gormalabookapook"), "is not installed")
  })
})

