# Lecture 15: Control Flow Statements
# Answers
# Author: Arthur Cheib
# Policy Analytics Credential
# ---

## Libraries
library(dplyr)

## Exercise 1: Basic if statement
# Write an if statement that checks if a number is even. If it is, print "The number is even."
# Hint: You might need to research about the `%%` operator

number <- 42
if (number %% 2 == 0) {
  print("The number is even.")
}

## Exercise 2: if-else statement
# Expand the previous exercise with an else statement to handle odd numbers, printing "The number is odd."

number <- 43
if (number %% 2 == 0) {
  print("The number is even.")
} else {
  print("The number is odd.")
}

## Exercise 3: Nested if-else
# Use a nested if-else statement to check if a number is positive, negative, or zero and print the result.

number <- -5
if (number > 0) {
  print("The number is positive.")
} else if (number < 0) {
  print("The number is negative.")
} else {
  print("The number is zero.")
}

## Exercise 4: if_else function with vectors
# Use the if_else() function to replace all negative values in a vector with NA and print the result.

values <- c(-10, 0, 10, -20, 30)

result <- if_else(values < 0, NA_real_, values)
print(result)

## Exercise 5: Categorize life expectancy with if_else
# Using the gapminder dataset for the year 2007, categorize countries into "High" or "Low" life expectancy groups based on a threshold (e.g., 65 years), then print the first few rows of the result.

data_2007 <- gapminder |> 
  filter(year == 2007)

categorized_life_exp <- data_2007 |> 
  mutate(life_exp_category = if_else(lifeExp > 65, "High", "Low"))

head(categorized_life_exp)
