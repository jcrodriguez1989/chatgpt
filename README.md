
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

## Code Examples

#### `ask_chatgpt`

``` r
> cat(ask_chatgpt("What do you think about R language?"))
As an AI language model, I do not have personal preferences. However, R is a popular language among data scientists and statisticians for statistical analysis, data visualization, and machine learning. It has a large community and a vast collection of libraries and packages that make it a powerful tool for data analysis. Overall, it is a useful language for those working with data.
```

#### `comment_code`

``` r
> cat(comment_code("for (i in 1:10) {\n  print(i ** 2)\n}"))
# This for loop iterates through numbers 1 to 10, inclusive
for (i in 1:10) {
  # The print function outputs the value of i squared on each iteration
  print(i ** 2)
}
```

#### `complete_code`

``` r
> cat(complete_code("# A function to square each element of a vector\nsquare_each <- function("))
square_each <- function(vec) {
  vec_squared <- vec^2
  return(vec_squared)
}

This code defines a function called "square_each" that takes a vector as its input argument and returns a new vector with each element squared. The function accomplishes this by raising each element of the input vector to the power of 2 using the "^" operator and then assigning the resulting vector to a new variable called "vec_squared". Finally, the function returns the vec_squared variable.
```

#### `create_unit_tests`

``` r
> cat(create_unit_tests("squared_numbers <- function(numbers) {\n  numbers ^ 2\n}"))
Sure, heres the testthat file for the squared_numbers function:


library(testthat)

# Test cases for squared_numbers function
test_that("Squared numbers function works correctly",
{
  numbers <- c(1, 2, 3, 4, 5)
  squared_numbers <- squared_numbers(numbers)
  
  # Check if correct length
  expect_equal(length(squared_numbers), length(numbers), 
  info = "Length of output not equal to input")
  
  # Check if correct values
  expect_equal(squared_numbers[1], numbers[1] ^ 2, 
  info = "Incorrect output value for index 1")
  
  expect_equal(squared_numbers[2], numbers[2] ^ 2, 
  info = "Incorrect output value for index 2")
  
  expect_equal(squared_numbers[3], numbers[3] ^ 2, 
  info = "Incorrect output value for index 3")
  
  expect_equal(squared_numbers[4], numbers[4] ^ 2, 
  info = "Incorrect output value for index 4")
  
  expect_equal(squared_numbers[5], numbers[5] ^ 2, 
  info = "Incorrect output value for index5")
})

# Test for empty input
test_that("Squared numbers function handles empty input",
{
  numbers <- numeric(0)
  squared_numbers <- squared_numbers(numbers)
  
  # Check if output is empty
  expect_is(squared_numbers, "numeric", 
  info = "Output is not of type numeric")
  
  expect_equal(length(squared_numbers), 0, 
  info = "Output is not empty")
})

# Test for negative input
test_that("Squared numbers function handles negative input",
{
  numbers <- c(-1, -2, -3, -4, -5)
  squared_numbers <- squared_numbers(numbers)
  
  # Check if correct length
  expect_equal(length(squared_numbers), length(numbers), 
  info = "Length of output not equal to input")
  
  # Check if correct values
  expect_equal(squared_numbers[1], numbers[1] ^ 2, 
  info = "Incorrect output value for index 1")
  
  expect_equal(squared_numbers[2], numbers[2] ^ 2, 
  info = "Incorrect output value for index 2")
  
  expect_equal(squared_numbers[3], numbers[3] ^ 2, 
  info ="Incorrect output value for index 3")
  
  expect_equal(squared_numbers[4], numbers[4] ^ 2, 
  info = "Incorrect output value for index 4")
  
  expect_equal(squared_numbers[5], numbers[5] ^ 2, 
  info = "Incorrect output value for index 5")
})

# Test for non-numeric input
test_that("Squared numbers function handles non-numeric input",
{
  non_numeric_numbers <- c("a", "b", "c", "d")
  
  expect_error(squared_numbers(non_numeric_numbers), 
  info = "Did not handle non-numeric input gracefully")
})

 

This file includes tests for correct output with valid input, handling of empty input, handling of negative input, and handling of non-numeric input.
```

#### `create_variable_name`

``` r
> cat(create_variable_name("sapply(1:10, function(i) i ** 2)"))
A good variable name for the result of the sapply(1:10, function(i) i ** 2) code could be squares_of_1_to_10. This variable name clearly and concisely describes the data that is being stored, which is a vector of the squares of the numbers 1 through 10.
```

#### `document_code`

``` r
> cat(document_code("square_numbers <- function(numbers) numbers ** 2"))

# Square Numbers
#
# A function that takes a vector or a list of numbers and returns the square of each number.
#
# @param numbers A vector or a list of numbers to be squared.
#
# @return A vector or a list of the squared numbers.
#
# @examples
# square_numbers(c(1, 2, 3))
# # [1] 1 4 9
# square_numbers(list(4, -2, 0))
# # [[1]]
# # [1] 16
# #
# # [[2]]
# # [1] 4
# #
# # [[3]]
# # [1] 0
#
# @export
square_numbers <- function(numbers) {
    numbers ** 2
}
```

#### `explain_code`

``` r
> cat(explain_code("for (i in 1:10) {\n  print(i ** 2)\n}"))
The code is a for loop that will iterate over the numerical sequence 1 through 10, assigning each value to the variable i. Within each iteration of the loop, the code will print the result of i raised to the power of 2. Specifically, the double asterisks (**) operator is used to indicate exponentiation in R. So, in each iteration of the loop, the code will print 1, 4, 9, 16, 25, 36, 49, 64, 81, 100, each on a new line.
```

#### `find_issues_in_code`

``` r
> cat(find_issues_in_code("i <- 0\nwhile (i < 0) {\n  i <- i - 1\n}"))
The condition i < 0 is initially not met as the variable i is initialized to 0. Therefore, the while loop will not execute at all, resulting in an infinite loop. It seems that the intention might have been to start i from a negative value so that the loop iterates a certain number of times. In that case, the condition should be changed to something like while (i > -n) where n is the desired number of iterations.
```

#### `optimize_code`

``` r
> cat(optimize_code("i <- 10\nwhile (i > 0) {\n  i <- i - 1\n  print(i)\n}"))
The above code seems already efficient, but an optimized solution can be the usage of a for loop instead of a while loop as follows:


for (i in 9:0) {
  print(i)
}


This reduces the number of lines of code and is a more concise and readable solution.
```

#### `refactor_code`

``` r
> cat(refactor_code("i <- 10\nwhile (i > 0) {\n  i <- i - 1\n  print(i)\n}"))
Here is the refactored code:

R
i <- 10
while(i > 0) {
  i <- i - 1
  print(i)
}


This code decrements the value of i by one in each iteration of the while loop, and prints the updated value until i reaches zero.
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
#> Este código R ejecuta un ciclo 'for' que va desde 1 hasta 10 (inclusive). En cada iteración, el valor de 'i' se incrementa en uno y se imprimirá el valor de 'i' al cuadrado en la consola utilizando la función 'print()'. 
#> 
#> Entonces, el resultado impreso en la consola será una lista de los cuadrados de los números del 1 al 10.
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
