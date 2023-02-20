##############################
# Kristen Howard
# Bobby Ross Paintings
# Tidy Tuesday February 14, 2023
#Created on February 15th, 2023
###############################
##### packages ####
# devtools::install_github("frankiethull/BobRossColors")
devtools::install_github("tidyverse/tidyverse")
library(ggplot2)
library(dplyr)
library(tidyverse)
library(here)
library(tidytuesdayR)
library(viridis)

##### Read Data ####
bob_ross <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-02-21/bob_ross.csv')
View(bob_ross)

write.csv(bob_ross,here::here("2023", "Bobb Ross Paintings", "Data","bob_ross.csv"))
#Save the data to the Data folder like so! It worked
glimpse(bob_ross) # Look into data
head(bob_ross)

##### Data Analysis ####
bob_ross %>%
  ggplot(aes(x = `season`,  #Label x and y
             y = `num_colors`)) +
  geom_point(size = 3) +
  scale_color_continuous(type = "viridis") + #choosing this color package
  labs( x = "Season", y = "Number of Colors") + #label axises
  ggtitle(wrapper(my_title, width = 70)) #Create title

my_title <- "Number of Colors Through Out the Seasons"
wrapper <- function(x, ...)  #This title is long so create a wrapper function
{paste(strwrap(x, ...), collapse = "\n")}

#Heat data Map
ggp <- ggplot(bob_ross, aes(season, num_colors)) +  #Set X and Y                   
  geom_tile(aes(fill = num_colors)) + scale_fill_continuous(type = "viridis") +
  ggtitle(wrapper(my_title, width = 70))
ggp

ggp_binned <- ggplot(bob_ross, aes(season, num_colors)) +  #Set X and Y                   
  geom_tile(aes(fill = num_colors)) + scale_fill_binned(type = "viridis") +
  ggtitle(wrapper(my_title, width = 70))
ggp_binned

ggp_binned <- ggplot(bob_ross, aes(season, num_colors)) +  #Set X and Y                   
  geom_tile(aes(fill = num_colors)) + scale_color_brewer(palette = "Oranges") +
  ggtitle(wrapper(my_title, width = 70))
ggp_binned

########################
#Trying to calculate mean
bob_ross_mean <- bob_ross %>%
                    group_by(num_colors,season) %>%
                    summarise(parameters_mean = mean(num_colors, .groups = 'drop'))

in graph
bob_ross %>%
  ggplot(aes(x = `season`,  #Label x and y
             y = `num_colors`)) +
  geom_hex(size = 3) + 
  scale_fill_continuous(type = "viridis") + #choosing this color package
  labs( x = "Season", y = "Number of Colors") + #label axises
  ggtitle(wrapper(my_title, width = 70)) #Create title


#Geom hex but a different gradient
bob_ross %>%
  ggplot(aes(x = `season`,  #Label x and y
             y = `num_colors`)) +
  geom_hex(size = 1) + 
  scale_fill_gradient(low = "green",high = "red") + #choosing this color package
  labs( x = "Season", y = "Number of Colors") + #label axises
  ggtitle(wrapper(my_title, width = 70)) #Create title

#Geom violin
bob_ross %>%
  ggplot(aes(x = `season`,  #Label x and y
             y = `num_colors`)) +
  geom_violin(size = 1) + 
  scale_fill_gradient(low = "green",high = "red") + #choosing this color package
  labs( x = "Season", y = "Number of Colors") + #label axises
  ggtitle(wrapper(my_title, width = 70)) #Create title

#geom line. . . this one is weird, looks like secret message
bob_ross %>%
  ggplot(aes(x = `season`,  #Label x and y
             y = `num_colors`)) +
  geom_line(size = 1) + 
  scale_fill_gradient(low = "green",high = "red") + #choosing this color package
  labs( x = "Season", y = "Number of Colors") + #label axises
  ggtitle(wrapper(my_title, width = 70)) #Create title


