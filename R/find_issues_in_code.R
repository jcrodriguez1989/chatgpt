#' ChatGPT: Find Issues in Code
#'
#' @param code The code to be analyzed by ChatGPT.
#'
#' @export
#'
find_issues_in_code <- function(code) {
  prompt <- paste0('Find issues or bugs in the following R code: "', code, '"')
  trimws(sapply(gpt_get_completions(prompt)$choices, function(x) x$text))
}
