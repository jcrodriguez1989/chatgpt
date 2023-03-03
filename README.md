
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ChatGPT coding assistant for RStudio

<center>
<img width="300" height="400" src="man/figures/chatgpt_meme.jpeg">
<p>
Meme by Programming Jokes I IT Humor & Memes
</p>
</center>

## Installation

You can install the development version of {chatgpt} from
[GitHub](https://github.com/jcrodriguez1989/chatgpt) with:

``` r
# install.packages("remotes")
remotes::install_github("jcrodriguez1989/chatgpt")
```

## Requirements

You need to setup your ChatGPT API key in R.

First you will need to obtain your ChatGPT API key. You can create an
API key by accessing [OpenAI API
page](https://beta.openai.com/account/api-keys) -don’t miss their
article about [Best Practices for API Key
Safety](https://help.openai.com/en/articles/5112595-best-practices-for-api-key-safety)-.

Then you have to assign your API key for usage in R, this can be done
just for the actual session, by doing:

``` r
Sys.setenv(OPENAI_API_KEY = "XX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
```

Or you can do it persistent (session-wide), by assigning it in your
`.Renviron` file. For it, execute `usethis::edit_r_environ()`, and in
that file write a line at the end your API key as

``` r
OPENAI_API_KEY=XX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

## Features

The {chatgpt} R package provides a set of features to assist in R
coding. Current existing addins:

- **Ask ChatGPT:** Opens an interactive chat session with ChatGPT
- **Comment selected code:** Comment the selected code
- **Create unit tests:** Create testthat unit tests for the selected
  code
- **Create variable name:** Create a name for a variable that would be
  assigned the result of this code
- **Document code (in roxygen2 format):** Document a function
  definition, in roxygen2 format
- **Explain selected code:** Explain the selected code
- **Find issues in the selected code:** Find issues in the selected code
- **Optimize selected code:** Optimize the selected code
- **Refactor selected code:** Refactor the selected code

**Note:** When no code is selected, it will use the whole file’s code.

## Code Examples

#### `ask_chatgpt`

``` r
> cat(ask_chatgpt("What do you think about R language?"))

*** ChatGPT input:

What do you think about R language?
R language is a powerful, open-source programming language for statistical computing and graphical visualization. It’s an excellent choice for data analysis and statistical modeling. R has a wide range of features available and is highly extensible, allowing users to create custom packages and add-ons. With many different tutorials and guides available to help get started, R is an accessible language and can be used for both simple and complex statistical analysis and data analysis projects.
```

#### `comment_code`

``` r
> cat(comment_code("for (i in 1:10) {\n  print(i ** 2)\n}"))

*** ChatGPT input:

Add inline comments to the following R code: "for (i in 1:10) {
  print(i ** 2)
}"
#Loop through nums 1-10
for (i in 1:10) {
  #Print the square of each num
  print(i ** 2)
}
```

#### `create_unit_tests`

``` r
> cat(create_unit_tests("squared_numbers <- function(numbers) {\n  numbers ^ 2\n}"))

*** ChatGPT input:

Create a full testthat file, with test cases for the following R code: "squared_numbers <- function(numbers) {
  numbers ^ 2
}"
# testthat file

library(testthat)

context("squared_numbers()")

test_that("basic squared_numbers() is able to squared number", {
  expect_equal(squared_numbers(4), 16)
})

test_that("squared_numbers() result is number", {
  expect_type(squared_numbers(4), "numeric")
})

test_that("squared_numbers() is able to handle vector input", {
  expect_equal(squared_numbers(c(1,3)), c(1,9))
})
```

#### `create_variable_name`

``` r
> cat(create_variable_name("sapply(1:10, function(i) i ** 2)"))

*** ChatGPT input:

Give a good variable name to the result of the following R code: "sapply(1:10, function(i) i ** 2)"
squares
```

#### `document_code`

``` r
> cat(document_code("square_numbers <- function(numbers) numbers ** 2"))

*** ChatGPT input:

Document, in roxygen2 format, this R function: "square_numbers <- function(numbers) numbers ** 2"
#' Square a Numeric Vector
#' 
#' Take a numeric vector as an argument and square each element
#' 
#' @param numbers A numeric vector
#' 
#' @return A numeric vector with each element squared
#' 
#' @examples
#' square_numbers(2:10)
#' 
#' @export
#' 
square_numbers <- function(numbers) numbers ** 2
```

#### `explain_code`

``` r
> cat(explain_code("for (i in 1:10) {\n  print(i ** 2)\n}"))

*** ChatGPT input:

Explain the following R code: "for (i in 1:10) {
  print(i ** 2)
}"
The code is a for loop that prints the square of numbers 1 through 10 (i.e., 1, 4, 9, 16, 25, 36, 49, 64, 81, and 100). The loop starts with i=1 and iterates through 10 with the command "i in 1:10," and the square of each number is printed using the expression "i**2."
```

#### `find_issues_in_code`

``` r
> cat(find_issues_in_code("i <- 0\nwhile (i < 0) {\n  i <- i - 1\n}"))

*** ChatGPT input:

Find issues or bugs in the following R code: "i <- 0
while (i < 0) {
  i <- i - 1
}"
1. The loop condition is incorrect. It should be "i > 0" instead of "i < 0".
```

#### `optimize_code`

``` r
> cat(optimize_code("i <- 10\nwhile (i > 0) {\n  i <- i - 1\n  print(i)\n}"))

*** ChatGPT input:

Optimize the following R code: "i <- 10
while (i > 0) {
  i <- i - 1
  print(i)
}"
i <- 10
for (i in 10:1) {
  print(i-1)
}
```

#### `refactor_code`

``` r
> cat(refactor_code("i <- 10\nwhile (i > 0) {\n  i <- i - 1\n  print(i)\n}"))

*** ChatGPT input:

Refactor the following R code, returning valid R code: "i <- 10
while (i > 0) {
  i <- i - 1
  print(i)
}"
for (i in 10:1) {
  print(i)
}
```

## Additional Parameters

### Disable Console Messages

If you want {chatgpt} not to show messages in console, please set the
environment variable `OPENAI_VERBOSE=FALSE`.

### Addin Changes in Place

If you want {chatgpt} addins to take place in the editor -i.e., replace
the selected code with the result of the addin execution- then you sould
set the environment variable `OPENAI_ADDIN_REPLACE=TRUE`.

### ChatGPT Model Tweaks

ChatGPT model parameters can be tweaked by using environment variables.

The following environment variables variables can be set to tweak the
behavior, as documented in
<https://beta.openai.com/docs/api-reference/completions/create> .

- `OPENAI_MODEL`; defaults to `"gpt-3.5-turbo"`
- `OPENAI_MAX_TOKENS`; defaults to `256`
- `OPENAI_TEMPERATURE`; defaults to `1`
- `OPENAI_TOP_P`; defaults to `1`
- `OPENAI_FREQUENCY_PENALTY`; defaults to `0`
- `OPENAI_PRESENCE_PENALTY`; defaults to `0`
