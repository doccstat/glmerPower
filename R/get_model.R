#' Obtain a model from supplied parameters.
#'
#' @param fixed_effects List of names of fixed effects including both continuous
#'   and categorical variables.
#' @param effect_size Effect size of the fixed effects.
#' @param discrete_indicators List of boolean values indicating whether the
#'   corresponding fixed effect is discrete or continuous.
#' @param discrete_effect_levels List of levels of the discrete effects.
#'   Corresponding elements are NULL for continuous effects and a vector of
#'   levels for discrete effects.
#' @param random_effect List of names of random effects.
#' @param random_effect_levels Levels of the random effects.
#' @param random_effects_cov Variance and covariances for random effects.
#' @param residual_sd Residual standard deviation.
#' @param response Response variable name.
#' @param family Family of model.
#'
#' @return model with supplied parameters
#' @export
get_model <- function(fixed_effects = NULL,
                      effect_size = NULL,
                      discrete_indicators = NULL,
                      discrete_effect_levels = NULL,
                      random_effect = NULL,
                      random_effect_levels = NULL,
                      random_effects_cov = NULL,
                      residual_sd = 1,
                      response = NULL,
                      family = NULL) {

  data <- list()
  for (fixed_effect_index in seq_len(length(fixed_effects))) {
    fixed_effect <- fixed_effects[fixed_effect_index]
    if (discrete_indicators[fixed_effect_index]) {
      data[[fixed_effect]] <- discrete_effect_levels[[fixed_effect_index]]
    } else {
      data[[fixed_effect]] <- seq(0, 1, length.out = 10)
    }
  }
  data[[random_effect]] <- random_effect_levels
  data <- expand.grid(data)
  fit <- if (is.null(family)) {
    simr::makeLmer(
      formula = stats::as.formula(paste0(response, " ~ ",
                                         paste(fixed_effects, collapse = " + "),
                                         " + (1 | ", random_effect, ")")),
      fixef = effect_size,
      VarCorr = random_effects_cov,
      sigma = residual_sd,
      data = data
    )
  } else {
    simr::makeGlmer(
      formula = stats::as.formula(paste0(response, " ~ ",
                                         paste(fixed_effects, collapse = " + "),
                                         " + (1 | ", random_effect, ")")),
      family = family,
      fixef = effect_size,
      VarCorr = random_effects_cov,
      data = data
    )
  }

  return(fit)
}
