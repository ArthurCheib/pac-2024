## The goal of this script is to mess up the data so the students can have
## a harder time cleaning it up - for educational purposes

## Libraries
library(here)
library(tidyverse)

## Messing up dataset1
dataset1 <- read_csv(here('data-workshops', 'datasets', 'original', '1-wb-slum_population.csv'), skip = 3) |> 
  select(-69)
dt1_names <- names(dataset1)
year_cols <- as.character(1960:2023)
new_names <- if_else(dt1_names %in% year_cols, str_c('yr_', dt1_names), dt1_names)
names(dataset1) <- new_names


## Messing up dataset3
dataset3 <- read_csv(here('data-workshops', 'datasets', 'original', '3-wb-poverty_headcount_ratio.csv'), skip = 3) |> 
  select(-69)
dt1_names <- names(dataset3)
year_cols <- as.character(1960:2023)
new_names <- if_else(dt1_names %in% year_cols, str_c('yr_', dt1_names), dt1_names)
names(dataset3) <- new_names

## Messing up dataset5
dataset5 <- read_csv(here('data-workshops', 'datasets', 'original', '5-wb-mortality_rate_under5.csv'), skip = 3) |> 
  select(-69)
dt1_names <- names(dataset5)
year_cols <- as.character(1960:2023)
new_names <- if_else(dt1_names %in% year_cols, str_c('yr_', dt1_names), dt1_names)
names(dataset5) <- new_names

# Separate the country column name (break into two columns, one with the first name, the second with the rest)
dataset5 <- dataset5 %>% 
  separate(`Country Name`, into = c('country_name', 'country_name_extension'), sep = ' ', remove = FALSE) |> 
  select(-country_name_extension)

## Messing up dataset7
dataset7 <- read_csv(here('data-workshops', 'datasets', 'original', '7-wb-gdp_per_capita.csv'), skip = 3) |> 
  select(-69)
dt1_names <- names(dataset7)
year_cols <- as.character(1960:2023)
new_names <- if_else(dt1_names %in% year_cols, str_c('yr_', dt1_names), dt1_names)
names(dataset7) <- new_names

## Messing up dataset9
dataset9 <- read_csv(here('data-workshops', 'datasets', 'original', '9-wb-inflation_consumer_prices.csv'), skip = 3) |> 
  select(-69)
dt1_names <- names(dataset9)
year_cols <- as.character(1960:2023)
new_names <- if_else(dt1_names %in% year_cols, str_c('yr_', dt1_names), dt1_names)
names(dataset9) <- new_names


## Saving all the new datasets
write_csv(dataset1, here('data-workshops', 'datasets', 'modified', '1-wb-slum_population.csv'))
write_csv(dataset3, here('data-workshops', 'datasets', 'modified', '3-wb-poverty_headcount_ratio.csv'))
write_csv(dataset5, here('data-workshops', 'datasets', 'modified', '5-wb-mortality_rate_under5.csv'))
write_csv(dataset7, here('data-workshops', 'datasets', 'modified', '7-wb-gdp_per_capita.csv'))
write_csv(dataset9, here('data-workshops', 'datasets', 'modified', '9-wb-inflation_consumer_prices.csv'))

