#' Summarize a dataset.
#'
#' This function displays percent missing, class, number of unique values,
#' and an example value for each column of a dataset.
#'
#' @param df A dataset (data.frame, tibble, etc.).
#' @return Summary information as a data.frame.
#' @examples
#' quick_summary(cars)
quick_summary <- function(df) {
  data.frame(
    Feature = names(df),
    Missing = sapply(df, function(x) paste(round(sum(is.na(x)) / length(x), 2) * 100, "%")),
    Type = sapply(df, class),
    Uniques = sapply(df, function(x) length(unique((x)))),
    Example = sapply(df, function(x) x[1]),
    stringsAsFactors = FALSE)
}
