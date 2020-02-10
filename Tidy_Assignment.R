# Tidy_Assignment
# Intro R Workshop: Data Manipulation, Analyses and Visualisation - focusing on tidy data principles
# Lanah Murray
# 10 February 2020

## Section 1

# Loading tidyverse package
library(tidyverse)

# Loading BOD dataset
BOD <- datasets::BOD # Assigning a name to the BOD dataset to save in the environment

# Examining the built-in dataset BOD.The following is TRUE: 
# C. BOD is tidy: each row is an observation with two values (time and demand) 

# Loading the following datasets to determine which is TIDY:

BJsales <- datasets::BJsales # untidy

Eustock <- datasets::EuStockMarkets # TIDY

Dnase <- datasets::DNase # TIDY

Fdehyde <- datasets::Formaldehyde # TIDY

orange <- datasets::Orange #TIDY

UCBA <- datasets::UCBAdmissions # untidy

## Section 2

# Loading packages
library(dplyr) 
library(dslabs)

# Loading dataset
data("murders")

# Exploring the dataframe
head(murders) # Showing the first 6 rows of the dataframe
tail(murders) # Showing the last 6 rows of the dataframe
glimpse(murders) # Showing data by listing variables (columns) in dataframe by name and gives overall information about dataframe
names(murders) # Showing only the names of the variables (columns) in the dataframe

# Paragraph describing the murder dataset #
# The dataset consists of 5 variables with a total of 51 observations. The name of the state is indicated as well as the corresponding population size of that state.
#The abbreviations for each state is also given as well as in which region the state is located. These are all states present within the US and the dataframe is depicting the 
# total number of gun murders within the US,by state. The dataset is a tidy dataset because it meets the criteria for a tidy dataset,namely:
# each variable has it's own column, each observation has it's own row and each value has it's own cell.

# Adding columns using the mutate function within the dlyr package
murders <- mutate(murders, population_in_millions = population / 10^6) # Assigning a name to the 'mutated' dataframe,telling R which dataset to use and specifying the name and notation of the new column

# Selecting only specific columns
murders %>% # Telling R which dataset to use
  select(state, population) # Using select function to only show the state and the population 

# Removing only a specific row
murders %>% # Telling R which dataset to use
  filter(state != "Florida") # Using the filter function to remove Florida from the dataset in conjunction with the operator != from the dplyr package

# Creating a new dataframe without states occurring in the South Region
no_south <- murders %>% # Assigning a name to the dataset that ommits the states occurring in the South region and telling R which dataframe to use
  filter(region!= "South") # Using the filter function in conjunction with the 'is not equal' operator to remove South states from dataset
  
# Creating a new data frame only showing the data for New York and Texas 
NY_TX <- c("Texas", "New York") # Creating a vector containing the 2 states I wish to filter
NY_TX <- murders %>% # Assigning a name and telling R which dataset to use
  filter(state %in% NY_TX) # Using the filter function to filter the states according to the vector I have created

# Calculating the population size of the South region
south_pop <- murders %>% # Assigning a name so it can be viewed in environment. Telling R which dataset to use
  filter(region == "South") %>% # Using filter function to isolate the South region data
  summarise(south_pop = sum(population)) # Using summarise function to calculate the population size (sum) of the South region

# Calculating the population size of the West region
west_pop <- murders %>% # Assigning a name so it can be viewed in environment. Telling R which dataset to use
  filter(region == "West") %>% # Using filter function to isolate the West region data
  summarise(west_pop = sum(population)) # Using summarise function to calculate the population size (sum) of the West region

# Creating a new dataframe containing only the population size of the Northeast region
NE_pop <- murders %>% # Assigning a name so newdataframe can saved in environment and telling R which dataframe to use
  select(region, population) %>% # Using the select function so R can choose to 2 specific variables
  filter(region == "Northeast") %>% # Using filter function to isolate the Northeastern data
  summarise(NE_pop = sum(population)) # Getitng the ppulation size of the Northeastern region only

# Creating two plots and explaining visible trends
# Loading package
library(ggpubr)
library(ggplot2)

# Creating a point graph showing the total murders in relation to the population size of each region
plot1<- ggplot(data = murders, aes(x = population_in_millions, y = total, colour = region)) +
  geom_point(size = 5) +
  labs(x = "Population size (Millions)", y = "Total gun murders")
# Plot 1 shows the data of the total number of murders in each region in proportion to it's population size (in millons)
# Each colour represents a region and as the population size increases, so does the total number of gun murders. The south region shows
# a continuous increase in gun murders because of it's large population size...we can therefore deduce that the more individuals there are
# in a specified area, the higher the likelihood of the occurrence of gun murders.

# Creating a histogram showing the population sizes of the different regions in millions
plot2 <- ggplot(data = murders, aes(x = population_in_millions)) + # Assigninga name to the plot,telling R which dataset to use and specifying the x axis
  geom_histogram(aes(fill = region), position = "dodge", binwidth = 25) + # Specifying what type of graph and telling R which position and bin width to use
  labs(x = "Population size (in millions)", y = "Count") # Assigning labels to the axis
