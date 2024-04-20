### PAC 2024
## Mini-lecture 1 - Part 2


## Third task: clean the data 
# pivot_longer
# pivot_wider

## Pivoting the dataset
pop_data_longer <- pop_data |> 
  pivot_longer(-country, names_to = 'year', values_to = 'population')

## Cleaning the year column
# Remove the 'yr_' character from the column
pop_data_longer_final <- pop_data_longer |> 
  mutate(year = as.numeric(str_remove(string = year, pattern = 'yr_')))


