#' Obtain a model from supplied parameters.
#'
#' @param fixed_effects List of names of fixed effects.
#' @param random_effects List of names of random effects.
#' @param effect_size Effective sample size.
#' @param effect_sd Effective sample standard deviation.
#' @param response Response variable
#' @param family Family of model
#' @param size Number of observations
#'
#' @return model with supplied parameters
#' @export
get_model <- function(fixed_effects = NULL,
                      random_effects = NULL,
                      effect_size = NULL,
                      effect_sd = NULL,
                      response = NULL,
                      family = NULL,
                      size = NULL) {

  fit <- lme4::lmer(response ~ fixed_effects + (1 | random_effects),
                    data = data.frame(response = response,
                                      fixed_effects = fixed_effects,
                                      random_effects = random_effects),
                    REML = FALSE,
                    family = family)
  fit@beta <- effect_size
  fit@theta <- effect_sd

  return(fit)
}