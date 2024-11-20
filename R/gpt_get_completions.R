#' Get GPT Completions Endpoint
#'
#' @param prompt The prompt to generate completions for.
#' @param openai_api_key OpenAI's API key.
#' @param messages Available variable, to send the needed messages list to ChatGPT.
#'
#' @importFrom httr add_headers content content_type_json POST use_proxy
#' @importFrom jsonlite toJSON
#'
gpt_get_completions <- function(prompt, openai_api_key = Sys.getenv("OPENAI_API_KEY"),
                                messages = NULL) {
  if (nchar(openai_api_key) == 0) {
    stop("`OPENAI_API_KEY` not provided.")
  }
  # See https://platform.openai.com/docs/api-reference/chat .
  params <- list(
    model = Sys.getenv("OPENAI_MODEL", "gpt-4o-mini"),
    max_tokens = as.numeric(Sys.getenv("OPENAI_MAX_TOKENS", 256)),
    temperature = as.numeric(Sys.getenv("OPENAI_TEMPERATURE", 1)),
    top_p = as.numeric(Sys.getenv("OPENAI_TOP_P", 1)),
    frequency_penalty = as.numeric(Sys.getenv("OPENAI_FREQUENCY_PENALTY", 0)),
    presence_penalty = as.numeric(Sys.getenv("OPENAI_PRESENCE_PENALTY", 0)),
    logprobs = as.logical(Sys.getenv("OPENAI_LOGPROBS", FALSE))
  )
  # These GPT models use different parameters.
  if (Sys.getenv("OPENAI_MODEL") %in% systemless_models) {
    params$max_completion_tokens <- params$max_tokens
    params$max_tokens <- NULL
  }
  if (get_verbosity()) {
    message(paste0("\n*** ChatGPT input:\n\n", prompt, "\n"))
  }
  return_language <- Sys.getenv("OPENAI_RETURN_LANGUAGE")
  if (nchar(return_language) > 0) {
    return_language <- paste0("You return all your replies in ", return_language, ".")
  }
  if (is.null(messages) && Sys.getenv("OPENAI_MODEL") %in% systemless_models) {
    messages <- list(
      list(
        role = "system",
        content = paste(
          "You are a helpful assistant with extensive knowledge of R programming.",
          return_language
        )
      ),
      list(role = "user", content = prompt)
    )
  } else {
    # If there are messages provided, then add the `return_language` if available.
    system_msg_index <- which(sapply(messages, function(message) message$role == "system"))
    if (length(system_msg_index) == 1) {
      # If this GPT model has `system` parameter, assign the language to it.
      messages[[system_msg_index]]$content <- paste(
        messages[[system_msg_index]]$content, return_language
      )
    }
  }
  # Get the proxy to use, if provided.
  proxy <- NULL
  if (nchar(Sys.getenv("OPENAI_PROXY")) > 0) {
    proxy <- Sys.getenv("OPENAI_PROXY")
    if (grepl("^(?:\\d{1,3}\\.){3}\\d{1,3}:\\d{2,5}$", proxy)) {
      proxy <- use_proxy(gsub(":.*", "", proxy), as.numeric(gsub(".*:", "", proxy)))
    } else {
      stop("Invalid proxy provided in `OPENAI_PROXY`: ", proxy)
    }
  }
  # Run the API query.
  final_res <- list()
  keep_querying <- TRUE
  while (keep_querying) {
    post_res <- POST(
      paste0(api_url, "/chat/completions"),
      add_headers("Authorization" = paste("Bearer", openai_api_key)),
      content_type_json(),
      body = toJSON(c(params, list(messages = messages)), auto_unbox = TRUE),
      proxy
    )
    if (!post_res$status_code %in% 200:299) {
      stop(content(post_res))
    }
    if (get_verbosity() > 1) {
      # If verbose is over 1, show the ongoing GPT response.
      message(content(post_res, as = "text", encoding = "UTF-8"))
    }
    post_res <- content(post_res)
    final_res <- append(final_res, list(post_res))
    # In the case the finish_reason is the length of the message, then we need to keep querying.
    keep_querying <- all(sapply(post_res$choices, function(x) x$finish_reason == "length"))
    # And update the messages sent to ChatGPT, in order to continue the current session.
    messages <- append(
      append(
        messages,
        list(list(role = "assistant", content = parse_response(list(post_res), verbosity = 0)))
      ),
      list(list(role = "user", content = "continue"))
    )
  }
  final_res
}
