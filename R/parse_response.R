#' Parse OpenAI API Response
#'
#' Takes the raw response from the OpenAI API and extracts the text content from it.
#'
#' @param raw_responses The raw response object returned by the OpenAI API.
#' @param verbosity The verbosity level for this function.
#'
#' @return Returns a character vector containing the text content of the response.
#'
parse_response <- function(raw_responses, verbosity = get_verbosity()) {
  # Parse the message content of the list of raw_responses. Trim those messages, and paste them.
  parsed_response <- paste(trimws(sapply(raw_responses, function(response) {
    sapply(response$choices, function(x) x$message$content)
  })), collapse = "")
  if (verbosity > 2) {
    # If we are in 3-verbose mode, add the raw_responses as an attribute to the return object.
    attr(parsed_response, "raw_responses") <- raw_responses
  }
  parsed_response
}
