# Summary stats
# 29 January 2020
# Lanah Murray
#################

# Loading function
library(tidyverse)

# Loading in the data

laminaria <- read_csv("data/laminaria.csv") # saying which folder and then what document it is

laminaria %>% # Choose the dataframe
  summarise(avg_bld_wdt = mean(blade_length)) # Calculate mean blade length,summarise is a function within the package,within summarise there are even more functions eg mean
# This is for all the sites collectively 

laminaria %>% # Tell R that we want to use the 'laminaria' dataframe
  group_by(site) %>%   # When asked how to get a value for a specific location
  summarise(avg_stp_ln = mean(total_length), # Create a summary of the mean of the total lengths
            sd_stp_ln = sd(total_length)) # Create a summary of the sd of the total lengths
# For summarise take note of the bracket usage as well as the comma use

laminaria %>%# Telling R that we want to use the laminaria dataset
  group_by(site) %>% 
  summarise(med_stp_ln = median(total_length), # Creating a summary of the mean of the total lengths
            var_stp_ln = var(total_length), 
            sd_stp_ln = sd(total_length))

# Plotting- ggplot function
# It sets a different frame of mind for R







ggplot(data = laminaria, aes(x = stipe_mass, y = stipe_length)) + # Write ggplot before doing ANY plotting! then specify dataframe saying which folder it is in. Then comma followed by aes. then add your axis...this is how it appears in your document columns and is the values for your graph. aes is a function therefore brakets
  geom_point(shape = 21, colour = "salmon", fill = "white") + # When adding stuff you use a + instead of a pipe or comma for the next line. geom point means we want a point graph and geom line means line graph, each shape is a number can be found on cheatsheets.
  labs(x = "Stipe mass (kg)", y = "Stipe length (cm)") # Making it presentable by using labs aka labels. it is a function therefore own brakets. inverted commas would mean its the actual words being used.

  
ggplot(data = laminaria, aes(x = stipe_mass, y = stipe_length)) + # Play around with this to see how to change appearance to see how it changes accordingly
  geom_point(colour = "salmon", fill = "white") +
  labs(x = "Stipe mass (kg)", y = "Stipe length (cm)")

  
# Plotting

ChickWeight <- datasets::ChickWeight # Chickweight is the name you assigned to it with the assignment operator. :: is not a function because there are no brackets,it is just a bit of built in code...the options that pops up is the different datasets within tidyverse
# This is the only way to read built in datasets and to save to environment please assign a name!

# Create a basic figure
ggplot(data = ChickWeight, aes(x = Time, y = weight)) + ## Inputting chick weight data# Check the way that it is written with capitals etc. use auto fill to make sure your data matches up with the name
  geom_point() + ## Creating a point graph(scatter)  # Can play around with this within brackets
  geom_line(aes(group = Chick)) ## Linking this with a line for each chicken # group function works the same as group by but here we are grouping by chick. 
  
  
ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) + # x and why match up with column names! we then want another column(diet) to appear in a different colour...this doesnt have to be done in this line
  geom_point() +
  geom_line(aes(group = Chick))  
  
  
ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_smooth(method = "lm") + theme_bw() # I want to create a linear model- shows you the line that has the best relationship,which diet has the strongest impact. 
 # Theme changes the actual colour an dlook of your graph background


ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point(aes(size = weight)) + # Aes function because size becomes a function because as the size increases, the size of the dot increases also.
  geom_smooth(method = "lm", size = 1.2)

# Chapter 7

# Load libraries
library(tidyverse)
library(ggpubr)

# Create faceted figure
ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_smooth(method = "lm") + # Note the `+` sign here
  facet_wrap(~Diet, ncol = 2) + # This is the line that creates the facets. ncol is the number of columns you want to display on the pane.
  labs(x = "Days", y = "Mass (g)")


ChickLast <- ChickWeight %>% # Pipe funfction because we are not plotting
  filter(Time == 21) # We just want the time column and only a certain time.== is specifying one site within the site column and only 1 value from there

 # Creating a line graph 

line_1 <- ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) + # Now we are assigning a name so it will be saved as a plot in environment
  geom_point() +
  geom_line(aes(group = Chick)) +
  labs(x = "Days", y = "Mass (g)")# highlight name of the graph and control+enter to view the plot in the pane because when R saves a plot it only shows it as numbers and shades and not the actual plot
line_1


# Creating a linear graph

lm_1 <- ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_smooth(method = "gam") +
  labs(x = "Days", y = "Mass (g)")
lm_1 # Before viewing your graph you first have to run it as an object. then when it is in your environment you can view it

# Creating a histogram

# Note that we are using 'ChickLast', not 'ChickWeight'
histogram_1 <- ggplot(data = ChickLast, aes(x = weight)) +
  geom_histogram(aes(fill = Diet), position = "dodge", binwidth = 100) +
  labs(x = "Final Mass (g)", y = "Count")
histogram_1

# Creating box plot

# Note that we are using 'ChickLast', not 'ChickWeight'
box_1 <- ggplot(data = ChickLast, aes(x = Diet, y = weight)) +
  geom_boxplot(aes(fill = Diet)) +
  labs(x = "Diet", y = "Final Mass (g)")
box_1

# Combining them all

ggarrange(line_1, lm_1, histogram_1, box_1, 
          ncol = 2, nrow = 2, # Set number of rows and columns
          labels = c("A", "B", "C", "D"), # Label each figure
          common.legend = TRUE) # Create common legend

# Exercise 6 (take 1)
# Creating various plots with the Lmainaria data set
# 29 January 2020
# Lanah Murray

# Loading packages
library(tidyverse)
library(ggpubr)

# Loading the laminaria dataset
laminaria <- read_csv("data/laminaria.csv") # I am trying to load the laminaria dataset but when i import it into my environment, it keeps showing up as a cluster of results even though i have changed the delimiter setting :(

# My idea was to use the laminaria dataset to plot various graphs but i cannot seem to figure out why it doesn't want to work properly

# Exercise 6 (take 2)
# Creating various plots with the built-in sleep dataset
# 29 January 2020
# Lanah Murray

# Loading packages
library(tidyverse)
library(ggpubr)

# Loading the sleep dataset 
Sleep_data <- datasets::sleep

# Creating a line graph describing the changes in Students sleeping time

ptient_slp <- ggplot(data = Sleep_data, aes(x = ID, y = extra, colour = group)) + # Assigning a name to the plot in order to save in environment
  geom_point(colour = 14, shape = 15) + # Indicating that the points of the graph are going to be pink(15) and the shape will be square(15)
  geom_line(aes(group = group)) + # So that the line connects with the associated group
  theme_gray() + # The background chosen is the gray colour
  labs(x = "Patient ID ", y = "Increase in time asleep (hours)") # This indicates what my axis labels are
ptient_slp

# Creating a faceted figure of the same data as above

slp_facet <- ggplot(data = Sleep_data, aes(x = ID, y = extra, colour = group)) + # Assigning a name and Instructing R to create a plot with the mentioned data points
  geom_point() +
  geom_line(aes(group = group)) + #
  facet_wrap(~group, ncol = 2) + # This is the line that creates the facets. ncol is the number of columns you want to display on the pane.
  labs(x = "Patient ID", y = "Increase in time asleep (hours)") + # These are the labels of my axis
  theme_bw()
slp_facet

# Excuse all the extra hashtag text that you see from the beginning. Those are my notes as we were going along in class and as you were explaining. 
# It helps me understand the work a little bit better so i hope it isn't a problem