# Comparing the South and West population sizes
# The population size of the South is considerable larger than that of the West. The difference in size is exactly 43 728 881. The South therefore
# has a higher occurrence of gun murders than that of the West.

# Creating a new data frame where the total>20 but <100 and to exclude the value 120 
regions <- c("South", "West", "Northeast", "North Central") # Creating a new vector containing all the states
mur_excluding <- murders %>%  # Assigning a name to the new dataframe and telling R which file to use
  filter(region %in% regions, total > 20, total < 100) # Filtering the data that has total murder numbers greater than 20 but less than 100

# Creating an object that contains from 10th to 24th row and 26th row
murders %>% # Telling R which dataset to use
  slice(10:24, c(26)) # Using the slice function to select only rows 10-24 and in addition row 26 as well

# Converting the murders data table into a tibble
murders_tibble <- as_tibble(murders) # Assigning a name to save it into the environment and specifying which dataset to convert into a tibble

#Use the group_by function to convert murders into a tibble that is grouped by region. 
murders_tibble_grp <- murders_tibble %>% # Assigning a name and telling R which dataset to use
  group_by(region) # Using function group to group by the region
## Not entirely sure what this code is supposed to show me but i've given it a go regardless

#Write tidyverse code that is equivalent to this code: 
murders_tibble_2 <- as.tibble(murders) # Assigning a name to this tidyverse equivalent (as.tibble)


## Section 3

# Loading packages
library(dplyr) 
library(dslabs) 

# Loading the dataset
data("heights")

# Exploring the heights dataset
head(heights) # Showing the first 6 rows of the dataframe
tail(heights) # Showing the last 6 rows of the dataframe
glimpse(heights) # Showing data by listing variables (columns) in dataframe by name and gives overall information about dataframe
names(heights) # Showing only the names of the variables (columns) in the dataframe

# Paragraph describing the heights dataset #
# The dataset consists of 2 variables with a total of 1050 observations. The two variables are the heights of males and females.
# The heights of the 2 sexes were self-reported and is measured in inches. The data set is tidy because it meets the 3 requirements for tidy data,namely:
# every variable is in it's own column,each observation is in it's own row and each value is in it's own cell.

# Calculating the mean,std deviation,median,minimum and maximum values for males and females

Female_stats <- heights %>% # Assigning a name to the new dataset and telling R which dataframe to use
  filter(sex == "Female") %>% # Using the filter function to select only the female data
  summarise(fm_mean = mean(height), # Using the summarise function to calculate the mean height
            fm_sd = sd(height), # Calculating the standard deviation of the heights
            fm_med = median(height), # Calculating the median height
            fm_min = min(height), # Calculating the minimum height
            fm_max = max(height)) # Calculating the maximum height
  
Male_stats <- heights %>% # Assigning a name to the new dataset and telling R which dataframe to use
  filter(sex == "Male") %>% # Using the filter function to select only the male data
  summarise(male_mean = mean(height), # Using the summarise function to calculate the mean height
            male_sd = sd(height), # Calculating the standard deviation of the heights
            male_med = median(height), # Calculating the median height
            male_min = min(height), # Calculating the minimum height
            male_max = max(height)) # Calculating the maximum height
  
## Section 4

# Creating 2 vectors
x <-  c( 1, 6, 21, 19 , NA, 73,NA)
y <-  c(NA, NA, 3, NA, 13, 24, NA)

# a) Counting the number of elements missing in both x and y 
sum(is.na(x)) # Calculating the number of missing elements (NA) in vector x
sum(is.na(y)) # Calculating the number of missing elements (NA) in vector y

# b)  Transforming the code used in (a), into a function 
sum_function <- function(sf){sum(is.na(sf))} # Assigning a name to the new function and instructing R to create the function according to that used in (a)

# c)  Creating three new vectors
a <- c(6, 33, NA, NA, 6, 1)
b <- c(NA, 5, 8, 36, 0, 22)
c <- c(9, NA, NA, 5, NA, 0)

# Testing the function created in (b) 
sum_function(a)
sum_function(b)
sum_function(c)

## Section 5

Seasonal_data <- data.frame(year = c(2015, 2016, 2017, 2018), # Assigning a name to the dataframe being created
                            winter = c(41, 39, 47, 40), 
                            spring = c(41, 46, 57, 45), 
                            summer = c(75, 52, 85, 66),
                            Autumn = c(57, 66, 52, 56))
# Hypothesis
# The data above represents the average temperatures recorded each year for every season in degrees Fahrenheit. I predict that this is a location with a continental climate because of the range of temperatures recorded.

# Preparing data for plotting
gathered <- Seasonal_data %>%  # Assigning a name and telling R which dataset to use
  gather("winter", "spring", "summer", "Autumn", key = winter, value = "temps") %>%  # Using the gather function to put all the observations of the same variable into one column
  rename(season = winter) # Renaming the gathered column to suit the variables within it

