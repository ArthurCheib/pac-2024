library(tidyverse)
getwd()
folder_path <- "C:/Users/alece/OneDrive/Documents/PAC/Data Workshop 1"
setwd(folder_path)
income <- read_csv("income.csv", skip = 4, col_names = TRUE)
poverty <- read_csv("poverty.csv")
glimpse(income)
poverty_longer <- poverty %>%
  pivot_longer(cols=c(yr_1960:yr_2023), names_to= "Year", values_to="measurement")
glimpse(poverty)
glimpse(poverty_longer)
poverty_longer <- poverty_longer %>%
  mutate(Year = str_remove(Year, "yr_"))
glimpse(poverty_longer)
poverty_longer <- poverty_longer %>% 
  select(-"Indicator Name")
poverty_longer <- poverty_longer %>% 
  mutate(Year = as.numeric(Year))
glimpse(poverty_longer)
glimpse(income)
  income <- income %>% mutate(`Country Code` = str_remove(`Country Code`, "ISO_"))
  income <- income %>% select(-"...68")
income_longer <- income %>% pivot_longer(cols=c(`1960`:`2023`), names_to = "Year", values_to= "measurement")
income_longer <- income_longer %>% select(-"Indicator Name")
income_longer <- income_longer %>% mutate(Year = as.numeric(Year))
glimpse(income_longer)
write.csv(income_longer, "income_clean.csv")
write.csv(poverty_longer, "poverty_clean.csv")
