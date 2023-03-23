#' Run a ChatGPT RStudio Addin
#'
#' @param addin_name The name of the adding to execute.
#'
#' @importFrom rstudioapi as.document_range getActiveDocumentContext modifyRange
#'
run_addin <- function(addin_name) {
  # Select which addin has to be used.
  addin_function <- switch(addin_name,
    "comment_code" = comment_code,
    "complete_code" = complete_code,
    "custom_prompt" = custom_prompt,
    "create_unit_tests" = create_unit_tests,
    "create_variable_name" = create_variable_name,
    "document_code" = document_code,
    "explain_code" = explain_code,
    "find_issues_in_code" = find_issues_in_code,
    "optimize_code" = optimize_code,
    "refactor_code" = refactor_code,
    stop("`addin_name` not found.")
  )
  # Get the selected code.
  doc_context <- getActiveDocumentContext()
  selected_code <- doc_context$selection[[1]]$text
  is_full_file <- all(nchar(selected_code) == 0)
  # If no code is selected, use the whole file.
  if (is_full_file) {
    selected_code <- doc_context$contents
  }
  selected_code <- paste0(selected_code, collapse = "\n")
  # Apply the addin function.
  out <- addin_function(selected_code)
  if (is.na(out)){
    return()
  }
  if (as.logical(Sys.getenv("OPENAI_ADDIN_REPLACE", FALSE))) {
    doc_range <- doc_context$selection[[1]]$range
    if (is_full_file) {
      doc_range <- as.document_range(c(c(0, 0), c(Inf, Inf)))
    }
    modifyRange(doc_range, out, doc_context$id)
  } else if (as.logical(Sys.getenv("OPENAI_VERBOSE", TRUE))) {
    cat(paste0("\n*** ChatGPT output:\n\n", out, "\n"))
  } else {
    warning("Please set one of `OPENAI_ADDIN_REPLACE=TRUE` or `OPENAI_VERBOSE=TRUE`")
  }
  invisible(NULL)
}

run_addin_comment_code <- function() run_addin("comment_code")
run_addin_complete_code <- function() run_addin("complete_code")
run_addin_custom_prompt <- function() run_addin("custom_prompt")
run_addin_create_unit_tests <- function() run_addin("create_unit_tests")
run_addin_create_variable_name <- function() run_addin("create_variable_name")
run_addin_document_code <- function() run_addin("document_code")
run_addin_explain_code <- function() run_addin("explain_code")
run_addin_find_issues_in_code <- function() run_addin("find_issues_in_code")
run_addin_optimize_code <- function() run_addin("optimize_code")
run_addin_refactor_code <- function() run_addin("refactor_code")

#' Ask ChatGPT
#'
#' Opens an interactive chat session with ChatGPT
#'
#' @importFrom miniUI gadgetTitleBar miniPage
#' @importFrom shiny actionButton br icon observeEvent runGadget stopApp textAreaInput
#' @importFrom shiny updateTextAreaInput wellPanel
#' @importFrom utils getFromNamespace
#'
run_addin_ask_chatgpt <- function() {
  ui <- miniPage(wellPanel(
    gadgetTitleBar("Ask ChatGPT", NULL),
    textAreaInput("question", "Question:", width = "100%", height = "150px"),
    actionButton("ask_button", "Ask", icon("paper-plane")),
    br(), br(),
    textAreaInput("answer", "Answer:", width = "100%", height = "150px")
  ))
  server <- function(input, output, session) {
    observeEvent(input$ask_button, {
      chatgpt_reply <- ask_chatgpt(input$question)
      if (as.logical(Sys.getenv("OPENAI_VERBOSE", TRUE))) {
        cat(paste0("\n*** ChatGPT output:\n\n", chatgpt_reply, "\n"))
      }
      updateTextAreaInput(session, "answer", value = chatgpt_reply)
    })
    observeEvent(input$done, stopApp())
  }
  runGadget(ui, server)
}
