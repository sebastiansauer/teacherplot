#' Plot a dag.
#'
#' Plots a DAG using a more fancy formatting.
#' Uses ggdag.
#'
#' @param d dag
#' @param x x
#' @param y y
#' @param circle name of unknown variable
#'
#' @return ggplot object
#' @export
#'
#' @examples
#' gg_fancy_dag(my_dag)
gg_fancy_dag <- function(d, x = 1, y = 1, circle = "U") {

  d %>%
    ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
    geom_dag_point(aes(color = name == circle),
                   alpha = 1/2, size = 6.5, show.legend = F) +
    geom_point(x = x, y = y,
               size = 6.5, shape = 1, stroke = 1, color = "orange") +
    geom_dag_text(color = "black") +
    geom_dag_edges() +
    scale_color_manual(values = c("steelblue", "orange")) +
    theme_dag()
}
