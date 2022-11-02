#' Obtain a model from supplied parameters.
#'
#' @param fixed_effects List of names of fixed effects.
#' @param random_effects List of names of random effects.
#' @param effect_size Effective sample size.
#' @param effect_sd Effective sample standard deviation.
#'
#' @return model with supplied parameters
#' @export
get_model <- function(fixed_effects = NULL,
                      random_effects = NULL,
                      effect_size = NULL,
                      effect_sd = NULL) {
    
    fit <- # create model object 
    fit@beta <- effect_size
    fit@theta <- effect_sd
    
    return(fit)
}