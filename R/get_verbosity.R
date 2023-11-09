#' Get Verbosity Level
#'
get_verbosity <- function() {
  # `OPENAI_VERBOSE` should be one of `numeric` or `FALSE`/`TRUE`. But we'll return it as numeric.
  suppressWarnings(max(
    as.logical(Sys.getenv("OPENAI_VERBOSE", TRUE)),
    as.numeric(Sys.getenv("OPENAI_VERBOSE", TRUE)),
    na.rm = TRUE
  ))
}
