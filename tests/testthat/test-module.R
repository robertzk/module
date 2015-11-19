context("module")

describe("Failure cases", {
  test_that("it fails to construct a module if a character is not passed as the first argument", {
    expect_error(module(NULL), "Invalid path passed")
  })
})

