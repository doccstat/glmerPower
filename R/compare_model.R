#' Test for significant difference in power between a model and a simpler submodel.
#'
#' @param fit lme4 object
#' @param fixed_effects List of names of fixed effects.
#' @param random_effects List of names of random effects.
#' @param effect_size Effective sample size.
#' @param effect_sd Effective sample standard deviation.
#' @param response Response variable
#' @param family Family of model for generalized linear mixed model
#' @param nsim number of simulations to perform
#' @param seed random number generator seed, for reproducible results
#'
#' @return Power analysis results.
#' @export
compare_model <- function(fixed_effects = NULL,
                      random_effects = NULL,
                      effect_size = NULL,
                      effect_var = NULL,
                      response = NULL,
                      family = NULL,
                      nsim = 1000,
                      seed = NULL) {
    
    fit <- get_model(fixed_effects = NULL,
                     random_effects = NULL,
                     effect_size = NULL,
                     effect_var = NULL,
                     response = NULL,
                     family = NULL)
    
    sim <- simr::powerSim(model, test = fcompare(submodel_formula), nsim = nsim, seed = seed)
    
    return(sim)
}