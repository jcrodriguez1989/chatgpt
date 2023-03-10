
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
- **Complete selected code:** Complete the selected code
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
As an AI language model, I do not have personal opinions, but I can tell you some facts about R programming language. R is a widely-used open source programming language and software environment for statistical computing and graphics. It is a popular tool for data analysis, data visualization, and machine learning. R has a large and active community of users and developers who contribute to packages and libraries that extend its functionality. R is also known for its flexibility and versatility, making it a powerful tool for data scientists, statisticians, and researchers.
```

#### `comment_code`

``` r
> cat(comment_code("for (i in 1:10) {\n  print(i ** 2)\n}"))

*** ChatGPT input:

Add inline comments to the following R code: "for (i in 1:10) {
  print(i ** 2)
}"

# This is a for loop that iterates over the sequence 1 to 10 and assigns each value to the variable i.
for (i in 1:10) {
  # This line prints the square of the current value of i.
  print(i ** 2)
}
```

#### `complete_code`

``` r
> cat(complete_code("# A function to square each element of a vector\nsquare_each <- function("))

*** ChatGPT input:

Complete the following R code: "# A function to square each element of a vector
square_each <- function("
square_each <- function(x) {
    x_squared <- x^2
    return(x_squared)
}

# This function takes a vector "x" as input, squares each element of the vector using the "^" operator, stores the squared values in a new vector "x_squared", and returns the new vector.
```

#### `create_unit_tests`

``` r
> cat(create_unit_tests("squared_numbers <- function(numbers) {\n  numbers ^ 2\n}"))

*** ChatGPT input:

Create a full testthat file, with test cases for the following R code: "squared_numbers <- function(numbers) {
  numbers ^ 2
}"
Here is a possible testthat file for the squared_numbers function:

R
library(testthat)

# Test the squared_numbers function
context("squared_numbers")

test_that("squared_numbers returns the square of each number", {
  numbers <- 1:5
  expected <- c(1, 4, 9, 16, 25)
  result <- squared_numbers(numbers)
  expect_equal(result, expected)
})

test_that("squared_numbers handles zero correctly", {
  numbers <- 0
  expected <- 0
  result <- squared_numbers(numbers)
  expect_equal(result, expected)
})

test_that("squared_numbers handles negative numbers correctly", {
  numbers <- -3:-1
  expected <- c(9, 4, 1)
  result <- squared_numbers(numbers)
  expect_equal(result, expected)
})

test_that("squared_numbers handles non-numeric input correctly", {
  numbers <- c(1, "a", NA, TRUE)
  expect_error(squared_numbers(numbers))
})


These tests cover a variety of scenarios, including positive, zero, and negative numbers, as well as non-numeric input.
```

#### `create_variable_name`

``` r
> cat(create_variable_name("sapply(1:10, function(i) i ** 2)"))

*** ChatGPT input:

Give a good variable name to the result of the following R code: "sapply(1:10, function(i) i ** 2)"
One possible variable name for the result of this R code could be "squared_values", since the code calculates the squares of integers from 1 to 10. So you could assign the result to a variable using something like:

R
squared_values <- sapply(1:10, function(i) i ** 2)
 

Then you could use the variable "squared_values" later in your code to refer to the vector of squared values.
```

#### `document_code`

``` r
> cat(document_code("square_numbers <- function(numbers) numbers ** 2"))

*** ChatGPT input:

Document, in roxygen2 format, this R function: "square_numbers <- function(numbers) numbers ** 2"
# Square a Vector of Numbers
#
# This function takes a vector of numbers as input and returns the vector of numbers squared.
#
# @param numbers A numeric vector to be squared
# @return A numeric vector of squared values of input numbers
# @examples
# square_numbers(1:5)
# # returns: 1 4 9 16 25
# @export
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
This R code creates a loop that iterates from 1 to 10, with i taking on the values 1, 2, ..., 10. For each value of i, the code prints i squared using the print() function. 

The ** operator is used to raise i to the power of 2 (i.e., i squared). 

So, the output of this code will be a sequence of numbers, each number squared: 

1, 4, 9, 16, 25, 36, 49, 64, 81, 100.
```

#### `find_issues_in_code`

``` r
> cat(find_issues_in_code("i <- 0\nwhile (i < 0) {\n  i <- i - 1\n}"))

*** ChatGPT input:

Find issues or bugs in the following R code: "i <- 0
while (i < 0) {
  i <- i - 1
}"
The issue with the given R code is that the condition in the while loop is not being satisfied as the initial value of "i" is zero and the condition is while "i" is less than zero. Therefore, the while loop will not execute at all.

If the intention was to decrement the value of "i" until it reaches a negative value, then the initial value of "i" should be greater than zero, and the condition in the while loop should be changed accordingly. 

Corrected code:

i <- 10
while (i > 0) {
  i <- i - 1
}
 

This code will decrement the value of i by 1 in each iteration of the while loop until the value of i becomes 0.
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
The code you provided counts down from 10 to 1 and prints each number. Heres an optimized version of the code that achieves the same outcome:


for (i in 9:0) {
  print(i)
}


This code uses a for loop instead of a while loop, which is a more concise and efficient way to iterate through a sequence of numbers. Instead of manually decrementing the value of i in each iteration, the for loop iterates through a pre-defined sequence (9:0) and assigns the value of i in each iteration automatically.
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

i <- 10
while (i > 0) {
  print(i)
  i <- i - 1
}
 

This code will print a sequence of integers from 10 down to 1. The updated code moves the print(i) statement before the decrement of i (i <- i - 1) to ensure that 10 gets printed first. Additionally, the placement of } has not been changed, because it is already in the correct position.
```

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
#> Este código de R utiliza la función "for" para imprimir los cuadrados de los números del 1 al 10. 
#> 
#> El "for" es un bucle que ejecuta un bloque de código un número específico de veces. En este caso, especifica que la variable "i" tomará valores del 1 al 10, uno a la vez.
#> 
#> La función "print" se utiliza para mostrar el resultado en la consola. Dentro del paréntesis, la expresión "i ** 2" eleva el valor actual de "i" al cuadrado.
#> 
#> Entonces, durante cada iteración del bucle, imprimirá el número actual de "i", elevado al cuadrado. El resultado final será los siguientes números: 1, 4, 9, 16, 25, 36, 49, 64, 81 y 100.
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
