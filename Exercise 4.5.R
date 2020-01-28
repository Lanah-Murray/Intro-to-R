# Exercise 4.5 
# Date: 28 January 2020
# Creating a new data frame for the laminaria dataset meeting the mentioned criteria
# Author: Lanah Murray

# Loading packages
library(tidyverse)


laminaria <- read_csv("data/laminaria.csv") 

Exercise_4_5_1<- laminaria %>% # Tell R which dataframe I am using
  select(site, total_length) %>%
  mutate(total_length_half = total_length/2) # Select only specific columns


Exercise_4_5_2 <- laminaria %>% 
  group_by(site) %>% # Grouping into mentioned dataset
  summarise(mean_bl = mean(blade_length), # Finding the mean for blade length
            min_bl = min(blade_length), # Finding the minimum blade length
            max_bl = max(blade_length),# Finding maximum blade length
             n_bl = n()) # Determining the number of observations

Exercise_4_5_3 <- laminaria %>%  # Tell R which dataframe I am using
  group_by(site,region,stipe_length) %>% #group dataframe by site only
  summarise(max_sm = max(stipe_mass, na.rm = TRUE)) # Summarising largest stipe mass excluding NA's
  

  
## Very neat
# Great discription along every line of code, keep this up!
# Overall mark for day 1: 8/10
