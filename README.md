# Usage

```r
fixed_effects <- c("x", "var2")
effect_size <- c(2, -0.1, 2)
discrete_indicators <- c(TRUE, FALSE)
discrete_effects_levels <- list(seq_len(10), NULL)
random_effect <- "g"
random_effect_levels <- letters[1:3]
random_effect_cov <- 0.5
residual_sd <- 1
response <- "y"
family <- "poisson"

get_model(fixed_effects = fixed_effects,
          effect_size = effect_size,
          discrete_indicators = discrete_indicators,
          discrete_effects_levels = discrete_effects_levels,
          random_effect = random_effect,
          random_effect_levels = random_effect_levels,
          random_effect_cov = random_effect_cov,
          residual_sd = residual_sd,
          response = response,
          family = family)

get_power(fixed_effects = fixed_effects,
          effect_size = effect_size,
          discrete_indicators = discrete_indicators,
          discrete_effects_levels = discrete_effects_levels,
          random_effect = random_effect,
          random_effect_levels = random_effect_levels,
          random_effect_cov = random_effect_cov,
          residual_sd = residual_sd,
          response = response,
          family = family,
          nsim = 5,
          seed = NULL)

compare_model(fixed_effects = fixed_effects,
              effect_size = effect_size,
              discrete_indicators = discrete_indicators,
              discrete_effects_levels = discrete_effects_levels,
              random_effect = random_effect,
              random_effect_levels = random_effect_levels,
              random_effect_cov = random_effect_cov,
              residual_sd = residual_sd,
              response = response,
              family = family,
              comparison_formula = "y ~ x",
              nsim = 5,
              seed = NULL)
```