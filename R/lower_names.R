#' Makes the columns of the dataset lowercase.
#'
#' @param df A dataset (data.frame, tibble, etc.).
#' @return The same dataset, but with lowercase column names.
#' @examples
#' lower_names(data.frame("A" = c(1,2,3), "B" = seq(1:3)))
lower_names <- function(df) { names(df) <- tolower(names(df)); df }
