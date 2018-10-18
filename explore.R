# explore.R
#
# This file has functions for quickly 
# loading and exploring a data set.

quick.summary <- function(df){
  # Shows each column, if it has nans, its type, and an example value
  N <- length(df)
  rv <- data.frame(Feature = colnames(df)
                 , Missing = rep(NA, N)
                 , Type = rep("", N)
                 , Uniques = rep(NA, N)
                 , Example = rep(NA, N)
                 , stringsAsFactors = FALSE)
  i <- 1
  for (feature in rv$Feature){
    column <- df[, feature]
    rv[i, ] <- list(feature
                  , paste(sum(is.null(column)) / length(column), "%")
                  , class(column)
                  , length(unique(column))
                  , column[1])
    i <- i + 1
  }
  return(rv)
}
