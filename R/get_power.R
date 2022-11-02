#' Obtain the power analysis on a model.
#'
#' @param fixed_effects List of names of fixed effects.
#' @param random_effects List of names of random effects.
#' @param effect_size Effective sample size.
#' @param effect_sd Effective sample standard deviation.
#' @param response Response variable
#' @param family Family of model
#'
#' @return Power analysis results.
#' @export
get_power <- function(fixed_effects = NULL,
                      random_effects = NULL,
                      effect_size = NULL,
                      effect_sd = NULL,
                      response = NULL,
                      family = NULL) {
    
    fit <- get_model(fixed_effects,
                     random_effects,
                     effect_size,
                     effect_sd,
                     response,
                     family)
    
    # simulate using powersim in simr package 
    
  return()
}