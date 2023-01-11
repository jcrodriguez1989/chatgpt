#' ChatGPT: Explain Code
#'
#' @param code The code to be explained by ChatGPT.
#'
#' @examples
#' \dontrun{
#' cat(explain_code("for (i in 1:10) {\n  print(i ** 2)\n}"))
#' }
#'
#' @export
#'
explain_code <- function(code) {
  prompt <- paste0('Explain the following R code: "', code, '"')
  trimws(sapply(gpt_get_completions(prompt)$choices, function(x) x$text))
}
