# explore.R
#
# This file has functions for quickly 
# loading and exploring a data set.

# Shows each column, if it has nans, its type, and an example value
quick_summary <- function(df){
  rv <- data.frame(Feature = names(df),
                   Missing = sapply(df, function(x) paste(round(sum(is.na(x)) / length(x), 2) * 100, "%")),
                   Type = sapply(df, function(x) class(x)),
                   Uniques = sapply(df, function(x) length(unique((x)))),
                   Example = sapply(df, function(x) x[1]),
                   stringsAsFactors = FALSE)
  return(rv)
}

# This function creates a percentile rank of a vector.
percentile_rank <- function(x) trunc(rank(x, na.last = "keep")) / sum(!is.na(x))
