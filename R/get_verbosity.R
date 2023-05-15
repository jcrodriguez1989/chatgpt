#' Get Verbosity Level
#'
get_verbosity <- function() {
  suppressWarnings(max(
    as.logical(Sys.getenv("OPENAI_VERBOSE", TRUE)),
    as.numeric(Sys.getenv("OPENAI_VERBOSE", TRUE)),
    na.rm = TRUE
  ))
}
