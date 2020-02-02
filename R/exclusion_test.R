#' Test for a significant difference between two models.
#'
#' This function takes in two model objects and a significance level.
#' It returns TRUE if there is a difference between the restricted and
#' unrestricted model.
#'
#' @param unrestricted.model A fitted model object.
#' @param restricted.model A fitted model object.
#' @param sig.level The significance level, default is 0.05.
#' @return TRUE or FALSE
#'
exclusion_test <- function(unrestricted.model, restricted.model, sig.level = 0.05) {
  df.n <- df.residual(restricted.model) - df.residual(unrestricted.model)
  numer <- (summary(unrestricted.model)$r.squared - summary(restricted.model)$r.squared) / df.n
  denom <- (1 - summary(unrestricted.model)$r.squared) / df.residual(unrestricted.model)
  F <- numer / denom
  crit.val <- pf(sig.level, df.n, df.residual(unrestricted.model))
  return(F > crit.val)
}
