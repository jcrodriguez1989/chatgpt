#' ChatGPT: Create Variable Name
#'
#' @param code The code for which to give a variable name to its result.
#'
#' @export
#'
create_variable_name <- function(code) {
  prompt <- paste0('Give a good variable name to the result of the following R code: "', code, '"')
  trimws(sapply(gpt_get_completions(prompt)$choices, function(x) x$text))
}
