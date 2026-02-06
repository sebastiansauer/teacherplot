# Get normal densities, shifted and scaled

Gives densities of a specified normal distribution.

## Usage

``` r
get_norm_density(
  outcome_mean = 0,
  error_sigma = 1,
  dens_spread_factor = 1,
  predictor_value = 0,
  z = 2
)
```

## Arguments

- outcome_mean:

  the mean value of the normal distribution

- error_sigma:

  the spead (sd) of the normal distribution

- dens_spread_factor:

  spread factor of the densities

- predictor_value:

  offset to be added to the densities

- z:

  z-value indicating start and end in z-values of the densities

## Examples

``` r
lm1 <- lm(mpg ~ hp, data = mtcars)
lm1_pred_200 <- predict(lm1, newdata = tibble(hp = 200))
#> Error in tibble(hp = 200): could not find function "tibble"

ggplot(mtcars) +
  aes(x = hp, y = mpg) +
  geom_point() +
  geom_abline(slope = coef(lm1)[2], intercept = coef(lm1)[1], color = "blue") +
  geom_path(
    data = get_norm_density(
      outcome_mean = lm1_pred_200,
      error_sigma = 2,
      z = 3,
      dens_spread_factor = 5e1,
      predictor_value = 200
    ),
    aes(y = outcome, x = norm_dens)
  )
#> Error in ggplot(mtcars): could not find function "ggplot"
```
