
# Teacherplot

<!-- README.md is generated from README.Rmd. Please edit that file -->

The goal of teacherplot is to provide simple plots describing basic
statistical concepts.

## Installation

You can install the development version of teacherplot like so:

``` r
library(devtools)
devtools::install_github("sebastiansauer/teacherplot")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(teacherplot)
shaded_normal(breaks = -3:3) + labs(x = "", y = "")
```

<!-- You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this. You could also use GitHub Actions to re-render `README.Rmd` every time you push. An example workflow can be found here: <https://github.com/r-lib/actions/tree/v1/examples>. -->
<!-- You can also embed plots, for example: -->
<!-- ```{r pressure, echo = FALSE} -->
<!-- plot(pressure) -->
<!-- ``` -->
<!-- In that case, don't forget to commit and push the resulting figure files, so they display on GitHub and CRAN. -->
