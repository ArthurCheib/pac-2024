folder_path = "/Users/faelmassa/Desktop/Project Drac de Fusta/Harris PAC - AvrMai24/Policy Analytics Credential - UChicago Harris/Lectures/Week 3 - L10 - L14/Workshop 2/"
setwd(folder_path)
getwd()
library(tidyverse)
slums <- read.csv("1-wb-slum_population.csv")
ruralpop <- read_csv("2-wb-rural_population.csv",skip = 4)
glimpse(ruralpop)
colnames(ruralpop)

ruralpop <- ruralpop%>%
  pivot_longer(cols = "1960":"2023",
               names_to = "Year",
               values_to = "Rural Pop (%)")
ruralpop<-ruralpop[ ,-4]
ruralpop_3<-ruralpop%>%
  mutate(`Country Code`= str_sub(`Country Code`,5,7))
ruralpop_final <- ruralpop_3%>%
  select(`Country Code`,`Indicator Code`,Year,`Rural Pop (%)`)
ruralpop_final <- ruralpop_final%>%
  mutate(Year = as.numeric(Year))



