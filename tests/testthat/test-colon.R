context("colon operator")

describe("Fail cases", {
  test_that("it fails as usual for non-module inputs", {
    bag_of_objects2 <- Filter(function(x) !is.numeric(x) && !is.complex(x), bag_of_objects)
    lapply(bag_of_objects2, function(x) lapply(bag_of_objects2, function(y) {
      expect_error(x:y)
    }))
  })
})

