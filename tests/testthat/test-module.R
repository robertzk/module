context("module")

describe("Failure cases", {
  test_that("it fails to construct a module if a character is not passed as the first argument", {
    lapply(list(NULL, new.env(), list(a = 1), 1, function() { }, 1.0 + 2.0i), function(el) {
      expect_error(module(el), "Invalid path passed")
      expect_error(module(el), class(el)[1L])
    })
  })
})

