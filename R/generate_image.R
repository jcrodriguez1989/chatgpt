#' Generate an Image With DALL-E 3
#'
#' @param prompt The prompt for image generation.
#' @param out_file The path where to save the generated image.
#' @param openai_api_key OpenAI's API key.
#'
#' @importFrom httr add_headers content content_type_json POST stop_for_status
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom utils download.file
#'
#' @export
#'
generate_image <- function(prompt, out_file = tempfile(fileext = ".png"),
                           openai_api_key = Sys.getenv("OPENAI_API_KEY")) {
  post_res <- POST(
    paste0(api_url, "/images/generations"),
    add_headers("Authorization" = paste("Bearer", openai_api_key)),
    content_type_json(),
    body = toJSON(
      list(model = "dall-e-3", prompt = prompt, n = 1, size = "1024x1024"),
      auto_unbox = TRUE
    )
  )
  stop_for_status(post_res)
  download.file(fromJSON(content(post_res, as = "text", encoding = "UTF-8"))$data$url, out_file)
  return(out_file)
}
