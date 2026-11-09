extract_match_rows <- function(js) {
  pattern <- "var morematchmx = \\K\\[\\[.*?\\]\\](?=\\s*(;|$))"
  m <- regmatches(js, regexpr(pattern, js, perl = TRUE))
  if (length(m) == 0) stop("No match data found in the file.", call. = FALSE)
  jsonlite::fromJSON(m, simplifyVector = FALSE)
}

parse_player_dob <- function(html) {
  m <- regmatches(html, regexpr("var dob\\s*=\\s*['\"]?[0-9]{8}", html))
  if (length(m) == 0) return(as.Date(NA))
  as.Date(sub(".*([0-9]{8})$", "\\1", m), "%Y%m%d")
}