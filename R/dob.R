dob_page_urls <- function(name) {
  p <- format_player_name(name)
  paste0("https://www.tennisabstract.com/cgi-bin/", c("wplayer", "player"),
         ".cgi?p=", p)
}

fetch_player_dob <- function(name) {
  for (url in dob_page_urls(name)) {
    html <- tryCatch(paste(suppressWarnings(readLines(url)), collapse = " "),
                     error = function(e) "")
    dob <- parse_player_dob(html)
    if (!is.na(dob)) return(dob)
  }
  stop("Could not find the date of birth for '", name, "'.", call. = FALSE)
}