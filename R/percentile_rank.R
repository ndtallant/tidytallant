#' Creates the percentile rank of a vector.
#'
#' @param x A numeric column.
#' @return The input percentile ranked (vector).
#' @examples
#' percentile_rank(seq(1:10))
percentile_rank <- function(x) trunc(rank(x, na.last = "keep")) / sum(!is.na(x))
