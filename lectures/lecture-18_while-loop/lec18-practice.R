# Lecture 18: Loops in R
# Practice exercises
# Author: Arthur Cheib
# Policy Analytics Credential
# ---

## Libraries
library(dplyr)

## Exercise 1: Basic while loop
# Use a while loop to create a countdown from 5 to 1, printing each number,
# followed by "Blast off!" after exiting the loop.

counter <- 5  # Initialize counter at 5

## Exercise 2: While loop with condition
# Write a while loop that starts with x = 1 and repeatedly adds x to a sum variable until x is greater than 100.
# Print the final sum.


## Code's hint
x <- 1  # Starting point
sum <- 0  # Initialize sum at 0

while (x <= 100) {

  ## Add a code here to do the sum
  
  ## Add a code here to increment x by 1

}

print(paste("The final sum is:", sum))  # Print the final sum

## Exercise 3: While loop with gapminder data
# Use a while loop to find and print the first 3 countries in the gapminder dataset with a life expectancy greater than 80 years

# Pre-step done for you
data_filtered <- gapminder |> 
  filter(lifeExp > 80)

# Remember to increment the row by 1 every iteration
