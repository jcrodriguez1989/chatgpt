#' Parse OpenAI API Response
#'
#' Takes the raw response from the OpenAI API and extracts the text content from it.
#'
#' @param raw_responses The raw response object returned by the OpenAI API.
#' @param verbosity The verbosity level for this function.
#'
#' @importFrom jsonlite toJSON
#'
#' @return Returns a character vector containing the text content of the response.
#'
parse_response <- function(raw_responses, verbosity = get_verbosity()) {
  # If we provide a numeric value to `OPENAI_VERBOSE`, and it is `> 1` print return verbosity.
  if (verbosity > 1) {
    lapply(raw_responses, function(response) message(toJSON(response, pretty = TRUE)))
  }
  # Parse the message content of the list of raw_responses. Trim those messages, and paste them.
  paste(trimws(sapply(raw_responses, function(response) {
    sapply(response$choices, function(x) x$message$content)
  })), collapse = "")
}
