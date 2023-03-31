
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ChatGPT coding assistant for RStudio

<center>
<img width="300" height="400" src="man/figures/chatgpt_meme.jpeg">
<p>
Meme by Programming Jokes I IT Humor & Memes
</p>
</center>

## Installation

Install the current released version of `chatgpt` from
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

*** ChatGPT input:

What do you think about R language?
As an AI language model, I do not have personal opinions, but I can provide you some information about R language.

R is a popular programming language for statistical computing and graphics. It is commonly used for data analysis, visualization, and modeling. R has a wide variety of libraries and packages that allow users to apply statistical techniques to their data in a flexible and customizable way. One of the strengths of R is its ability to handle large datasets and perform complex statistical computations quickly and efficiently. Another advantage is that R is an open-source language and it is constantly evolving with frequent updates and new packages being released.
```

#### `comment_code`

``` r
> cat(comment_code("for (i in 1:10) {\n  print(i ** 2)\n}"))

*** ChatGPT input:

Add inline comments to the following R code: "for (i in 1:10) {
  print(i ** 2)
}"

# This is a for loop that will iterate from 1 to 10 using i as the iterator variable
for (i in 1:10) {
  # This line will print the result of i raised to the power of 2
  print(i ** 2)
}
```

#### `complete_code`

``` r
> cat(complete_code("# A function to square each element of a vector\nsquare_each <- function("))

*** ChatGPT input:

Complete the following R code: "# A function to square each element of a vector
square_each <- function("
square_each <- function(vector) {
  result <- vector^2
  return(result)
}

# Example usage
my_vector <- c(1, 2, 3, 4, 5)
square_each(my_vector) # Output: 1  4  9 16 25
```

#### `create_unit_tests`

``` r
> cat(create_unit_tests("squared_numbers <- function(numbers) {\n  numbers ^ 2\n}"))

*** ChatGPT input:

Create a full testthat file, with test cases for the following R code: "squared_numbers <- function(numbers) {
  numbers ^ 2
}"
Sure! Here is a full testthat file with test cases for the squared_numbers() function:


library(testthat)

# Define the function
squared_numbers <- function(numbers) {
  numbers ^ 2
}

# Start the testing block
test_that("squared_numbers works as expected", {
  
  # Test case 1: Test with a single number
  expect_equal(squared_numbers(2), 4)
  
  # Test case 2: Test with a vector of numbers
  expect_equal(squared_numbers(c(1, 2, 3)), c(1, 4, 9))
  
  # Test case 3: Test with negative numbers
  expect_equal(squared_numbers(c(-2, 4, -6)), c(4, 16, 36))
  
  # Test case 4: Test with non-numeric input
  expect_error(squared_numbers("a"), "non-numeric argument to binary operator")
  
  # Test case 5: Test with missing input
  expect_error(squared_numbers(), "argument \"numbers\" is missing, with no default")
  
})


In this test file, we define the squared_numbers() function and then
```

#### `create_variable_name`

``` r
> cat(create_variable_name("sapply(1:10, function(i) i ** 2)"))

*** ChatGPT input:

Give a good variable name to the result of the following R code: "sapply(1:10, function(i) i ** 2)"
One possible variable name for the result of the code "sapply(1:10, function(i) i ** 2)" is "squared_values". This name reflects that the resulting vector contains the squared values of the numbers from 1 to 10.
```

#### `document_code`

``` r
> cat(document_code("square_numbers <- function(numbers) numbers ** 2"))

*** ChatGPT input:

Document, in roxygen2 format, this R function: "square_numbers <- function(numbers) numbers ** 2"
# Squares all numbers in a vector
#
# This function squares all numbers in a given vector.
#
# @param numbers A vector of numerical values
#
# @return A vector containing the squares of the input numbers
#
# @examples
# square_numbers(c(1, 2, 3))
#
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
This code uses a for loop in R to print the square of numbers from 1 to 10.

- The for statement initiates the loop.
- The variable i is being iterated through the values of 1 to 10 with 1:10.
- The print() statement prints the square of each value of i, calculated using the exponentiation operator (**) in R.
- The loop ends after 10 iterations, and the code prints the result of the last iteration, which is the square of 10.
```

#### `find_issues_in_code`

``` r
> cat(find_issues_in_code("i <- 0\nwhile (i < 0) {\n  i <- i - 1\n}"))

*** ChatGPT input:

Find issues or bugs in the following R code: "i <- 0
while (i < 0) {
  i <- i - 1
}"
The issue with this R code is that the condition in the while loop is always false, since i starts as 0 and will never be less than 0. As a result, the while loop is never entered, and i never changes from its initial value of 0. This results in an infinite loop, which can cause R to freeze or crash. 

To fix this issue, we can modify the code to ensure that the condition in the while loop is true at least once. For example, we could set i to a negative value before the while loop, like this:


i <- -1
while (i < 0) {
  i <- i - 1
}


This will ensure that the while loop is entered, and i will eventually be decreased to a value greater than or equal to 0.
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
The above code can be optimized by using a for loop instead of a while loop to avoid the need to initialize and update the counter variable manually. Heres the optimized code: 


for (i in 10:1) {
  print(i)
}
 

This code achieves the same result as the original while loop but is more concise and easier to read.
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
R
i <- 10
while (i > 0) {
  i <- i - 1
  print(i)
}

Note: The original code is already valid R code. However, it is best practice to include the code block in curly braces, even if it is only one line.
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
#> Este código R utiliza un bucle "for" para ejecutar una tarea repetitiva. En este caso, se ejecutará desde "i=1" hasta "i=10". Dentro de cada iteración del bucle, se imprime el resultado de elevar al cuadrado el valor actual de "i". El resultado final será la impresión de los valores 1, 4, 9, 16, 25, 36, 49, 64, 81 y 100 en la consola de R.
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
