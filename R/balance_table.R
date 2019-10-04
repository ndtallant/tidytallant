#' Makes the columns of the dataset lowercase.
#'
#' @param df A dataset (data.frame, tibble, etc.).
#' @param treatment The treatment variable as a string.
#' @param variables The subset of columns to test for balance. Select all columns by default.
#' @return A balance table with columns term, estimate, std.error, statistic, and p.value.
#'         Term is the variable being tested. Estimate is the distance between the means of treated
#'         and untreated groups. The p.value is the likelihood that distance is up to chance. In this
#'         case then null hypothesis is that the treatment and control groups are the same.
balance_table <- function(df, treatment, variables=names(df)) {
  # Remove the treatment variable from testing variables.
  variables <- variables[!variables %in% treatment]
  formula <- paste("~", treatment) 
  df <- purrr::map_df(
    variables, 
    function(x) {broom::tidy(lm(paste(x,formula), data = df))[2,]}
  )
  df$term <- variables
  return(df)
}