#' Transpose and return a tibble.
#'
#' @param df A dataset (data.frame, tibble, etc.).
#' @param new.names A vector of names for the new columns (optional).
#' @return A transposed dataset as a tibble.
#' @examples
#' df <- rbind(apply(cars, 2, mean), apply(cars, 2, sd))
#' tt(df, new.names = c("m", "s"))
tt <- function(df, new.names = NULL) {
  rv <- tibble::as_tibble(t(df), name_repair = "minimal")
  if (length(new.names) > 0) {
    names(rv) <- new.names
  }
  return(rv)
}
