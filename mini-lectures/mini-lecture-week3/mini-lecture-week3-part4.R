### PAC 2024
## Mini-lecture 1 - Part 2


## Fourth task: joining the data

# Re-creating the gapminder dataset (one row = info per country per year)

pop_data_longer_final
country_data
gdp_life_data

## Pick one dataset as the main reference
# left_join ******
# right_join
# inner_join
# semi_join
# anti_join

gapminder <- gdp_life_data |> 
  left_join(pop_data_longer_final,
            by = c('country', 'year')) |> 
  left_join(country_data,
            by = 'country')
  
