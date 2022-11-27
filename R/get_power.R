#' Obtain the power analysis on a model.
#'
#' @param fit A fitted model object.
#' @param nsim number of simulations to perform
#' @param seed random number generator seed, for reproducible results
#'
#' @return Power analysis results.
#' @export
get_power <- function(fit = NULL,
                      nsim = 1000,
                      seed = NULL) {
  simr::powerSim(fit = fit, nsim = nsim, seed = seed)
}
