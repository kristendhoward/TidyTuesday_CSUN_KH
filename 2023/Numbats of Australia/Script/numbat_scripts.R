##############################
# Kristen Howard
# Numbats of Australia
# Tidy Tuesday February 28, 2023
#Created on February 27th, 2023
###############################

#### Packages ####
library(tidytuesdayR)
library(tidyverse)
library(ggplot2)
library(ggmap)
library(leaflet)
library(sf)
library(viridis)
library(dplyr)
library(maps)
library(coord_map)

#### Read Data ####
numbat_data <- read_csv(here("2023/Numbats of Australia/Data/numbats.csv"))
glimpse(numbat_data) #Take a look at the columns
View(numbat_data) #obserse the data and data types
head(numbat_data)
#### Graph ####

### Graph 1 ###
#This graph needs help but I have spent 2 hours on this. Its time to end this. :()
qmplot(decimalLongitude, decimalLatitude, #choose your columns
       data = numbat_data, maptype = "toner-background", #select data and map type
       color = scientificName, zoom = 7) #We are interested in the distribution of spp
      
#This graph is nice

# ### This does not work
# bat <- leaflet(numbat_data) %>%
#   addTiles() %>%  # Add default OpenStreetMap map tiles
#   addMarkers("-37.65000","145.5333"), popup="Bat"))
# bat  # Print the map
# 
# ### Graph 2 ####
# bat %>%
#   st_as_sf(coords = c("decimalLatitude", "decimalLongitude"), crs = 805, agr = "constant")
# leaflet() %>%
#   addProviderTiles(providers$Esri.WorldGrayCanvas) %>%
#   addCircles(data = bat2, weight = 0)
# 
# ### Graph 3 ###
# Australia <- map_data("world") %>% filter(region=="Australia")
# data <- world.cities %>%
#   filter(country.etc=="Australia")
# 
# ggplot() +
#   geom_polygon(data = numbat_data, aes(x= "decimalLongitude", y = "decimalLatitude", group = scientificName), fill="grey", alpha=0.3) +
#   geom_point( data=data, aes(x= "decimalLongitude", y = "decimalLatitude")) +
#   theme_void()  + coord_map()
# 
# ggplot() +
#   geom_polygon(data = numbat_data, aes(x="decimalLongitude", y = "decimalLatitude", group = 'scientificName'), fill="grey", alpha=0.3) +
#   geom_point( data=data, aes(x= 'decimalLongitude', y= 'decimalLatitude')) +
#   theme_void() + scale_y_continuous(c(-31,0)) + coord_map()
