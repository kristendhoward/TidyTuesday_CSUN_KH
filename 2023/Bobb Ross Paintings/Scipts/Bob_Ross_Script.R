########################
# Kristen Howard
# Tidy Tuesday February 14, 2023
#Created on February 15th, 2023

##### packages ####
# devtools::install_github("frankiethull/BobRossColors")
devtools::install_github("tidyverse/tidyverse")
library(ggplot2)
library(dplyr)
library(tidyverse)
library(here)
library(tidytuesdayR)
library(BobRossColors)

##### Read Data ####
bob_ross <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-02-21/bob_ross.csv')
View(bob_ross)

write.csv(bob_ross,here::here("2023", "Bobb Ross Paintings", "Data","bob_ross.csv"))
#Save the data to the Data folder like so! It worked
glimpse(bob_ross)
head(bob_ross)

##### Data Analysis ####
bob_ross %>%
  ggplot(aes(x = `season`,
             y = `num_colors`)) +
  geom_point(size = 3) +
  scale_color_bob_ross(painting = c("peaceful_valley","a_walk_in_the_woods"), type = "qualitative")
  labs( x = "Season", y = "Number of Colors", Title = "Number of Colors Used Through Out Seasons")


  install.packages("scales")
