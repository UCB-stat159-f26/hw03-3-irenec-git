format_player_name = function(name) {
  words <- strsplit(trimws(name), "\\s+")[[1]]
  paste(paste0(toupper(substring(words, 1, 1)), substring(words, 2)), collapse = "")
}

fetch_career_js = function(name) {
  url <- paste0("https://www.tennisabstract.com/jsmatches/",
                format_player_name(name), "Career.js")
  tryCatch(
    paste(suppressWarnings(readLines(url)), collapse = " "),
    error = function(e) stop("Player '", name, "' not found. Check the spelling.",
                             call. = FALSE)
  )
}