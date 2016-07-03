context("checking nomadlist")

test_that("test the getnomadregions function", {
  df <- getnomadregions()
  expect_that( length(df), is_more_than(0) )
})

test_that("test the getnomadregion(region) function", {
  df <- getnomadregion("Europe")
  expect_that( length(df), is_more_than(0) )
})

test_that("test the getnomadcountries function", {
  df <- getnomadcountries()
  expect_that( length(df), is_more_than(0) )
})

#be aware: country in lowercase!
test_that("test the getnomadcountry(country) function", {
  df <- getnomadcountry("netherlands")
  expect_that( length(df), is_more_than(0) )
})

test_that("test the getnomadcities function", {
  df <- getnomadcities()
  expect_that( length(df), is_more_than(0) )
})

test_that("test the getnomadcity(city) function", {
  df <- getnomadcity("amsterdam-netherlands")
  expect_that( length(df), is_more_than(0) )
})
