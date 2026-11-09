rows_to_df <- function(rows) {
  get <- function(i) vapply(rows, function(r) as.character(r[[i]]), character(1))
  data.frame(date = get(1), tournament = get(2), surface = get(3),
             result = get(5), opponent = get(12), opp_info = get(17),
             stringsAsFactors = FALSE)
}

compute_opp_age <- function(date, opp_info) {
  age    <- suppressWarnings(as.numeric(opp_info))
  is_dob <- grepl("^[0-9]{8}$", opp_info)
  dob    <- as.Date(opp_info[is_dob], "%Y%m%d")
  age[is_dob] <- as.numeric(as.Date(date[is_dob], "%Y%m%d") - dob) / 365.25
  age
}

clean_matches <- function(rows, player_dob) {
  df <- rows_to_df(rows)
  df$result     <- as.integer(df$result == "W")
  df$player_age <- as.numeric(as.Date(df$date, "%Y%m%d") - player_dob) / 365.25
  df$age_diff   <- df$player_age - compute_opp_age(df$date, df$opp_info)
  df[, c("date", "tournament", "surface", "opponent",
         "result", "player_age", "age_diff")]
}