#' ChatGPT: Complete Code
#'
#' @param code The code to be completed by ChatGPT.
#'
#' @return The completed R code.
#'
#' @export
#'
complete_code <- function(code) {
  prompt <- paste0('Complete the following R code: "', code, '"')
  parse_response(gpt_get_completions(prompt))
}
