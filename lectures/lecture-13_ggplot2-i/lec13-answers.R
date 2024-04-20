# Lecture 13: Data Visualization - ggplot2 (i)
# Answers
# Author: Arthur Cheib
# Policy Analytics Credential

## Exercise 1: Basic ggplot graph
# Create a basic ggplot scatter plot using the gapminder dataset for a country of your choice, displaying its GDP per capita over the years.
# Use geom_point() for the plot. Make sure to label your axes appropriately.

library(gapminder)
library(ggplot2)
gapminder_country <- gapminder %>% 
  filter(country == "India")

ggplot(gapminder_country, aes(x = year, y = gdpPercap)) +
  geom_point() +
  labs(title = "GDP per Capita Over the Years in India", 
       x = "Year", 
       y = "GDP per Capita")

## Exercise 2: Enhance the plot with color
# Modify the previous plot to color the points based on the continent. Also, adjust the point size to 3.

ggplot(gapminder_country, aes(x = year, y = gdpPercap, color = continent)) +
  geom_point(size = 3) +
  labs(title = "GDP per Capita Over the Years in India, Colored by Continent", 
       x = "Year", 
       y = "GDP per Capita")

## Exercise 3: Add a smoother
# Using the same plot from Exercise 2, add a smooth line to estimate trends. Use geom_smooth() and set the method to 'loess'.

ggplot(gapminder_country, aes(x = year, y = gdpPercap, color = continent)) +
  geom_point(size = 3) +
  geom_smooth() +
  labs(title = "GDP per Capita Over the Years in India with Trend Line", 
       x = "Year", 
       y = "GDP per Capita")

## Exercise 4: Custom themes
# For any plot of your choice from the previous exercises, apply a custom theme using theme_minimal() and customize the text of the title and axes.

ggplot(gapminder_country, aes(x = year, y = gdpPercap, color = continent)) +
  geom_point(size = 3) +
  geom_smooth() +
  labs(title = "GDP per Capita Over the Years in India with Trend Line", 
       x = "Year", 
       y = "GDP per Capita") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        axis.title.x = element_text(face = "bold"),
        axis.title.y = element_text(face = "bold"))
