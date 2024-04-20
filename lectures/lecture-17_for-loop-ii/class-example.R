# Load the required library
library(gapminder)

# Initialize an empty list to store the results
stats_2007 <- list()

# Loop through each unique continent
for (continent in unique(gapminder$continent)) {
  # Filter the data for the current continent and the year 2007
  data_2007 <- subset(gapminder, continent == continent & year == 2007)
  
  # Calculate the average life expectancy and its standard deviation for 2007
  avg_life_2007 <- mean(data_2007$lifeExp)
  sd_life_2007 <- sd(data_2007$lifeExp)
  
  # Calculate the average GDP per capita and its standard deviation for 2007
  avg_gdp_2007 <- mean(data_2007$gdpPercap)
  sd_gdp_2007 <- sd(data_2007$gdpPercap)
  
  # Store the results
  stats_2007[[continent]] <- list(
    avg_life_expectancy_2007 = avg_life_2007,
    sd_life_expectancy_2007 = sd_life_2007,
    avg_gdp_percap_2007 = avg_gdp_2007,
    sd_gdp_percap_2007 = sd_gdp_2007
  )
}

# Display the results
stats_2007$Oceania
