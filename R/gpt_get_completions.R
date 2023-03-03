#' Get GPT Completions Endpoint
#'
#' @param prompt The prompt to generate completions for.
#' @param openai_api_key OpenAI's API key.
#'
#' @importFrom httr add_headers content content_type_json POST
#' @importFrom jsonlite toJSON
#'
gpt_get_completions <- function(prompt, openai_api_key = Sys.getenv("OPENAI_API_KEY")) {
  if (nchar(openai_api_key) == 0) {
    stop("`OPENAI_API_KEY` not provided.")
  }
  # See https://platform.openai.com/docs/api-reference/chat
  # and https://beta.openai.com/docs/api-reference/completions/create
  model <- Sys.getenv("OPENAI_MODEL", "gpt-3.5-turbo")
  params <- list(
    model = model,
    max_tokens = as.numeric(Sys.getenv("OPENAI_MAX_TOKENS", 256)),
    temperature = as.numeric(Sys.getenv("OPENAI_TEMPERATURE", 1)),
    top_p = as.numeric(Sys.getenv("OPENAI_TOP_P", 1)),
    frequency_penalty = as.numeric(Sys.getenv("OPENAI_FREQUENCY_PENALTY", 0)),
    presence_penalty = as.numeric(Sys.getenv("OPENAI_PRESENCE_PENALTY", 0))
  )
  if (as.logical(Sys.getenv("OPENAI_VERBOSE", TRUE))) {
    cat(paste0("\n*** ChatGPT input:\n\n", prompt, "\n"))
  }
  if (grepl("gpt-3.5-turbo", model)) {
    messages <- list(
      list(
        role = "system",
        content = "You are a helpful assistant with extensive knowledge of R programming."
      ),
      list(role = "user", content = prompt)
    )
    content(POST(
      "https://api.openai.com/v1/chat/completions",
      add_headers("Authorization" = paste("Bearer", openai_api_key)),
      content_type_json(),
      body = toJSON(c(params, list(messages = messages)), auto_unbox = TRUE)
    ))
  } else {
    content(POST(
      "https://api.openai.com/v1/completions",
      add_headers("Authorization" = paste("Bearer", openai_api_key)),
      content_type_json(),
      body = toJSON(c(params, list(prompt = prompt)), auto_unbox = TRUE)
    ))
  }
}
