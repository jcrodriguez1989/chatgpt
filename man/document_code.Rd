% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/document_code.R
\name{document_code}
\alias{document_code}
\title{ChatGPT: Document Code (in roxygen2 format)}
\usage{
document_code(code = clipr::read_clip(allow_non_interactive = TRUE))
}
\arguments{
\item{code}{The code to be documented by ChatGPT. If not provided, it will use what's copied on
the clipboard.}
}
\value{
A character value with the response generated by ChatGPT.
}
\description{
ChatGPT: Document Code (in roxygen2 format)
}
\examples{
\dontrun{
cat(document_code("square_numbers <- function(numbers) numbers ** 2"))
}

}
