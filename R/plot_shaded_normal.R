


#' Plot shaded normal
#'
#' plots a standard normal distribution, where a lower/upper part
#' (2.5%, 97.5% per default) is filled with some other color
#'
#' @param xmin  min value of the the plotted normal (dbl)
#' @param xmax max value of the the plotted normal (dbl)
#' @param threshold_min lower threshold (default -1.96)
#' @param threshold_max upper threshold (default 1.96)
#' @param color1 fill color of central part of the distribution (#E69F00)
#' @param color2 fill color of extremal part of the distribution (#56B4E9)
#' @param alpha_value alpha of the fill (default .9)
#'
#' @return ggplot object
#' @export
#'
#' @examples
#' shaded_normal_plot() + labs(x = "", y = "")
#' shaded_normal_plot(breaks = -3:3) + labs(x = "", y = "")
#' shaded_normal_plot(breaks = -3:3) +
#'   theme(panel.grid.major.x = element_blank(),
#'   panel.grid.minor.x = element_blank())


shaded_normal_plot <- function(xmin = -3,
                          xmax = 3,
                          threshold_min = -1.96,
                          threshold_max = 1.96,
                          color1 = "#E69F00",
                          color2 = "#56B4E9",
                          alpha_value = .9,
                          breaks = c(threshold_min, threshold_max)) {



  ggplot(NULL, aes(c(xmin,xmax))) +
    geom_area(stat = "function", fun = dnorm,
              fill = color1, xlim = c(xmin, xmax),
              alpha = alpha_value) +
    geom_area(stat = "function", fun = dnorm,
              fill = color2, xlim = c(xmin, threshold_min),
              alpha = alpha_value) +
    geom_area(stat = "function", fun = dnorm,
              fill = color2, xlim = c(threshold_max, xmax),
              alpha = alpha_value) +
    scale_y_continuous(breaks = NULL) +
    scale_x_continuous(breaks = breaks)
}





