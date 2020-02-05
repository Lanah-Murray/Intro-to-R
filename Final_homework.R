# Last homework assignment 
# Generating a figure with the given General Bathymentric Chart of the Ocean (GEBCO) adventurous dataset
# Lanah Murray and Melissa Abrahams
# 05 February 2020

# Loading packages
library(ggpubr)
library(tidyverse)
library(raster)
library(SDMTools)
library(rgdal)

# Reading in the asc file (adventurous data)
bathy1 <- read.asc("data/gebco_sa.asc") # Assigning a name to it

# Renaming and changing to raster file
bathy <- raster(bathy1)

# Convert raster file to dataframe
bathy.spdf <- as(bathy, "SpatialPixelsDataFrame") # Assigning a name to the dataframe
bathy.df <- as.data.frame(bathy.spdf) # Assigning a name to the final dataframe

# Creating initial plot

ggplot(data = bathy.df, aes(x = x, y = y)) + # Telling R to use the plotting function and which dataset to use. Allocating the lat and long values
  geom_raster(aes(fill = layer)) + theme(legend.position = "none") # Using raster function which converts file into map form and taking away the legend 


# Creating the plot

final_plot <- ggplot(data = bathy.df, aes(x = x, y = y)) + # Assigning a name to the plot and telling R which dataset to use. x and y values are allocated
  geom_raster(aes(fill = layer))  + # Using raster function which converts file into map form
  scale_fill_gradientn("Elevation/Depth (m)", values = scales::rescale(c(-6129,-1000,0,1,1000,3374)), colours = c("darkblue","turquoise3","darkseagreen1","grey10","darkolivegreen","burlywood3")) + # Assigning a name to our legend and creating a colour gradient for the map
  theme(axis.title = element_blank()) # This tells R to remove the axis labels









