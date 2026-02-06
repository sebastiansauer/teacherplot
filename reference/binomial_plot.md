# Binomial plot

Plots a binomial distribution using ggplot2

## Usage

``` r
binomial_plot(n, p)
```

## Arguments

- n:

  Number of trials

- p:

  success probability

## Value

ggplot2 object

## Examples

``` r
binomial_plot(10, .5)
#> Error in dbinom(0:n, n, p) %>% tibble(Wahrscheinlichkeit = ., Treffer = seq(0,     n)) %>% ggplot(aes(x = Treffer, y = Wahrscheinlichkeit)): could not find function "%>%"
```
