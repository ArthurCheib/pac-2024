# Lecture 16: Loops in R
# Answers
# Author: Arthur Cheib
# Policy Analytics Credential
# ---

## Exercise 1: Basic for loop with numbers
# Use a for loop to iterate over a sequence of numbers from 1 to 5, printing each number multiplied by 2.

for (i in 1:5) {
  print(i * 2)
}

## Exercise 2: for loop with a vector
# *se a for loop to print the name of each of the countries in the vector below

countries <- c("Brazil", "Sweden", "Japan", "Canada", "Nigeria")
for (country in countries) {
  print(country)
}

## Exercise 3: Conditional inside a for loop
# Use a for loop to iterate over numbers 1 to 10. For each number, print whether it is odd or even.

for (i in 1:10) {
  if (i %% 2 == 0) {
    print(paste(i, "is even"))
  } else {
    print(paste(i, "is odd"))
  }
}

## Exercise 4: Summation with a for loop
# Initialize a variable to store the sum (start at 0).
# Use a for loop to add numbers 1 through 10 to this sum. Print the final sum after the loop.

sum <- 0
for (i in 1:10) {
  sum <- sum + i
}
print(sum)

## Exercise 5: Applying a for loop to gapminder data
# For each country in the gapminder dataset, for the year 2007 calculate the average life expectancy 
# and print it. Use a for loop to iterate through unique country names.
# Hint: You may first need to filter the dataset for the year 2007 and find unique country names

data_2007 <- gapminder |> 
  filter(year == 2007)

countries <- unique(data_2007$country)

for (country in countries) {
  ## Filter for the country (loop variable)
  country_data <- data_2007 |> 
    filter(country == country)
  
  ## Make the calculation
  avg_lifeExp <- mean(country_data$lifeExp)
  
  ## Print the final result
  print(paste(country, "average life expectancy:", avg_lifeExp))
  
}
