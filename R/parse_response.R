#' Parse OpenAI API Response
#'
#' Takes the raw response from the OpenAI API and extracts the text content from it.
#' This function is currently designed to differentiate between gpt-3.5-turbo and
#' others.
#'
#' @param raw_response The raw response object returned by the OpenAI API.
#' @return Returns a character vector containing the text content of the response.
#'
parse_response <- function(raw_response){
  if(Sys.getenv("OPENAI_MODEL", "text-davinci-003") == "gpt-3.5-turbo"){
    out <- trimws(sapply(raw_response$choices, function(x) x$message$content))
  } else {
    out <- trimws(sapply(raw_response$choices, function(x) x$text))
  }
  return(out)
}
