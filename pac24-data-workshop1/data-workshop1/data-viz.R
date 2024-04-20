### Data Visualization
library(ggplot2)
library(tidyverse)
library(readxl)

## Reading datasets

# ISO table
country_iso <- read_xlsx("country-iso-continent.xlsx") |> 
  select(-c(2,4,6))
  
# Final table
final_table <- read_csv("data_workshop1_merged.csv") |> 
  select(-c(2,5,9,11,13,15)) |>
  rename('iso_country' = 'country') |> 
  left_join(country_iso, by = c('iso_country')) |> 
  select(12,1,11,2, everything())


## Questions we would like to explore

## (1) Creating a plot to visualize the evolution of slum populations over time

## Element 1 of a Graph: the dataset
# Computing the average slum population per continent and year
average_slum_pop <- final_table %>%
  filter(!is.na(slum_pop) & !is.na(country)) |> 
  group_by(continent, year) %>%
  summarise(avg_slum_pop = mean(slum_pop, na.rm = TRUE))

# Getting the number per country
avg_slum_pop_continent <- final_table %>%
  group_by(continent) %>%
  summarise(avg_slum_pop = mean(slum_pop, na.rm = TRUE)) %>%
  ungroup() |> 
  filter(!continent %in% c('Oceania', NA))

# Joining the average back to the original data
plot1_data <- final_table %>%
  select(country, year, slum_pop, continent) |> 
  filter(!is.na(slum_pop) & !is.na(country)) |> 
  left_join(average_slum_pop, by = c("continent", "year")) %>%
  mutate(color = ifelse(slum_pop >= avg_slum_pop, "grey", "red"))

## Elements 2 and 3 of a Graph: the aesthetics + the geometry
plot1_data |> 
  filter(continent != 'Oceania') |> 
  ggplot(aes(x = year, y = slum_pop, color = color, group = country)) +
  geom_line() +
  geom_point() +
  theme_light() +
  facet_wrap(~ continent) +
  scale_color_manual(values = c("grey", "red")) +
  labs(title = 'Evolution of Slum Population (%) over time by Continent',
       caption = 'Source: The World Bank',
       y = 'Population living in Slums (%)',
       x = '') +
  theme(legend.position = "none") +
  scale_x_continuous(breaks = seq(2000, 2020, 2)) +
  geom_text(data = avg_slum_pop_continent,
            aes(x = 2020, y = 90, label = paste0("Avg slum pop.: ", round(avg_slum_pop, 2), "%")),
            inherit.aes = FALSE,
            hjust = "right", vjust = 0, size = 3.5, color = "blue")



## (2) What countries are more likely to have a higher expenditure on Education (richer countries?)

## Element 1 of a Graph: the dataset
# Calculate the world average government expenditure on education
world_avg_exp <- final_table %>%
  summarise(avg_gov_exp = mean(gov_exp, na.rm = TRUE))

# Create a new column in final_table to indicate whether expenditure is above or below the world average
final_table <- final_table %>%
  mutate(color = ifelse(gov_exp >= world_avg_exp$avg_gov_exp, "country", "red"))

## Elements 2 and 3 of a Graph: the aesthetics + the geometry
final_table %>%
  select(country, continent, year, total_gdp, gov_exp, color) %>%
  filter(!is.na(total_gdp) & !is.na(gov_exp) & !is.na(country)) %>%
  filter(continent != 'Oceania') %>%
  filter(year == 2005) |> 
  ggplot(aes(x = log(total_gdp), y = gov_exp, color = color)) +
  geom_point() +
  scale_color_manual(values = c("country" = "grey", "red" = "red")) +
  facet_wrap(~ continent + year, scales = "free_x") +
  geom_smooth(method = 'lm', se = F, color = 'lightblue') +
  theme_minimal() +
  labs(title = 'Relationship of Income and Gov. Expenditure in Education',
       subtitle = 'Countries colored read are below the world average: 14.6%',
       caption = 'Source: The World Bank',
       y = 'Government Expenditure (%)',
       x = 'Log of Total GDP') +
  theme(legend.position = "none")

