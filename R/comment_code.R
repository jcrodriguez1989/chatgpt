#' ChatGPT: Comment Code
#'
#' @param code The code to be commented by ChatGPT.
#'
#' @export
#'
comment_code <- function(code) {
  prompt <- paste0('Add inline comments to the following R code: "', code, '"')
  trimws(sapply(gpt_get_completions(prompt)$choices, function(x) x$text))
}
