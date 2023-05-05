
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ChatGPT coding assistant for RStudio

<center>
<img width="300" height="400" src="man/figures/chatgpt_meme.jpeg">
<p>
Meme by Programming Jokes I IT Humor & Memes
</p>
</center>

## Installation

Install the current released version of `{chatgpt}` from
[CRAN](https://cran.r-project.org/package=chatgpt):

``` r
install.packages("chatgpt")
```

Or install the development version from
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

## Common Errors

#### You exceeded your current quota, please check your plan and billing details

``` r
Error in gpt_get_completions: 
  list(message = "You exceeded your current quota, please check your plan and billing details.", type = "insufficient_quota", param = NULL, code = NULL)
```

To fix this, you need to **provide a billing method** in OpenAI. More
information can be found in this
[article](https://help.openai.com/en/articles/6891831-error-code-429-you-exceeded-your-current-quota-please-check-your-plan-and-billing-details).

## Code Examples

#### `ask_chatgpt`

``` r
> cat(ask_chatgpt("What do you think about R language?"))
As an AI language model, I dont have personal opinions, but I can provide you factual information about R language. R is a popular programming language used for statistical computing, data analysis, and graphical visualization. It provides a wide range of tools for analyzing data, including linear and non-linear modeling, time-series analysis, and classification methods, among others. R is also an open-source language, which means it is freely available to use for everyone. Due to its extensive package ecosystem and user-friendly syntax, R is widely preferred by data analysts, statisticians, and researchers.
```

#### `comment_code`

``` r
> cat(comment_code("for (i in 1:10) {\n  print(i ** 2)\n}"))
# This is a for loop that initializes the variable i to 1 and iterates until it reaches 10
for (i in 1:10) { 
# The code block within the loop will execute once for each iteration 
# This line prints the result of i raised to the power of 2 using the ** operator
  print(i ** 2)
}
```

#### `complete_code`

``` r
> cat(complete_code("# A function to square each element of a vector\nsquare_each <- function("))
square_each <- function(x){
  x_squared <- x^2
  return(x_squared)
}

# Example usage
my_vector <- c(1, 2, 3, 4, 5)
square_each(my_vector) # Output: 1  4  9 16 25
```

#### `create_unit_tests`

``` r
> cat(create_unit_tests("squared_numbers <- function(numbers) {\n  numbers ^ 2\n}"))
Sure, heres a full testthat file with test cases for the given R code:

{r}
library(testthat)

# Define the function
squared_numbers <- function(numbers) {
  numbers ^ 2
}

# Test case for a vector of one number
test_that("squared_numbers works with one number", {
  expect_equal(squared_numbers(2), 4)
})

# Test case for a vector of multiple numbers
test_that("squared_numbers works with multiple numbers", {
  expect_equal(squared_numbers(c(2, 3, 4)), c(4, 9, 16))
})

# Test case for an empty vector
test_that("squared_numbers works with an empty vector", {
  expect_error(squared_numbers(NULL))
  expect_warning(squared_numbers(NaN))
})

# Test case for a non-numeric vector
test_that("squared_numbers works with a non-numeric vector", {
  expect_error(squared_numbers("test"))
  expect_error(squared_numbers(TRUE))
})


In these test cases, were testing:
- whether the function works with a vector of one number
- whether the function works with a vector of multiple numbers
- whether the function gracefully handles an empty vector- whether the function gracefully handles a non-numeric vector

For the first two test cases, were using expect_equal() to check that the functions output matches the expected output. For the next two test cases, were using expect_error() and expect_warning() to check that the function throws the expected errors and warnings.

You can save this code as a file with a .R extension, for example squared_numbers_test.R, and then run the tests with the test_file() function from the testthat package:

{r}
library(testthat)
test_file("squared_numbers_test.R")


This will output a summary of the test results, showing how many tests passed, skipped, and failed.
```

#### `create_variable_name`

``` r
> cat(create_variable_name("sapply(1:10, function(i) i ** 2)"))
Here is an example of a good variable name for the result: 


squared_values <- sapply(1:10, function(i) i ** 2)


The variable name squared_values indicates that the result of the code is a set of values that have been squared.
```

#### `document_code`

``` r
> cat(document_code("square_numbers <- function(numbers) numbers ** 2"))
Id be happy to help! Heres an example of how you could document the "square_numbers" function using roxygen2 format:

{r}
# Square numbers
#
# This function takes a vector of numbers and returns their squares.
#
# @param numbers A numeric vector to be squared
#
# @return A numeric vector representing the squares of the input numbers
#
# @examples
# square_numbers(1:5)
#
# @export
square_numbers <- function(numbers) {
  numbers ** 2
}


This includes a brief description of the function, an explanation of the input parameter, a description of the output, an example usage of the function, and the @export tag, which indicates that this function should be available to users of the package.
```

#### `explain_code`

``` r
> cat(explain_code("for (i in 1:10) {\n  print(i ** 2)\n}"))
This is a for loop that will run 10 times, with the value of i ranging from 1 to 10. 

During each iteration of the loop, the value of i is squared using the ** (exponentiation) operator, and the result is printed using the print() function.

So, each time the loop runs, the output will be:

1
4
9
16
25
36
49
64
81
100

This loop can be used to generate the sequence of squares from 1 to 10.
```

#### `find_issues_in_code`

``` r
> cat(find_issues_in_code("i <- 0\nwhile (i < 0) {\n  i <- i - 1\n}"))
The code creates an infinite loop since the condition inside the while loop (i < 0) is never met when the initial value of i is 0. To fix it, either initialize i with a negative value like i <- -1 or change the comparison operator inside the loop to >, e.g. while (i > 0) { i <- i - 1 }.
```

#### `optimize_code`

``` r
> cat(optimize_code("i <- 10\nwhile (i > 0) {\n  i <- i - 1\n  print(i)\n}"))
The code can be optimized using a for loop which is a more efficient and concise loop for iterating over a sequence of values. Heres the optimized code:

R
for (i in 9:0) {
  print(i)
}


This code does the same thing as the original code, but its more efficient because it eliminates the need for the while loop and the extra variable assignment. The for loop directly iterates over the sequence from 9 to 0 and prints each value.
```

#### `refactor_code`

``` r
> cat(refactor_code("i <- 10\nwhile (i > 0) {\n  i <- i - 1\n  print(i)\n}"))
Here is the refactored R code:


i <- 10

for (i in 9:0) {
  print(i)
}


This can also be done using a while loop:


i <- 10

while (i > 0) {
  print(i - 1)
  i <- i - 1
}


Both versions will produce the same output as the original code.
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
#> El código utiliza un bucle "for" para imprimir los cuadrados de los números del 1 al 10. 
#> 
#> La sintaxis "for (i in 1:10)" indica que el bucle se va a ejecutar 10 veces, y que la variable "i" va a tomar valores desde 1 hasta 10. 
#> 
#> Dentro del bucle, "print(i ** 2)" calcula el cuadrado del valor actual de "i" y lo imprime en la consola. El operador "**" se usa para elevar un número a una potencia. 
#> 
#> Entonces, la salida del código será: 
#> 
#> [1] 1
#> [1] 4
#> [1] 9
#> [1] 16
#> [1] 25
#> [1] 36
#> [1] 49
#> [1] 64
#> [1] 81
#> [1] 100
```

### Use ChatGPT behind a proxy

In order to run ChatGPT queries behind a proxy, set the `OPENAI_PROXY`
environment variable with a valid `IP:PORT` proxy. E.g.,
`Sys.setenv("OPENAI_PROXY" = "81.94.255.13:8080")`.

### ChatGPT Model Tweaks

ChatGPT model parameters can be tweaked by using environment variables.

The following environment variables can be set to tweak the behavior, as
documented in
<https://beta.openai.com/docs/api-reference/completions/create> .

- `OPENAI_MODEL`; defaults to `"gpt-3.5-turbo"`
- `OPENAI_MAX_TOKENS`; defaults to `256`
- `OPENAI_TEMPERATURE`; defaults to `1`
- `OPENAI_TOP_P`; defaults to `1`
- `OPENAI_FREQUENCY_PENALTY`; defaults to `0`
- `OPENAI_PRESENCE_PENALTY`; defaults to `0`
