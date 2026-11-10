test_that("names are formatted consistently", {
  expect_equal(format_player_name("serena williams"), "SerenaWilliams")
  expect_equal(format_player_name("SerenaWilliams"), "SerenaWilliams")
  expect_equal(format_player_name("  Rafael   Nadal "), "RafaelNadal")
})