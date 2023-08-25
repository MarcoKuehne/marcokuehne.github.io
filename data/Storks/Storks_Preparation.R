
# This script is for preparation of the stork data

library(readxl)
library(tidyverse)
library(countrycode)

# Stork Basis Data ---- 
storks <- readxl::read_xlsx("Storks.xlsx", sheet = 2)

# Wide to Long ---- 
storks <- storks %>% 
  pivot_longer(
    cols = 2:3, 
    names_to = "Year",
    values_to = "Storks"
  )

# Country Codes ---- 
storks$code <- countrycode(storks$Country, 
                           origin = 'country.name', 
                           destination = 'iso3c') 

storks$Year <- as.numeric(storks$Year)

# Area ---- 
country_area <- read.csv("https://raw.githubusercontent.com/bnokoro/Data-Science/master/countries%20of%20the%20world.csv")

country_area <- country_area %>% 
  select(Country, Area..sq..mi..) %>% 
  rename(Area = Area..sq..mi..) %>% 
  mutate(code = countrycode(country_area$Country, 
                            origin = 'country.name', 
                            destination = 'iso3c')) %>% 
  select(code, Area)

storks <-left_join(storks, country_area, by = "code")

# Population ---- 

#https://www.kaggle.com/datasets/themlphdstudent/countries-population-from-1955-to-2020?resource=download
#https://www.kaggle.com/code/themlphdstudent/country-wise-population-from-1955-to-2020

country_pop <- read.csv("Countries Population from 1995 to 2020.csv")

country_pop$code <- countrycode(country_pop$Country, 
                                origin = 'country.name', 
                                destination = 'iso3c') 

country_pop <- country_pop %>% filter(Year %in% c(1995, 2005)) %>% 
  select(code, Year, Population, Fertility.Rate,Urban.Population)

storks <-left_join(storks, country_pop, by = c("code", "Year"))

# storks %>%
#   filter(Year == 2005) %>%
#   ggplot(aes(x = Storks, y = Population)) +
#   geom_point() +
#   geom_smooth(method = "lm", se=FALSE) +
#   theme_minimal()

# Cleaning ----

storks_clean <- storks %>% 
  #filter(Year == 2005) %>% 
  mutate(Storks = Storks,
         Area = Area, 
         Population = round(Population/1000000, 2),
         Fertility = Fertility.Rate,
         UrbanPop = round(Urban.Population/1000000, 2)) %>% 
  select(-Fertility.Rate, -Urban.Population)

# Export ----

writexl::write_xlsx(storks_clean, "Storks_Clean.xlsx")

