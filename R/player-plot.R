#' Scatterplot of player age vs. age difference with opponent
#'
#' @param data Data frame returned by `get_career_matches()`.
#' @return A ggplot object.
#' @export
plot_age_gap = function(data) {
  ggplot2::ggplot(data, ggplot2::aes(x = .data$player_age, y = .data$age_diff,
                                     color = factor(.data$result))) +
    ggplot2::geom_hline(yintercept = 0, color = "gray40") +
    ggplot2::geom_point(alpha = 0.6, size = 2) +
    ggplot2::scale_color_manual(
      values = c("1" = "skyblue", "0" = "purple4"),
      labels = c("1" = "Match won", "0" = "Match lost"),
      breaks = c("1", "0")) +
    ggplot2::labs(x = "Player's age", y = "Age difference with opponent", color = NULL) +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "top")
}