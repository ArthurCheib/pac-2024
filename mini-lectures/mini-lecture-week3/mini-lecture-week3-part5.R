### PAC 2024
## Mini-lecture 1 - Part 2

## Fifth task: visualize the data
library(ggplot2)

## 3 - Creating graphs in R
# 3.1 - the ggplot2 package
# 3.2 - the three elements of a graph
#       - data, aesthetics, geometry

## Plot 2: lifeExp versus gpd per capita

## The evolution of population over time
gapminder |> 
  filter(country == 'Brazil') |>
  ggplot(aes(x = year, y = population / 1000000)) +
  geom_line() +
  theme_light() +
  geom_point()
  

## gdpPercap vs. lifeExp
gapminder |> 
  filter(year == 2007) |> 
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  ## Just changing the background color
  theme_light() +
  labs(title = 'My Title',
       subtitle = 'Subtitle',
       y = 'Life Expectancy (in years)',
       x = 'GPD per capita ($)')

