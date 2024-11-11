#' Plot simple dag
#'
#' Plots a DAG with simple formating.
#' Uses ggdag.
#'
#' @param d
#'
#' @return ggplot object
#' @export
#'
#' @examples
#' gg_simple_dag(my_dag)
gg_simple_dag <- function(d) {

  d |>
    ggplot2::ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
    ggplot2::geom_dag_point(color = "steelblue", alpha = 1/2, size = 6.5) +
    ggdag::geom_dag_text(color = "black") +
    ggdag::geom_dag_edges() +
    ggdag::theme_dag()
  }
