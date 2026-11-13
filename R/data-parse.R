extract_match_rows <- function(js) {
  start <- regexpr("var morematchmx\\s*=\\s*", js)
  if (start == -1) stop("No match data found in the file.", call. = FALSE)
  rest <- substring(js, start + attr(start, "match.length"))
  end  <- regexpr("\\]\\s*;", rest)            
  if (end == -1) end <- regexpr("\\]\\s*$", rest) 
  jsonlite::fromJSON(substr(rest, 1, end), simplifyVector = FALSE)
}

parse_player_dob <- function(html) {
  m <- regmatches(html, regexpr("var dob\\s*=\\s*['\"]?[0-9]{8}", html))
  if (length(m) == 0) return(as.Date(NA))
  as.Date(sub(".*([0-9]{8})$", "\\1", m), "%Y%m%d")
}