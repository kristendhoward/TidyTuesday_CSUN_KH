# Introduction
# Observing data regarding the development of european drugs

# Load in package
library(tidytuesdayR)
library(tidyverse)
library(ggplot2)
library(here)
library(tidyverse)
library(viridis)
library(patchwork)
library(hrbrthemes)
library(igraph)
library(ggraph)
library(colormap)
# This tidy tuesday is inspired by another graph and its use of graphics in presenting data. Most of the credit
# should go to doehm on Github.


# Load in data
drugs <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-03-14/drugs.csv')
view(drugs)
write_csv(drugs, 
          file = here::here("2023","European Drug Development","Data","drugs.csv")) # Save CV in data folder

# Observe Data
glimpse(drugs)
Crosstable(drugs$medicine_name)

# Let's look at a list of drugs whose authorization has been withdrawn and additional
# monitonring is being done

#In the past 3 years, 3 drugs have been withdrawn with 3 different
# active substances.
lost.drugs <- drugs %>%
                filter(authorisation_status == "withdrawn",
                       additional_monitoring == "TRUE",
                       date_of_opinion>"2020-01-01")
view(lost.drugs)

# Now lets look at drugs that have been approved in the past 3 
# years
found.drugs <- drugs %>%
  filter(authorisation_status == "authorised",
         additional_monitoring == "TRUE",
         date_of_opinion>"2020-01-01")

view(found.drugs)

links=data.frame(
  source=c(lost.drugs$medicine_name),
  target=c(found.drugs$medicine_name))

mygraph <- graph_from_data_frame(links)

p2 <-  ggraph(mygraph, layout = "linear") + 
  geom_edge_arc(edge_colour="black", edge_alpha=0.2, edge_width=0.6, fold = TRUE) +
  geom_node_point( color="pink", size=2) +
  geom_node_text( aes(label=name), repel = FALSE, size=3, color="#69b356", nudge_y=-1.0, vjust = 1, angle = 65) +
  theme_void() +
  theme(
    legend.position="none",
    plot.margin=unit(c(0,0,0.4,0), "null"),
    panel.spacing=unit(c(0,0,3.4,0), "null")
  ) +
    expand_limits(x = c(-1.2, 1.2), y = c(-5.6, 1.2)) 
  ggave(here("European Drug Development","Output","Practice.Arc.Diagram.png"))
p2
