# Lecture 17: Loops in R
# Answers
# Author: Arthur Cheib
# Policy Analytics Credential
# ---

## Exercise 1: Simple for loop with sequence
# Write a for loop that prints the square of each number from 1 to 5.

for (i in 1:5) {
  square <- i^2
  print(paste("The square of", i, "is", square))
}

## Exercise 2: For loop with gapminder data
# Use a for loop to print the GDP per capita for Brazil for every year available in the gapminder dataset.

library(gapminder)
gapminder_brazil <- gapminder %>% filter(country == "Brazil")

for (i in 1:nrow(gapminder_brazil)) {
  year <- gapminder_brazil$year[i]
  gdpPercap <- gapminder_brazil$gdpPercap[i]
  print(paste("Year:", year, "- GDP per capita:", gdpPercap))
}

## Exercise 3: Nested for loop
# Create a nested for loop to print:
# 1. The life expectancy of Brazil and Argentina
# 2. for the years 2000 and 2007. 

countries <- c("Brazil", "Argentina")
years <- c(2000, 2007)

for (country in countries) {
  for (year in years) {
    lifeExp <- gapminder %>% 
      filter(country == country, year == year) %>% 
      pull(lifeExp)
    print(paste(country, "Life Expectancy in", year, ":", lifeExp))
  }
}
