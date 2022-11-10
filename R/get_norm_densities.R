#' Get normal densities, shifted and scaled
#'
#' Gives densities of a specified normal distribution.
#'
#' @param outcome_mean the mean value of the normal distribution
#' @param error_sigma the spead (sd) of the normal distribution
#' @param dens_spread_factor spread factor of the densities
#' @param predictor_value offset to be added to the densities
#' @param z z-value indicating start and end in z-values of the densities
#'
#'
#' @export
#' @examples
#' lm1 <- lm(mpg ~ hp, data = mtcars)
#' lm1_pred_200 <- predict(lm1, newdata = tibble(hp = 200))
#'
#' ggplot(mtcars) +
#'   aes(x = hp, y = mpg) +
#'   geom_point() +
#'   geom_abline(slope = coef(lm1)[2], intercept = coef(lm1)[1], color = "blue") +
#'   geom_path(
#'     data = get_norm_density(
#'       outcome_mean = lm1_pred_200,
#'       error_sigma = 2,
#'       z = 3,
#'       dens_spread_factor = 5e1,
#'       predictor_value = 200
#'     ),
#'     aes(y = outcome, x = norm_dens)
#'   )

get_norm_density <- function(outcome_mean = 0, error_sigma = 1, dens_spread_factor = 1, predictor_value = 0, z = 2) {
  d <-
    tibble::tibble(
      outcome_z = seq(-z, z, length.out = 1e2),
      outcome = outcome_z * error_sigma + outcome_mean,
      norm_dens_raw = dnorm(outcome, outcome_mean, sd = error_sigma),
      norm_dens = predictor_value + norm_dens_raw * dens_spread_factor
    )

  return(d)
}
