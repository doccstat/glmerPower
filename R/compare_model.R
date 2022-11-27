#' Test for significant difference in power between a model and a simpler
#' submodel.
#'
#' @param fit lme4 object
#' @param nsim number of simulations to perform
#' @param seed random number generator seed, for reproducible results
#'
#' @return Power analysis results.
#' @export
compare_model <- function(fit = NULL,
                          nsim = 1000,
                          seed = NULL) {

  simr::powerSim(fit = fit,
                 test = simr::fcompare(submodel_formula),
                 nsim = nsim,
                 seed = seed)
}
