# Lecture 18: Loops in R
# Answers
# Author: Arthur Cheib
# Policy Analytics Credential
# ---

## Libraries
library(dplyr)

## Exercise 1: Basic while loop
# Use a while loop to create a countdown from 5 to 1, printing each number,
# followed by "Blast off!" after exiting the loop.

counter <- 5  # Initialize counter at 5

while (counter > 0) {
  print(paste(counter, "..."))
  counter <- counter - 1  # Decrement counter by 1
}

print("Blast off!")

## Exercise 2: While loop with condition
# Write a while loop that starts with x = 1 and repeatedly adds x to a sum variable until x is greater than 100.
# Print the final sum.

x <- 1  # Starting point
sum <- 0  # Initialize sum at 0
while (x <= 100) {
  sum <- sum + x  # Add x to sum
  x <- x + 1  # Increment x by 1
}
print(paste("The final sum is:", sum))  # Print the final sum

## Exercise 3: While loop with gapminder data
# Use a while loop to find and print the first 3 countries in the gapminder dataset with a life expectancy greater than 80 years


data_filtered <- gapminder |> 
  filter(lifeExp > 80)  # Filter data

count <- 1  # Initialize counter
row <- 1  # Start from the first row
while (count <= 3 & row <= nrow(data_filtered)) {
  country <- data_filtered[[row, 'country']]  # Get country name
  lifeExp <- data_filtered[[row, 'lifeExp']]  # Get life expectancy
  print(paste(country, "has a life expectancy of", lifeExp, "years."))
  count <- count + 1  # Increment counter
  row <- row + 1  # Move to the next row
}
