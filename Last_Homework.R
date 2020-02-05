# Homework Assignment
# Formulating a figure from the given General Bathymentric Chart of the Ocean (GEBCO) dataset
# Authors: Lanah Murray and Melissa Abrahams
# Date: 05 february 2020

# Loading the packages 
library(tidyverse)
library(ggpubr)

# Loading the data
load("data/gebco_sa.Rdata")


#r Renaming the data and tidying it up
bathy_wide1 <-  gather(bathy_wide, key = long, value = elevation, '7.99166666665':'39.97500006395') # Assigning a name to the "gathered" dataset and telling R which existing dataset we want to use

# Creating the initial map
ggplot(data = bathy_wide1,aes(x = long, y = lat)) + # Telling R to use the plotting function and which dataset to use. Allocating the lat and long values
  geom_raster(aes(fill = elevation)) + theme(legend.position = "none") # Using raster function which converts file into map form and taking away the legend 

# Converting the data frame to numeric values 
bath_wide <- as.data.frame(apply(bathy_wide1,2, as.numeric)) # Assigning a name


# Adding a colour palette and saving it into the environment
# coll1 <- c("#48B4B6","#449FA7","#418B98","#3D7887","#396575","#345363") # This was a trial and error step

# Creating the figure
ggplot(data = bath_wide, aes(x = long, y = lat)) + # Tell R to use plot function and specifying which dataset to use
  geom_raster(aes(fill = elevation))  + # Raster function used 
  scale_fill_gradientn("graph", values = scales::rescale(c(-6129,-1000,0,1,1000,3374)), colours = c("darkblue","turquoise3","darkseagreen1","grey10","darkolivegreen","burlywood3")) # Creating colour gradient for map

# Changing legend name
ggplot(data = bath_wide, aes(x = long, y = lat)) +
  geom_raster(aes(fill = elevation))  +
  scale_fill_gradientn("Elevation/Depth (m)", values = scales::rescale(c(-6129,-1000,0,1,1000,3374)), colours = c("darkblue","turquoise3","darkseagreen1","grey10","darkolivegreen","burlywood3")) # Adding the correct name of the legend

# Removing axis titles from our final figure
ggplot(data = bath_wide, aes(x = long, y = lat)) +
  geom_raster(aes(fill = elevation))  +
  scale_fill_gradientn("Elevation/Depth (m)", values = scales::rescale(c(-6129,-1000,0,1,1000,3374)), colours = c("darkblue","turquoise3","darkseagreen1","grey10","darkolivegreen","burlywood3")) +
  theme(axis.title = element_blank()) # This tells R to remove the axis labels

