#' Get Chat Session
#'
#' @param session_id The ID of the session to be used. If `NULL`, it will return an empty session.
#'
get_chat_session <- function(session_id = "1") {
  default_session <- list(list(role = "system", content = "You are a helpful assistant."))
  if (Sys.getenv("OPENAI_MODEL") %in% systemless_models) {
    default_session <- list()
  }
  if (is.null(session_id)) {
    return(default_session)
  }
  session <- get("chat_session_messages", envir = .state)[[as.character(session_id)]]
  # If the session was not found, then it's a new (default) session.
  if (is.null(session)) {
    session <- default_session
  }
  session
}
