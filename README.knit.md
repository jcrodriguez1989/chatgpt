---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# ChatGPT coding assistant for RStudio

<center>
    <img width="300" height="400" src="https://media.licdn.com/dms/image/C5622AQG8D9NQ_ePuzA/feedshare-shrink_800/0/1673359083125?e=1676505600&v=beta&t=cnmYmdjyiAZ4gwZqqwJy1UXBJ5IlHWAiLWLQuSEjeYk">
    <p>Meme by Programming Jokes I IT Humor & Memes</p>
</center>

## Installation

You can install the development version of {chatgpt} from [GitHub](https://github.com/jcrodriguez1989/chatgpt) with:

``` r
# install.packages("remotes")
remotes::install_github("jcrodriguez1989/chatgpt")
```

## Requirements

You need to setup your ChatGPT API key in R.

First you will need to obtain your ChatGPT API key. You can create an API key by accessing [OpenAI API page](https://beta.openai.com/account/api-keys) -don't miss their article about [Best Practices for API Key Safety
](https://help.openai.com/en/articles/5112595-best-practices-for-api-key-safety)-.

Then you have to assign your API key for usage in R, this can be done just for the actual session, by doing:

``` r
Sys.setenv(OPENAI_API_KEY = "XX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
```

Or you can do it persistent (session-wide), by assigning it in your `.Renviron` file. For it, execute `usethis::edit_r_environ()`, and in that file write a line at the end your API key as

``` r
OPENAI_API_KEY=XX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

## Features

The {chatgpt} R package provides a set of features to assist in R coding. 
Current existing addins:

 - **Ask ChatGPT:** Opens an interactive chat session with ChatGPT
 - **Comment selected code:** Comment the selected code
 - **Create variable name:** Create a name for a variable that would be assigned the result of this code
 - **Document code (in roxygen2 format):** Document a function definition, in roxygen2 format
 - **Explain selected code:** Explain the selected code
 - **Find issues in the selected code:** Find issues in the selected code
 - **Optimize selected code:** Optimize the selected code
 - **Refactor selected code:** Refactor the selected code

**Note:** When no code is selected, it will use the whole file's code.


## Code Examples


#### `comment_code`

``` r
> cat(comment_code("for (i in 1:10) {\n  print(i ** 2)\n}"))

*** ChatGPT input:

Add inline comments to the following R code: "for (i in 1:10) {
  print(i ** 2)
}"
# This code is looping through the numbers 1 to 10 and printing the square of each number
for (i in 1:10) { # looping through integers 1 to 10
  print(i ** 2) # printing the square of each integer
}
```


#### `create_variable_name`

``` r
> cat(create_variable_name("sapply(1:10, function(i) i ** 2)"))

*** ChatGPT input:

Give a good variable name to the result of the following R code: "sapply(1:10, function(i) i ** 2)"
squared_values
```


#### `document_code`

``` r
> cat(document_code("square_numbers <- function(numbers) numbers ** 2"))

*** ChatGPT input:

Document, in roxygen2 format, this R function: "square_numbers <- function(numbers) numbers ** 2"
#' Square numbers
#' 
#' This function squares a given numeric vector.
#' 
#' @param numbers numeric vector.
#' 
#' @return numeric vector with each element squared.
#' 
#' @examples
#' square_numbers(c(1, 2, 3, 4))
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
This code is a for loop that will print out the square of numbers from 1 to 10. The first line sets up the loop and states that it will loop through the numbers 1 to 10, and the second line prints out the square of each number. The loop will execute 10 times, printing out the square of 1, 2, 3, 4, 5, 6, 7, 8, 9, and 10.
```


#### `find_issues_in_code`

``` r
> cat(find_issues_in_code("i <- 0\nwhile (i < 0) {\n  i <- i - 1\n}"))

*** ChatGPT input:

Find issues or bugs in the following R code: "i <- 0
while (i < 0) {
  i <- i - 1
}"
1. The while loop will never execute, since the condition (i < 0) is always false.
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
for (i in 9:0){
  print(i)
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

ChatGPT model parameters can be tweaked by using environment variables.

The following environment variables variables can be set to tweak the behavior, as documented in https://beta.openai.com/docs/api-reference/completions/create .

* `OPENAI_MODEL`; defaults to `"text-davinci-003"`
* `OPENAI_MAX_TOKENS`; defaults to `256`
* `OPENAI_TEMPERATURE`; defaults to `0.7`
* `OPENAI_TOP_P`; defaults to `1`
* `OPENAI_FREQUENCY_PENALTY`; defaults to `0`
* `OPENAI_PRESENCE_PENALTY`; defaults to `0`
