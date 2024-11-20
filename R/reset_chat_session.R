#' Reset Chat Session
#'
#' This function is intended to be used with `ask_chatgpt`. If we are using `ask_chatgpt` to chat with ChatGPT, and
#' we want to start a new conversation, we must call `reset_chat_session`.
#'
#' @param system_role ChatGPT's role as an AI assistant.
#' @param session_id The ID of the session to be used. If `NULL`, this function will have no effect.
#'
#' @export
#'
reset_chat_session <- function(system_role = "You are a helpful assistant.", session_id = "1") {
  if (is.null(session_id)) {
    return()
  }
  if (is.list(system_role)) {
    # If `system_role` is a list, then it is a ChatGPT session object.
    session <- system_role
  } else if (!Sys.getenv("OPENAI_MODEL") %in% systemless_models) {
    # Otherwise, it's a string specifying ChatGPT's role.
    session <- list(list(role = "system", content = system_role))
  } else {
    warning("Couldn't assign default session to this GPT model.")
    session <- list()
  }
  all_sessions <- get("chat_session_messages", envir = .state)
  all_sessions[[as.character(session_id)]] <- session
  assign("chat_session_messages", all_sessions, envir = .state)
}
