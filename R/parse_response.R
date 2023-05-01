#' Parse OpenAI API Response
#'
#' Takes the raw response from the OpenAI API and extracts the text content from it.
#'
#' @param raw_responses The raw response object returned by the OpenAI API.
#'
#' @return Returns a character vector containing the text content of the response.
#'
parse_response <- function(raw_responses) {
  # Parse the message content of the list of raw_responses. Trim those message, and paste them.
  paste(trimws(sapply(raw_responses, function(response) {
    sapply(response$choices, function(x) x$message$content)
  })), collapse = "")
}
