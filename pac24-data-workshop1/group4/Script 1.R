library(gapminder)
library(tidyverse)

options(stringsAsFactors = FALSE)
options(scipen = 999999)

folder_path = "C:/Users/jhetzel/Desktop/PAC/Workshop 1"
setwd(folder_path)

gdp <- read.csv("7-wb-gdp_per_capita.csv"
gov_expenditure <- read.csv("8-wb-gov_expenditure_education.csv", skip = 3)

#Hint - argument in read.csv allows you to skip rows of data

#GDP dataset
cleangdp <- gdp %>%
  select(Country.Name, Country.Code, c(yr_1960 : yr_2005))

cleangdp <- cleangdp %>%
  pivot_longer(cols = c(yr_1960 : yr_2005),
               names_to = "years",
               values_to =  "total_gdp", 
               values_drop_na = TRUE)

#Gov Exp dataset 

new_names <- as.character(gov_expenditure[1, ])

gov_expenditure <- gov_expenditure[-1, ]

colnames(gov_expenditure) <- new_names

clean_gov_expenditure <- gov_expenditure %>%
  select('Country Code', c('1960' : '2006'))

clean_gov_expenditure <- clean_gov_expenditure %>%
  pivot_longer(cols = c('1960' : '2006'),
               names_to = "years",
               values_to =  "expenditure", 
               values_drop_na = TRUE)


