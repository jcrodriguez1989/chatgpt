#' 'OpenAI's 'ChatGPT' <https://chat.openai.com/> coding assistant for 'RStudio'. A set
#' of functions and 'RStudio' addins that aim to help the R developer in tedious coding tasks.
#'
"_PACKAGE"

.state <- new.env(parent = emptyenv())

# Empty chat session messages at startup.
assign(
  "chat_session_messages",
  list(list(role = "system", content = "You are a helpful assistant.")),
  envir = .state
)
