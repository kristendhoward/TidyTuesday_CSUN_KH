# Introduction
# Observing data regarding the development of European drugs

# Load in package
library(tidytuesdayR)
library(tidyverse)
library(ggplot2)
library(here)
library(tidyverse)
library(gtable)
library(gt)

# Load in data
drugs <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-03-14/drugs.csv')
view(drugs)
write_csv(drugs, 
          file = here::here("2023","European Drug Development","Data","drugs.csv")) # Save CV in data folder

# Observe Data
glimpse(drugs) #Interested in authorization statuses

# I tried to complete a much complicated graph but it did not work out. I decided
# to explore the gt package and create a table with the total number of drugs and the
# corressponding authorization status. Based on the data, a good portion of the european
# drugs are authorized and are not frequently refused. However, the number of withdrown authorization
# statuses seems to be particular high. 

s <- drugs %>%
  group_by(authorisation_status) %>% # Group by the variable of interest
  tally() %>% # Use this function to get a total number of drugs in each category
  rename('Authorization Status' = authorisation_status, # Rename the columns to make it tidy and presentable
         'Total Number of Drugs' = n)

view(s) # This is looking good, there is only one drug with an NA for a authorization status. 

# Let's investigate this outlier and practice subsetting skills. I thought the code below
# would work and it did not. According to s, there is a drug with NA
NA_drug <- drugs %>%
           select(authorisation_status, medicine_name) %>%
           filter(is.na(authorisation_status)) # Use the is.na function to find an NA value.
view(NA_drug) # Aplidin is the drug with the NA

s%>% 
  gt() %>% # use gt package for table function. Similar to kable
  tab_header(title = 'Authorization Status of European Drugs') %>% # Select title
  tab_style(style = list(cell_fill(color = '#FFC395'), # Use this function to choose color and text options
                          cell_text(weight = 'bold')),
                           locations = cells_body(columns = 'Authorization Status'))%>%
   tab_style(style = list(cell_fill(color = '#ffefb5'), # Same as above
                          cell_text(weight = NULL)), 
                          locations = cells_body(columns = 'Total Number of Drugs'))
gtsave(file.path("2023", "European Drug Development", "Output", "drugs.png"))

             
