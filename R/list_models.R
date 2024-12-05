#' ChatGPT: List Models
#'
#' @param openai_api_key OpenAI's API key.
#'
#' @examples
#' \dontrun{
#' list_models()
#' }
#'
#' @importFrom httr add_headers content GET stop_for_status
#' @importFrom jsonlite fromJSON
#'
#' @return A data.frame with the available models to be used by OpenAI's API.
#'
#' @export
#'
list_models <- function(openai_api_key = Sys.getenv("OPENAI_API_KEY")) {
  get_res <- GET(
    paste0(api_url, "/models"),
    add_headers("Authorization" = paste("Bearer", openai_api_key))
  )
  stop_for_status(get_res)
  fromJSON(content(get_res, as = "text", encoding = "UTF-8"))$data
}
