#' Parse OpenAI API Response
#'
#' Takes the raw response from the OpenAI API and extracts the text content from it.
#'
#' @param raw_response The raw response object returned by the OpenAI API.
#'
#' @return Returns a character vector containing the text content of the response.
#'
parse_response <- function(raw_response) {
  trimws(sapply(raw_response$choices, function(x) x$message$content))
}
