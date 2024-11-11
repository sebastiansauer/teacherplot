
#' Binomial plot
#'
#' Plots a binomial distribution, using ggplot
#'
#' The probability of getting o to n successes in n trials is calculated
#'
#' @param n number of trials
#' @param p success probability
#'
#' @return ggplot objects
#' @export
#'
#' @examples
#' binomial_plot(10, .5)
binomial_plot <- function(n, p){
  dbinom(0:n, n, p) %>%
    tibble(Wahrscheinlichkeit = .,
           Treffer = seq(0,n)) %>%
    ggplot(aes(x = Treffer, y = Wahrscheinlichkeit)) +
    geom_col() +
    #   geom_segment(aes(xend = Treffer, yend = 0)) +
    #  geom_point(color = "red", size = 5, alpha = .5) +
    scale_x_continuous(breaks = 0:n) +
    theme_minimal() +
    geom_label(aes(label = round(Wahrscheinlichkeit, 2)))
}
