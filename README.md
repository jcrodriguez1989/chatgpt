
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
As an AI language model, I do not have the ability to think or have personal opinions. However, I can provide some objective information about R language.

R is a popular programming language used for statistical computing, data analysis, and graphics. Its popularity can be attributed to its easy-to-learn syntax, extensive libraries of statistical and graphical functions, and active community of users who contribute to its development and use.

R is widely used in academia and industry for data analysis, machine learning, and statistical modeling, and is often preferred by data scientists due to its versatility and flexibility. Additionally, R integrates well with other popular data science tools like Python and SQL, making it a valuable addition to the data scientists toolbox.
```

#### `comment_code`

``` r
> cat(comment_code("for (i in 1:10) {\n  print(i ** 2)\n}"))

*** ChatGPT input:

Add inline comments to the following R code: "for (i in 1:10) {
  print(i ** 2)
}"
# This code starts a loop that will iterate 10 times,
# with i taking on the values 1 through 10.

for (i in 1:10) {
  
  # Within each iteration of the loop, the code
  # calculates the square of i using the ** operator
  # and prints the result to the console.
  
  print(i ** 2)
}
```

#### `complete_code`

``` r
> cat(complete_code("# A function to square each element of a vector\nsquare_each <- function("))

*** ChatGPT input:

Complete the following R code: "# A function to square each element of a vector
square_each <- function("
square_each <- function(vec){
  squared_vec <- vec^2
  return(squared_vec)
}

# This function takes a vector "vec" as input, squares each element of the vector using the "^" operator, and returns the resulting squared vector "squared_vec".
```

#### `create_unit_tests`

``` r
> cat(create_unit_tests("squared_numbers <- function(numbers) {\n  numbers ^ 2\n}"))

*** ChatGPT input:

Using testthat 3e, version over 3.0.0, create a full testthat file, with test cases for the following R code: "squared_numbers <- function(numbers) {
  numbers ^ 2
}"
Sure! Here is a complete testthat file to test the function squared_numbers. It includes both positive and negative test cases, as well as some edge cases:

r
library(testthat)

# Define the function to test
squared_numbers <- function(numbers) {
  numbers ^ 2
}

# Test that the function works for positive numbers
test_that("squared_numbers works for positive numbers", {
  expect_equal(squared_numbers(2), 4)
  expect_equal(squared_numbers(5), 25)
  expect_equal(squared_numbers(10), 100)
})

# Test that the function works for negative numbers
test_that("squared_numbers works for negative numbers", {
  expect_equal(squared_numbers(-2), 4)
  expect_equal(squared_numbers(-5), 25)
  expect_equal(squared_numbers(-10), 100)
})

# Test that the function works for zero
test_that("squared_numbers works for zero", {
  expect_equal(squared_numbers(0), 0)
})

# Test that the function works for decimal numbers
test_that("squared_numbers works for decimal numbers", {
  expect_equal(squared_numbers(1.5), 2.25)
  expect_equal(s
```

#### `create_variable_name`

``` r
> cat(create_variable_name("sapply(1:10, function(i) i ** 2)"))

*** ChatGPT input:

Give a good variable name to the result of the following R code: "sapply(1:10, function(i) i ** 2)"
One good variable name for the result of the code would be "square_results".
```

#### `document_code`

``` r
> cat(document_code("square_numbers <- function(numbers) numbers ** 2"))

*** ChatGPT input:

Document, in roxygen2 format, this R function: "square_numbers <- function(numbers) numbers ** 2"
# Calculate the square of each number in a vector.
#
# This function calculates the square of each number in a given vector.
#
# @param numbers A numeric vector.
# @return A numeric vector containing the square of each element in the input vector.
# @examples
# square_numbers(c(1, 2, 3))
# # returns: [1] 1 4 9
#
# square_numbers(-3:3)
# # returns: [1] 9 4 1 0 1 4 9
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
This R code is a simple for loop. 

The loop runs 10 times, with the variable "i" taking on values from 1 to 10. 

Within each iteration of the loop, the code prints the result of "i" raised to the power of 2, using the ** operator. 

So the output of this code will be 1, 4, 9, 16, 25, 36, 49, 64, 81, 100 printed on separate lines.
```

#### `find_issues_in_code`

``` r
> cat(find_issues_in_code("i <- 0\nwhile (i < 0) {\n  i <- i - 1\n}"))

*** ChatGPT input:

Find issues or bugs in the following R code: "i <- 0
while (i < 0) {
  i <- i - 1
}"
The issue with the code is that the while loop condition is set to i < 0, which means that the loop will continue iterating as long as i is less than zero. However, the initial value of i is also set to zero, so the loop will never execute because 0 < 0 is false. Additionally, the value of i is decremented by 1 at each iteration of the loop, so even if the loop was entered with a different initial value of i that satisfied the condition, the value of i would continue to become more negative indefinitely, resulting in an infinite loop.

To fix the code, we can change the initial value of i to a negative number and change the loop condition to i < 0. For example:


i <- -1
while (i < 0) {
  i <- i - 1
}


This code will execute the loop once and set i to -2, which does not satisfy the condition i < 0, so the loop will exit.
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
The following code achieves the same output but is more concise:


for (i in 9:0) {
  print(i)
}


This code uses a for loop instead of a while loop and initializes i directly to 9. After each iteration, i is decreased by 1 until it reaches 0. The loop then exits and the output is the same as the original code.
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
Here is the refactored R code:


i <- 10
while (i > 0) {
  print(i - 1)
  i <- i - 1
}


This code will produce the same output as the original code snippet, but the order of the print statement and decrement of i have been swapped to provide a more intuitive sequential flow.
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
#> El código R muestra un bucle for que imprime el cuadrado de los números del 1 al 10. 
#> 
#> La sintaxis `for (i in 1:10)` establece una iteración que repetirá el código que se encuentra en el cuerpo del bucle tantas veces como valores tenga el vector `1:10`.
#> 
#> En cada iteración, el valor actual de `i` será igual a uno de los números del vector `1:10`. El código en el cuerpo del bucle `print(i ** 2)` imprime el valor de `i` elevado a la potencia de 2, que corresponde al cuadrado de `i`.
#> 
#> Por lo tanto, el código imprimirá los siguientes valores en la consola:
#> ```
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
#> ```
```

### Use ChatGPT behind a proxy

In order to run ChatGPT queries behind a proxy, set the `OPENAI_PROXY`
environment variable with a valid `IP:PORT` proxy. E.g.,
`Sys.setenv("OPENAI_PROXY" = "81.94.255.13:8080")`.

### ChatGPT Model Tweaks

ChatGPT model parameters can be tweaked by using environment variables.

The following environment variables can be set to tweak the
behavior, as documented in
<https://beta.openai.com/docs/api-reference/completions/create> .

- `OPENAI_MODEL`; defaults to `"gpt-3.5-turbo"`
- `OPENAI_MAX_TOKENS`; defaults to `256`
- `OPENAI_TEMPERATURE`; defaults to `1`
- `OPENAI_TOP_P`; defaults to `1`
- `OPENAI_FREQUENCY_PENALTY`; defaults to `0`
- `OPENAI_PRESENCE_PENALTY`; defaults to `0`
