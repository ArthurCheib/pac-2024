# Lecture 14: Data Visualization - ggplot2
# Answers
# Author: Arthur Cheib
# Policy Analytics Credential
# ---

## Exercise 1: Plot with faceting
# Use ggplot2 to create a scatter plot showing the life expectancy over the years for two countries of your choice, using facet_wrap to separate them into two panels.
# Use the gapminder dataset, and ensure you label the axes appropriately.

library(gapminder)
library(ggplot2)
library(ggthemes)

gapminder_selected <- gapminder %>%
  filter(country %in% c("Brazil", "Argentina"))

ggplot(gapminder_selected, aes(x = year, y = lifeExp)) +
  geom_point() +
  facet_wrap(~country) +
  labs(title = "Life Expectancy Over the Years in Brazil and Argentina",
       x = "Year",
       y = "Life Expectancy")

## Exercise 2: Customizing themes
# Starting from the plot in Exercise 1, apply the theme_economist() from the ggthemes package. 
# Also, modify the plot to use theme() to change the legend position to the bottom.

ggplot(gapminder_selected, aes(x = year, y = lifeExp)) +
  geom_point() +
  facet_wrap(~country) +
  labs(title = "Life Expectancy Over the Years in Brazil and Argentina",
       x = "Year",
       y = "Life Expectancy") +
  theme_economist() +
  theme(legend.position = "bottom")

## Exercise 3: Highlight specific years
# For the same set of countries as Exercise 1, create a scatter plot and color the points differently for years before and after 1980.
# Use scale_color_manual to customize the colors.

ggplot(gapminder_selected, aes(x = year, y = lifeExp, color = year > 1980)) +
  geom_point() +
  facet_wrap(~country) +
  scale_color_manual(values = c("FALSE" = "blue", "TRUE" = "red")) +
  labs(title = "Life Expectancy Before and After 1980 in Brazil and Argentina",
       x = "Year",
       y = "Life Expectancy")

## Exercise 4: Adding text labels
# For the plot in Exercise 3, add text labels only for the years 1952 and 2007 next to the corresponding points.
# Use geom_text() and filter only the years you want to label.

ggplot(gapminder_selected, aes(x = year, y = lifeExp, color = year > 1980)) +
  geom_point() +
  geom_text(data = gapminder_selected %>% filter(year %in% c(1952, 2007)), 
            aes(label = year), nudge_y = 1) +
  facet_wrap(~country) +
  scale_color_manual(values = c("FALSE" = "blue", "TRUE" = "red")) +
  labs(title = "Highlighted Years: 1952 & 2007 in Brazil and Argentina",
       x = "Year",
       y = "Life Expectancy")

## Exercise 5: Advanced customization and annotations
# Use your plot from Exercise 3 and add custom annotations for the highest and lowest life expectancy points for each country.
# Use geom_text() for annotations, and identify these points programmatically or manually.

# Find the highest and lowest life expectancy for Brazil and Argentina
highest_lowest <- gapminder_selected %>%
  group_by(country) %>%
  summarize(Highest_LifeExp = max(lifeExp),
            Lowest_LifeExp = min(lifeExp))

# Base plot from Exercise 3
base_plot <- ggplot(gapminder_selected, aes(x = year, y = lifeExp, color = year > 1980)) +
  geom_point() +
  facet_wrap(~country) +
  scale_color_manual(values = c("FALSE" = "blue", "TRUE" = "red"))

# Adding annotations for highest and lowest life expectancy
base_plot +
  geom_text(data = highest_lowest, aes(x = 2000, y = Highest_LifeExp, label = paste("Highest:", Highest_LifeExp)), color = "green") +
  geom_text(data = highest_lowest, aes(x = 2000, y = Lowest_LifeExp, label = paste("Lowest:", Lowest_LifeExp)), color = "red") +
  labs(title = "Life Expectancy with Annotations in Brazil and Argentina",
       x = "Year",
       y = "Life Expectancy")
