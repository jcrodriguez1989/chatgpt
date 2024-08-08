#' Build Prompt Content
#'
#' @param question The question to ask ChatGPT.
#' @param images A list of images to attach to the question. It could be a list of URLs or paths.
#'
#' @importFrom xfun base64_encode
#'
build_prompt_content <- function(question, images) {
  if (length(images) == 0) {
    return(question)
  }
  prompt_content <- list(list(type = "text", text = question))
  append(prompt_content, lapply(images, function(image) {
    # If it's a local file, then transform it to base 64 encoding. If not, return the "URL".
    image_url <- image
    if (file.exists(image)) {
      image_url <- paste0("data:image/jpeg;base64,", base64_encode(image))
    }
    list(type = "image_url", image_url = list(url = image_url))
  }))
}
