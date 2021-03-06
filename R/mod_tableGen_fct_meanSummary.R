#' the \code{mean_summary} function is used by
#' both the basic summary statistics block
#' and the change from baseline block
#' @param .data is the data to pass to the summary statics
#' @param to_count is either AVAL or CHG
#' 
#' @import dplyr
#' 
#' @family tableGen Functions
#' 
mean_summary <- function(.data, to_count) {
  
  to_count <- sym(to_count)
  
  .data %>%
    summarise(
      Missing = sum(is.na(!!to_count)),
      Mean = round(mean(na.omit(!!to_count)), 2),
      SD = round(sd(na.omit(!!to_count)), 2),
      Median = median(na.omit(!!to_count), type = 1),
      `Q1 | Q3` = paste(round(quantile(na.omit(!!to_count), 0.25, type = 1),2) , "|", 
                        (round(quantile(na.omit(!!to_count), 0.75, type = 1),2))),
      `Min | Max` = paste0(round(min(na.omit(!!to_count)), 2), " | ", 
                           round(max(na.omit(!!to_count)), 2))
    )
}