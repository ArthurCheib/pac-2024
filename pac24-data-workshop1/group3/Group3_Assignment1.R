# Group 3 R Script

library(tidyverse)

mortality <- read_csv("raw-datasets/5-wb-mortality_rate_under5.csv")
electricty <- read_csv("raw-datasets/6-wb-access_eletricity.csv", skip = 4)

mortality <- mortality %>% select(!country_name)

new_mortality <- mortality %>%
  pivot_longer(
    cols = yr_1960:yr_2023,
    names_to = "Year",
    values_to = "Mortality"
)

new_electricity <- electricty %>%
  pivot_longer(
    cols = `1960`:`2023`,
    names_to = "Year",
    values_to = "Percent"
  )

write_csv(new_mortality, "clean-datasets/clean_mortality.csv")
write_csv(new_electricity, "clean-datasets/clean_electricity.csv")
