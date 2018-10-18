# explore.R
#
# This file has functions for quickly 
# loading and exploring a data set.

quick.summary <- function(df){
  # Shows each column, if it has nans, its type, and an example value
  rv <- Data.Frame() 
  cols <- c("Feature"   # column
          , "% Missing" # sum(is.null(column)) / length(column)
          , "Type"      # class(column)
          , "Uniques"   # length(unique(column))
          , "Example"   # column[1]
           ) 
  
}

percent.missing <- function(column){
  return(sum(is.null(column)) / length(column))
}

nunique <- function(column){
  return(length(unique(column)))
}
