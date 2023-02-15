#######################################
# 
# Kristen Howard
# Tidy Tuesday February 14, 2023
#Created on February 15th, 2023
######################################
### Load Packages ###
library(tidyverse)
library(lubridate)
library(ggplot2)
library(here)
library(readr)
library(devtools)

git add
###Read Data ###
movies <- read_csv("2023/Hollywood Age Gaps/Data/movies.csv")
View(movies)

glimpse(movies)
head(movies)

### Data Analysis ###
#Created a 2D Histogram showing the frequency of particular age difference
#throughout the years

my_title <- "Frequency of Age Differences in Hollywood Through Out the Years"
wrapper <- function(x, ...)  #This title is long so create a wrapper function
{paste(strwrap(x, ...), collapse = "\n")}


movies %>%                             #Use the movies data set and assign the x and y values
  ggplot(aes(x = `Release Year`,
             y = `Age Difference`)) +
  geom_bin2d() +                      #This creates the 2d histogram we are using
  scale_fill_continuous(type = "viridis") + #Use this to fill continuous data. This is a common color package
  ggtitle(wrapper(my_title, width = 40)) + #We will use ggtitle. The large the width, the longer the title will be.
  theme_light() 

#Created a scatter plot showing the same information. This is not the best graph. The points are
#very mushed together and not clear. Look into ways to clear this up
movies %>%
  ggplot(aes(x = `Release Year`,
             y = `Age Difference`)) +
  geom_point(size=2, color = "lightpink") +
  labs( x = "Age Difference", y = "Release Year", Title = "Age Difference Over Several Years")


