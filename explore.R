# explore.R
#
# This file has functions for quickly 
# loading and exploring a data set.

# TODO: Make this better (lol)
# Shows each column, if it has nans, its type, and an example value
quick.summary <- function(df) {
  N <- length(df)
  rv <- data.frame(Feature = colnames(df),
                   Missing = rep(NA, N),
                   Type = rep("", N),
                   Uniques = rep(NA, N),
                   Example = rep(NA, N),
                   stringsAsFactors = FALSE)
  i <- 1
  for (feature in rv$Feature) {
    column <- df[[feature]]
    rv[i, ] <- list(feature,
                    paste(round(sum(is.na(column)) / length(column), 2) * 100, "%"),
                    class(column),
                    length(unique(column)),
                    column[1])
    i <- i + 1
  }
  return(rv)
}

# This function creates a percentile rank of a vector.
percentile_rank <- function(x) trunc(rank(x)) / length(x)
