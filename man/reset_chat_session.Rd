% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reset_chat_session.R
\name{reset_chat_session}
\alias{reset_chat_session}
\title{Reset Chat Session}
\usage{
reset_chat_session(
  system_role = "You are a helpful assistant.",
  session_id = "1"
)
}
\arguments{
\item{system_role}{ChatGPT's role as an AI assistant.}

\item{session_id}{The ID of the session to be used. If `NULL`, this function will have no effect.}
}
\description{
This function is intended to be used with `ask_chatgpt`. If we are using `ask_chatgpt` to chat with ChatGPT, and
we want to start a new conversation, we must call `reset_chat_session`.
}
