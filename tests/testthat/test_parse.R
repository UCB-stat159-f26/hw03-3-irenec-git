test_that("rows are extracted from female and male files", {
  expect_length(extract_match_rows(read_fixture("FemalePlayerCareer.js")), 3)
  expect_length(extract_match_rows(read_fixture("MalePlayerCareer.js")), 3)
})

test_that("missing match data gives a meaningful error", {
  expect_error(extract_match_rows("<html>nope</html>"), "No match data")
})

test_that("player dob is parsed from page text", {
  expect_equal(parse_player_dob("var dob = 19810926; var ht = 175;"), as.Date("1981-09-26"))
  expect_true(is.na(parse_player_dob("<html>no birthdate here</html>")))
})