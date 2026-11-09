#' Get the career matches of a tennis player
#'
#' @param name Player name, e.g. "Serena Williams" or "SerenaWilliams".
#' @return Data frame with date, tournament, surface, opponent, result
#'   (1 = win, 0 = loss), player_age and age_diff (player minus opponent).
#' @export

get_career_matches <- function(name) {
  js <- fetch_career_js(name)
  clean_matches(extract_match_rows(js), fetch_player_dob(name))
}