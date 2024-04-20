##### Homework 3 #####


# Libraries
library(tidyverse)
library(gapminder)
data(gapminder)

## Question 1
# Plot the GDP per capita (gdpPercap) of all European in the year 2007.
# Hint1: you can set the 'y' argument within the `ggplot` function to 'country' to plot the countries on the y-axis.
q1_graph <- gapminder |> 
  filter(year == 2007 & continent == 'Europe') |> 
  ggplot(aes(x = gdpPercap, y = country)) +
  geom_point()

q1_graph


## Question 2

# Customize the plot from Questions (1) by adding a title and labels for the x and y axes.
# Hint: remember to check the `?labs` function to see how to add titles and labels to the plot.
q2_graph <- q1_graph +
  labs(title = 'GDP per capita of European countries in 2007',
       x = 'GDP per capita',
       y = 'Country')

q2_graph

## Question 3
# Plot the GDP per capita (gdpPercap) by Life Expectancy of all countries in the year 2007.
# Using the same ggplot graph from Question (2), modify it to display life expectancy (lifeExp)
# on the y-axis (instead of the name of countries) and GDP per capita (gdpPercap) on the x-axis.
q3_graph <- gapminder |> 
  filter(year == 2007) |> 
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

q3_graph

## Question 4
# Map the size of the points to the population (pop) and color the points by continent.
# Hint: you can set the 'size' argument within the `aes` function the column you want to map the size of the points
# Please provide the code to your answer below
q4_graph <- q3_graph +
  aes(size = pop, color = continent)

q4_graph

## Question 5
# Create a a histogram (geom_histogram) of GDP per capita for the year 2002, and
# set the theme of the graph equal to a theme_minimal.
# Hint: make sure to set the binwidth argument within the geom_histogram function to a reasonable value.
# Please provide the code to your answer below
q5_graph <- gapminder |> 
  filter(year == 2002) |> 
  ggplot(aes(x = gdpPercap)) +
  geom_histogram(binwidth = 950) +
  theme_minimal()

q5_graph


## Question 6
# Create line plot showing the trend of GDP per capita over time for China.
# Set the theme to be theme_light
# Choose a title, and meaningful labels for the x and y axes
# Use the geom_line() geom.
# Please provide the code to your answer below
q7_graph <- gapminder |> 
  filter(country == 'China') |> 
  ggplot(aes(x = year, y = gdpPercap)) +
  geom_line() +
  theme_light() +
  labs(title = 'GDP per capita of China over time',
       x = 'Year',
       y = 'GDP per capita')

q7_graph


## Question 7
# Using the graph from question (6), use the scale_x_continuous() function to set the
# limits of the x-axis to be between 1952 and 2007, and use the `breaks` argument to set the
# breaks of the x-axis to be every 5 years. Also, add the geom_point() geom to the plot.
# Hint: the `seq` function can be used to generate a sequence of numbers.
# Please provide the code to your answer below
q8_graph <- q7_graph +
  scale_x_continuous(limits = c(1952, 2007), breaks = seq(1952, 2007, 5)) +
  geom_point()

q8_graph


## Question 7
# Recreate the graph from question (5) an (6), but now, instead of filtering for China only,
# keep all the countries countries from 'Americas' continent and facet the plot by country.
# Please provide the code to your answer below
q9_graph <- gapminder |> 
  filter(continent == 'Americas') |> 
  ggplot(aes(x = year, y = gdpPercap)) +
  geom_line() +
  theme_light() +
  labs(title = 'GDP per capita of Americas countries over time',
       x = 'Year',
       y = 'GDP per capita') +
  scale_x_continuous(limits = c(1952, 2007), breaks = seq(1952, 2007, 5)) +
  geom_point() +
  facet_wrap(~country)

q9_graph


## Question 9
# The x-axis of your graph is likely too crowded.
# Use the `theme` function (and the `axis.text.x` argument within it) to rotate the x-axis labels by 45 degrees.
# Please provide the code to your answer below
q10_graph <- q9_graph +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

q10_graph