# Plot showing the temperatures recorded seasonally for years 2015 to 2018
seasonal_plot <- ggplot(data = gathered, aes(x = year, y = temps, colour = season)) + # Assigning a name to the plot and telling R to use the ggplot function. Specifying the x and y axis as well as the legend key
  geom_point(shape = 10, colour = "white") + # Telling R to plot the points and assigning a shape and colour to the points
  geom_smooth(method = "auto") + # Specifying that the lines on the graph should be the auto option
  theme_dark() + # Assigning the dark theme to create a grey background
  labs(x = "Year", y = "Temperature (Degrees Fahrenheit)") # Assigning labels to the axis


# Plot showing spring and autumn temperatures
AS <- c("Autumn", "spring") # Creating a vector with only autumn and spring data
Aut_spr <- gathered %>%  # Assigning a name and telling R which dataset to use
  filter(season %in% AS) # Using the filter function to take out only the data specified in the vector AS

Aut_spring_plot <- ggplot(data = Aut_spr, aes(x = year, y = temps, colour = season)) + # Assigning a name to the plot and telling R which dataset to use while also specifying the x and y axis as well as the legend key
  geom_point() + # Plotting the points on the graph
  geom_smooth() + # Setting the line style for the graph
  labs(x = "Year", y = "Temperature (Degrees Fahrenheit)") # Labelling the plot
# Discussion
# The seasonal_plot shows the varying average temperatures for each year with each line representing a season. The line showing the highest temperature represents the summer season and is represented in blue. However as seen in the year
# 2016, there is a drop in average temperatures in the summer season. The line showing the lowest and coldest temperatures would definitely be the purple line, representing the winter season. There is only a slight variation in temperatures compared
# to the other seasons where there are major variations in temperatures from one year to the next. The lowest temperature average is 40 degrees Fahrenheit and the highest is 85 degrees Fahrenheit.
# The Aut_spring_plot clearly shows the differences in the autumn and spring months. Normally we would assume that the spring season is warmer than the autumn season but according to the data on this plot, autumn is considerably warmer than spring.
# Autumn's highest temperature is 66 degrees Fahrenheit whereas the highest for spring is only 55 degrees Fahrenheit. This is indeed a continental climate type that is displayed because the autumn seasons are warmer than the spring seasons. 
# This is one of the characteristics of a continental climate so therefore i can say that my hypothesis is accepted.

# Loading packages
library(tibble)
cats_data<- tibble(cats = c("A", "B", "C"), # Assigning a name to the dataset
                   position = c("1-2-3", "3-1-2", "2-3-1"), 
                   minutes = c(3, 3, 3), 
                   seconds = c(12, 44, 15)) 

# Seperating data
 cats_sep <- cats_data %>% # Assigning a name to the new dataframe and telling R which dataset to use
   separate(col = position, into = c("first_place", "second_place", "third_place"), sep = "-") # Using the seperate function to split the position column into 3 new columns


# Uniting data 
 cats_unite <- cats_sep %>% # Assigning a name for the adjusted dataframe and telling R which dataset to use
  unite(minutes, seconds, col = "total_time", sep = "m") # Using the unite function to put time and minutes into one column named total_time

## Section 6

# Loading the dataset
language_div <- load("data/language_diversity.rda")

# Spreading the data
spread <- language_diversity %>% # Assigning a name and telling R which dataset to use 
  spread(key = Measurement, value = Value) # Using the spread function to spread the column that contained more than one variable in it

# Loading dataset
acme <- read.csv("data/acme.csv")

# Seperating the data
sep <- acme %>% # Assigning a new name and telling R which dataset to use
  separate(col = month, into = c("month", "year"), sep = "/") # Using the separate function to split the month column into 2 columns of month and year

# Selecting the data
sel <- sep %>%  # Assigning a name and telling R which dataset to use 
  select(month:acme) # Using the select function to isolate the columns month to acme and to exclude the column X that was in the "sep" dataframe

# Creating a new dataframe
new <- c("86", "90") # Creating a vector including only the years '86 and '90

new_frame <- sel %>% # Assigning a new name and telling R which dataset to use
  filter(year %in% new) # Using the filter function to create a new dataframe containg only data for the years '86 and '90

# Joining the 2 dataframes back together to complete dataframe "new_frame"
joined <- left_join(sel, new_frame, by = c("month", "year", "market", "acme")) # Assigning a new name and using the left_join function to combine the two dataframes (sel and new_frame) so that new_frame's data can be completed with all the years in the sel dataset


# Using murders dataset to illustrate group_by function
grouped <- murders %>%  # Assigning a name and telling R which dataset to use
  group_by(round(population_in_millions)) # Grouping by the population in millions so it is rounded off to the nearest decimal

# Arranging the murder data
arranged <- murders %>%  # Assigning a name and telling R which dataset to use
  arrange(desc(total)) # Arranging the data in order from highest to lowest murder totals

# Illustrating the mutate function witht the murders data
mutated <- murders %>% # Assigning a name and telling R which dataset to use
  mutate(pop_after_deaths = population - total) # Naming the new column and instructing R what to put into the new column

# Illustrating gather function using the seasonal data
seasonal_gather <- Seasonal_data %>%  # Assigning a name and telling R which dataset to use
  gather("winter", "spring", "summer", "Autumn", key = "winter", value = "temps") # Gathering the variable spread across different columns into one row as one variable






