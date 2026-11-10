test_that("female opponent age comes from birthdate", {
  df  <- rows_to_df(extract_match_rows(read_fixture("FemalePlayerCareer.js")))
  expect_equal(compute_opp_age(df$date, df$opp_info)[1], 18.78, tolerance = 0.01)
})

test_that("male opponent age is used as given", {
  df <- rows_to_df(extract_match_rows(read_fixture("MalePlayerCareer.js")))
  expect_equal(compute_opp_age(df$date, df$opp_info)[1], 22.264202601)
})

test_that("clean_matches codes results and computes age_diff", {
  rows <- extract_match_rows(read_fixture("MalePlayerCareer.js"))
  out  <- clean_matches(rows, as.Date("1981-09-26"))
  expect_equal(out$result, c(0L, 0L, 1L))
  expect_equal(out$age_diff,
               out$player_age - c(22.264202601, 24.2902121834, 18.7597535934))
})