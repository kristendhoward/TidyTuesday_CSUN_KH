###########
# Kristen Howard
# TidyTuesday
# Programming Languages

# Load Packages
library(here)
library(tidyverse)
library(dplyr)
library(tidytuesdayR)
library(ggplot2)
library(lubridate)
library(crosstable)

# Load Data
view(languages)
glimpse(languages)
write_csv(languages, 
          file = here::here("2023","Programming Languages","Data","programminglang.csv")) # Save CV in data folder

languages <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-03-21/languages.csv')

# Explore Data
# Lets look at the how languages have appeared over time and try to make an interactive map. 
# Let's find the programs that have the highest number of job openings for programmers in this language

summary(languages$number_of_jobs) # Let's see the highest number of jobs available
 # According to this graph, HTTP has the highets number of job openings available. 

lang2 <- languages %>% 
          select(title, number_of_jobs) %>% # Select columns of interest
          filter(number_of_jobs > 50000) # Use this to get a manageble number to represent on graph
view(lang2)

# Plot Data
# This plot is showing which programming languages have the highest
# number of job openings. 
lang2 %>% #selected filtered data set.
  ggplot( aes(x = number_of_jobs, # select x and y value
             y = title,
             fill = title)) +
  geom_bar(stat = "identity")  +#Use this function to create a barplot
  coord_flip() +
  labs(title = 'Programming Languages and Number of Job Openings', # Rename title, x and y axis
       x = 'Number of Available Jobs',
       y = 'Programing Language') + 
  theme_classic() +
  theme(legend.position = "none")   
ggsave(here("2023","Programming Languages","Output","jobopenings.png"), width = 7, height = 4)
# remember to use ggsave
