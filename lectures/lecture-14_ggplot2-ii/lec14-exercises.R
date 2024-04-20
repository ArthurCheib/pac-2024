# Lecture 14: Data Visualization - ggplot2
# Practice exercises
# Author: Arthur Cheib
# Policy Analytics Credential
# ---

## Exercise 1: Plot with faceting
# Use ggplot2 to create a scatter plot showing the life expectancy over the years for two countries of your choice, using facet_wrap to separate them into two panels.
# Use the gapminder dataset, and ensure you label the axes appropriately.

library(gapminder)
library(dplyr)
library(ggplot2)
library(ggthemes)


## Exercise 2: Customizing themes
# Starting from the plot in Exercise 1, apply the theme_economist() from the ggthemes package. 
# Also, modify the plot to use theme() to change the legend position to the bottom.


## Exercise 3: Highlight specific years
# For the same set of countries as Exercise 1, create a scatter plot and color the points differently for years before and after 1980.
# Use scale_color_manual to customize the colors.


## Exercise 4: Adding text labels
# For the plot in Exercise 3, add text labels only for the years 1952 and 2007 next to the corresponding points.
# Use geom_text() and filter only the years you want to label.



## Exercise 5: Advanced customization and annotations
# Use your plot from Exercise 3 and add custom annotations for the highest and lowest life expectancy points for each country.
# Use geom_text() for annotations, and identify these points programmatically or manually.

# Find the highest and lowest life expectancy for Brazil and Argentina
highest_lowest <- gapminder %>%
  group_by(country) %>%
  summarize(Highest_LifeExp = max(lifeExp),
            Lowest_LifeExp = min(lifeExp))

