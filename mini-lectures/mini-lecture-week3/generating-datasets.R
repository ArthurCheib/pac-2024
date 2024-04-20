library(gapminder)
data(gapminder)
library(here)


# Splitting the dataset
country_data <- distinct(gapminder, country, continent)

population_data <- select(gapminder, country, year, pop) |> 
  mutate(year = str_c('yr_', year)) |> 
  pivot_wider(names_from = year, values_from = pop)

gdp_life_data <- select(gapminder, country, year, gdpPercap, lifeExp)

# Writing the data to csv files
# Save datasets
write.csv(country_data, here('mini-lectures', 'datasets', "country_data.csv"), row.names = FALSE)
write.csv(population_data, here('mini-lectures', 'datasets', "population_data.csv"), row.names = FALSE)
write.csv(gdp_life_data, here('mini-lectures', 'datasets', "gdp_life_data.csv"), row.names = FALSE)

          