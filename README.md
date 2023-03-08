
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
As an AI language model, I don't have personal opinions or beliefs, but I can provide you with information about R programming. R is a high-level programming language designed for data analysis, statistical computing, and graphics. It is widely used in various fields, including finance, biology, social sciences, and engineering, due to its powerful data visualization and statistical analysis capabilities. R also has a vast library of packages, making it easy to perform specialized tasks such as machine learning, data mining, and text analysis. Overall, R is an essential tool for data analysts, statisticians, and researchers.
```

#### `comment_code`

``` r
> cat(comment_code("for (i in 1:10) {\n  print(i ** 2)\n}"))

*** ChatGPT input:

Add inline comments to the following R code: "for (i in 1:10) {
  print(i ** 2)
}"
# This code uses a for loop to iterate through values 1 to 10
for (i in 1:10) {
  # This line prints the square of the current value of i
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
Here's an example testthat file for the `squared_numbers` function:

```R
# Load the testthat library
library(testthat)

# Define the test cases
test_that("squared_numbers returns correct values", {
  # Test case 1: Input is a single number
  expect_equal(squared_numbers(2), 4)
  
  # Test case 2: Input is a vector of numbers
  expect_equal(squared_numbers(c(2, 3, 4)), c(4, 9, 16))
})

# Run the tests
testthat::test_package("squared_numbers")
```

This test file includes two test cases that test the basic functionality
of `squared_numbers`, ensuring that it correctly squares both single
numbers and vectors of numbers. The `expect_equal` function is used to
test that the function output matches the expected output. Finally,
`testthat::test_package` is used to run the test cases in the file.



    #### `create_variable_name`

    ``` r
    > cat(create_variable_name("sapply(1:10, function(i) i ** 2)"))

    *** ChatGPT input:

    Give a good variable name to the result of the following R code: "sapply(1:10, function(i) i ** 2)"
    The result of this R code is a vector containing the squares of the numbers 1 through 10. A good variable name for this result might be "squared_numbers".

#### `document_code`

``` r
> cat(document_code("square_numbers <- function(numbers) numbers ** 2"))

*** ChatGPT input:

Document, in roxygen2 format, this R function: "square_numbers <- function(numbers) numbers ** 2"
#' Square a Vector of Numbers
#'
#' This function takes a vector of numbers and squares each element.
#'
#' @param numbers A numeric vector to be squared.
#' @return A numeric vector with each element squared.
#' @examples
#' square_numbers(c(1, 2, 3))
#' square_numbers(6)
#' @export
square_numbers <- function(numbers) {
  numbers ** 2
}
```

#### `explain_code`

``` r
> cat(explain_code("for (i in 1:10) {\n  print(i ** 2)\n}"))

*** ChatGPT input:

Explain the following R code: "for (i in 1:10) {
  print(i ** 2)
}"
This code defines a loop that will iterate through a sequence of numbers from 1 to 10 using the syntax "i in 1:10". Within the loop, we use the function "print()" to print the square of the current value of "i" using the expression "i ** 2". 

In summary, this code will generate the squares of all numbers from 1 to 10, and print each square on a new line.
```

#### `find_issues_in_code`

``` r
> cat(find_issues_in_code("i <- 0\nwhile (i < 0) {\n  i <- i - 1\n}"))

*** ChatGPT input:

Find issues or bugs in the following R code: "i <- 0
while (i < 0) {
  i <- i - 1
}"
The issue with this code is that the condition in the while loop is always going to be false because i is equal to 0 and we are checking if i is less than 0. Therefore, the loop will never be executed resulting in i retaining its initial value of 0.

To make the loop execute, we need to change the condition to be greater than 0:
```

i \<- 0 while (i \> 0) { i \<- i - 1 }


    Alternatively, if we want to decrement i, we can keep the original condition and simply change the operator from a subtraction to an addition:

i \<- 0 while (i \< 0) { i \<- i + 1 }


    This will increment i until it reaches 0.

#### `optimize_code`

``` r
> cat(optimize_code("i <- 10\nwhile (i > 0) {\n  i <- i - 1\n  print(i)\n}"))

*** ChatGPT input:

Optimize the following R code: "i <- 10
while (i > 0) {
  i <- i - 1
  print(i)
}"
The code can be optimized by using a `for` loop instead of a `while` loop, like so:

```R
for (i in 10:1) {
  print(i)
}
```

This code achieves the same output as the original code in a more
concise and efficient manner.



    #### `refactor_code`

    ``` r
    > cat(refactor_code("i <- 10\nwhile (i > 0) {\n  i <- i - 1\n  print(i)\n}"))

    *** ChatGPT input:

    Refactor the following R code, returning valid R code: "i <- 10
    while (i > 0) {
      i <- i - 1
      print(i)
    }"

i \<- 10 while (i \> 0) { print(i) i \<- i - 1 }


    In this refactored code, the `print` statement is executed before decrementing `i` so that the value to be printed accurately reflects the desired output.

## Additional Parameters

### Disable Console Messages

If you want {chatgpt} not to show messages in console, please set the
environment variable `OPENAI_VERBOSE=FALSE`.

### Addin Changes in Place

If you want {chatgpt} addins to take place in the editor -i.e., replace
the selected code with the result of the addin execution- then you sould
set the environment variable `OPENAI_ADDIN_REPLACE=TRUE`.

### Change the language of ChatGPT responses

To change the language that ChatGPT responds in, the
`OPENAI_RETURN_LANGUAGE` environment variable must be changed. E.g.,

``` r
Sys.setenv("OPENAI_RETURN_LANGUAGE" = "Español")
cat(chatgpt::explain_code("for (i in 1:10) {\n  print(i ** 2)\n}"))
#> 
#> *** ChatGPT input:
#> 
#> Explain the following R code: "for (i in 1:10) {
#>   print(i ** 2)
#> }"
#> Este código R usa un bucle "for" para iterar a través de los números del 1 al 10, eleva cada número al cuadrado y lo imprime en la consola. 
#> 
#> La variable "i" se utiliza como un contador y toma el valor de cada número del 1 al 10 en cada iteración del bucle. 
#> 
#> La sintaxis "1:10" se utiliza para crear una secuencia de números enteros del 1 al 10, de la cual se iterará el bucle. 
#> 
#> El operador "**" se utiliza para realizar la operación de potencia en R. 
#> 
#> Entonces, el resultado de este código sería imprimir los siguientes valores en la consola:
#> 
#> 1
#> 4
#> 9
#> 16
#> 25
#> 36
#> 49
#> 64
#> 81
#> 100
```

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
