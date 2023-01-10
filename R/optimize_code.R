#' ChatGPT: Optimize Code
#'
#' @param code The code to be optimized by ChatGPT.
#'
#' @export
#'
optimize_code <- function(code) {
  prompt <- paste0('Optimize the following R code: "', code, '"')
  trimws(sapply(gpt_get_completions(prompt)$choices, function(x) x$text))
}
