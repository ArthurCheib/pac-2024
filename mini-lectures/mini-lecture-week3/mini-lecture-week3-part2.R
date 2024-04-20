### PAC 2024
## Mini-lecture 1 - Part 2

## First task: read the data
# .csv
# .xlsx
# .txt
# .dta
pop_data <- read_csv('population_data.csv')
country_data <- read_csv('country_data.csv')
gdp_life_data <- read_csv('gdp_life_data.csv')


## Second task: understand the data
summary(gdp_life_data)
#install.packages('skimr')
library(skimr)
skim(gdp_life_data)

