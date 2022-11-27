#' Test for significant difference in power between a model and a simpler
#' submodel.
#'
#' @param fixed_effects List of names of fixed effects including both continuous
#'   and categorical variables.
#' @param effect_size Effect size of the fixed effects.
#' @param discrete_indicators List of boolean values indicating whether the
#'   corresponding fixed effect is discrete or continuous.
#' @param discrete_effects_levels List of levels of the discrete effects.
#'   Corresponding elements are NULL for continuous effects and a vector of
#'   levels for discrete effects.
#' @param random_effect List of names of random effects.
#' @param random_effect_levels Levels of the random effects.
#' @param random_effect_cov Variance and covariances for random effects.
#' @param residual_sd Residual standard deviation.
#' @param response Response variable name.
#' @param family Family of model.
#' @param comparison_formula Formula for the comparison model.
#' @param nsim number of simulations to perform
#' @param seed random number generator seed, for reproducible results
#'
#' @return Power analysis results.
#' @export
compare_model <- function(fixed_effects = NULL,
                          effect_size = NULL,
                          discrete_indicators = NULL,
                          discrete_effects_levels = NULL,
                          random_effect = NULL,
                          random_effect_levels = NULL,
                          random_effect_cov = NULL,
                          residual_sd = 1,
                          response = NULL,
                          family = NULL,
                          comparison_formula = NULL,
                          nsim = 1000,
                          seed = NULL) {

  fit <- get_model(fixed_effects = fixed_effects,
                   effect_size = effect_size,
                   discrete_indicators = discrete_indicators,
                   discrete_effects_levels = discrete_effects_levels,
                   random_effect = random_effect,
                   random_effect_levels = random_effect_levels,
                   random_effect_cov = random_effect_cov,
                   residual_sd = residual_sd,
                   response = response,
                   family = family)

  simr::powerSim(fit = fit,
                 test = simr::fcompare(comparison_formula),
                 nsim = nsim,
                 seed = seed)
}
