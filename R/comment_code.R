#' ChatGPT: Comment Code
#'
#' @param code The code to be commented by ChatGPT.
#'
#' @examples
#' \dontrun{
#' cat(comment_code("for (i in 1:10) {\n  print(i ** 2)\n}"))
#' }
#'
#' @export
#'
comment_code <- function(code) {
  prompt <- paste0('Add inline comments to the following R code: "', code, '"')
  trimws(sapply(gpt_get_completions(prompt)$choices, function(x) x$text))
}
