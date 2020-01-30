# Exercise 8.5
# Creating DIY Figures on the ecklonia dataset
# 30 January 2020
# Lanah Murray

# Loading packages
library(tidyverse)
library(ggpubr)
library(scales)
library(ggsn)
library(maps)

# Load in the data
eck_data <- read_csv("data/ecklonia.csv")

# Creating a scatterplot for stipe mass and stipe length of ecklonia at 2 sites

scatter <- ggplot(data = eck_data, aes(x = stipe_mass, y = stipe_length)) + # Telling R that I want to use ggplot function and specifying which dataset I want to use
  geom_point(aes(colour = site)) +# Plotting the points and indicating which dots belong to each site
  labs(x = "Stipe mass", y = "Stipe length") + # Creating the labels for my axis
  theme_dark() + # Adding a theme making the background darker
  theme(legend.background = element_rect(colour = "grey28")) # Adding a theme that outlines the site box in dark grey
scatter  

# Creating a linear plot for the stipe diameter in relation to the stipe mass

linear <- ggplot(data = eck_data, aes(x = stipe_diameter, y = stipe_mass, colour = site)) + # Specifying that I am using ggplot and which dataset I am using
  geom_point(aes(colour = site)) + # Creating the points of the graph and placing the sites in a legend
  geom_smooth() + # Adding the smooth lines to show the patterns of the data 
  labs(x = "Stipe diameter", y = "Stipe mass") + # Adding the labels to my axis
  theme(legend.position = "bottom") # Changing the position of my legend
linear


# Creating a histogram of the epiphyte lengths compared to the stipe lengths

histo <- ggplot(data = eck_data, aes(x = epiphyte_length)) + # Specifying that I want to use ggplot function
  geom_histogram(aes(fill = site), position = "dodge", binwidth = 100) + # Indicating that I want a histogram with the data sorted by the site
  labs(x = "Epiphyte length", y = "Stipe length") # Labelling of my axis
histo

# Creating a line graph for the primary blade width and length

line <- ggplot(data = eck_data, aes(x = primary_blade_width, y = primary_blade_length, colour = as.factor(ID))) + # Specifying that I want to use the gglot function and the dataset I wish to use
  geom_point() + # Plotting of the poits on the graph
  geom_line(aes(group = species)) + # Adding the lines to the graph
  labs(x = "Primary blade width", y = "Primary blade length") + # Labelling my axis
  theme_pubr() # Adding a theme
line

# Creating a facet of my graphs

graph_facet <- ggarrange(linear, line, histo, scatter,  # Assigning a name to the facet image and indicating to use the facet function. Also instructing which graphs to use
          ncol = 2, nrow = 2, # Set number of rows and columns
          labels = c("A", "B", "C", "D"), # Label each figure
          common.legend = FALSE) # Allowed each graph to retain their individual legends
graph_facet

# Exercise: Cropping a particular section of the global map
# Creating a cropped version of a section off the global map
# 30 January 2020
# Lanah Murray

# Cropping a particular part of the global map

contnt_snip <- ggplot() + # Assigning a name to the figure and instructing R which function to use
  borders() + # Accessing the global shape file 
  coord_equal(xlim = c(40, 60), ylim = c(-30, -10)) # Setting latidudinal and longitudinal limits  for the snipping of the map
contnt_snip




