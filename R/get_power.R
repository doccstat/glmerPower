#' Obtain the power analysis on a model.
#'
#' @param fit lme4 object
#' @param fixed_effects List of names of fixed effects.
#' @param random_effects List of names of random effects.
#' @param effect_size Effective sample size.
#' @param effect_sd Effective sample standard deviation.
#' @param response Response variable
#' @param family Family of model
#'
#' @return Power analysis results.
#' @export
get_power <- function(fit = NULL,
                      fixed_effects = NULL,
                      random_effects = NULL,
                      effect_size = NULL,
                      effect_sd = NULL,
                      response = NULL,
                      family = NULL) {

  simr::powerSim(fit = fit)

  return()
}