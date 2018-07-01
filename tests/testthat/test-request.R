context("request")

test_that("get_event works", {
  res <- songkickr:::get_event(3037536)

  expect_is(res, "list")
  expect_equal(names(res), "resultsPage")
})
