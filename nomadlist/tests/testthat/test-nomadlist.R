context("checking nomadlist")

test_that("test the getnomadcities function", {
  df <- getnomadcities()
  expect_that( length(df), is_more_than(0) )
})

