#' Reset Chat Session
#'
#' This function is intended to be used with `ask_chatgpt`. If we are using `ask_chatgpt` to chat with ChatGPT, and
#' we want to start a new conversation, we must call `reset_chat_session`.
#'
#' @param system_role ChatGPT's role as an AI assistant.
#'
#' @export
#'
reset_chat_session <- function(system_role = "You are a helpful assistant.") {
  assign(
    "chat_session_messages", list(list(role = "system", content = system_role)),
    envir = .state
  )
}
