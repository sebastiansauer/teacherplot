

#' Exponential distribution plot
#'
#' @param r rate parameter
#' @param max_x max value x axis
#' @param probs quantiles to indicate in the plot
#' @return ggplot2 object
#' @export
#'
#' @examples
#' exp_plot(0.1)
exp_plot <-
  function(r = 1, max_x = 25, probs = c(0.05, .25, .50, .75, .95)) {

  d <-
    tibble::tibble(
      x = seq(0, 5,.1),
      y = dexp(x, rate = r)
    )

  d_qs <-
    tibble::tibble(
      prob = probs,
      q = qexp(prob, rate = r)
    )

  med_exp <- round(log(2) / r, 2)


  p <-
    ggplot2::ggplot(NULL, ggplot2::aes(c(0, max_x))) +
    ggplot2::geom_area(stat = "function",
              fun = dexp,
              fill = "grey",
              args = list(rate = r))  +
    ggplot2::labs(title = paste0("Exp(", r, ")"),
         x = "sigma",
         caption = paste0("Median (.5-quantile): ", med_exp)) +
    ggplot2::geom_vline(data = d_qs,
               ggplot2::aes(xintercept = q)) +
    ggplot2::geom_label(data = d_qs,
               ggplot2::aes(x = q,
                   label = prob,
                   y = prob))

  return(p)

}


