use_r("foofy.R")

# generate data:
fixed_effects <- c("x")
effect_size <- c(2, -0.1)
discrete_indicators <- c(TRUE)
discrete_effects_levels <- list(seq_len(10))
random_effect <- "g"
random_effect_levels <- letters[1:3]
random_effects_cov <- 0.5
residual_sd <- 1
response <- "y"
family <- NULL

fit <- get_model(fixed_effects = fixed_effects,
                 effect_size = effect_size,
                 discrete_indicators = discrete_indicators,
                 discrete_effects_levels = discrete_effects_levels,
                 random_effect = random_effect,
                 random_effect_levels = random_effect_levels,
                 random_effects_cov = random_effects_cov,
                 residual_sd = residual_sd,
                 response = response,
                 family = family)








var1 <- c(.1, .2)
var2 <- as.factor(c((0:4)))
var3 <- as.factor(c("a", "b", "c", "d"))
subj_id <- as.factor((1:10))
response <- seq(2, 3, by = .5)
data <- expand.grid(var1 = var1, var2 = var2, var3 = var3, subj_id = subj_id, response = response)

typeof(data$response) 
var1 <- rnorm(100)
var2 <- binom(100, size = 10, prob = .4)
var3 <- c("a", "b", "c", "d")
subj_id <- as.factor(rep(1:10))
data <- data.frame(list(response = response, var1))

test_that("get_power works", {
  
  expect_equal(1, 1)
})
