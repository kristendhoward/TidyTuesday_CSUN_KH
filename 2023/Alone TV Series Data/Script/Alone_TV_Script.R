######
# Introduction
# Created on March 9th, 2023
# Let's explore data from the Alone TV Series Package
######
### Load Packages
library(tidyverse)
library(alone) #This is the package we will be using today
library(ggplot2)
library(here)

### View data from alone package
view(survivalists)
glimpse(survivalists)

# Manipulate Data
s2 <- survivalists %>% #select df
        select(days_lasted,country,gender,season) %>% # select variables of interest
        filter(country == 'United States') # filter country, I am only interested in the U.S. Data
        
# Create Graph
ggplot(s2, aes(x = gender, # Select the new object and select x and y variables and color.
               y = days_lasted, 
               color = gender)) + 
  geom_boxplot() + # We will be usng a boxplot today
  facet_wrap(~season) + # We will facet wrap by season
  labs(title = "Survival in the Alone TV Series (U.S.)", #Create title and other important labels
      x = "",
      y = "Number of Days Survived") 
  ggsave(here("2023","Alone TV Series Data","Output","Alone.boxplot.png"), width = 5, height = 4)
