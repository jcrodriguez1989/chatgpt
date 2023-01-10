#' ChatGPT: Refactor Code
#'
#' @param code The code to be refactored by ChatGPT.
#'
#' @export
#'
refactor_code <- function(code) {
  prompt <- paste0('Refactor the following R code, returning valid R code: "', code, '"')
  trimws(sapply(gpt_get_completions(prompt)$choices, function(x) x$text))
}
