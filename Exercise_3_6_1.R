# Basic Statistics - 3.6.1 Exercise 1 
# Lanah Murray
# 24 February 2020

# Loading packages

library(tidyverse)

# Loading dataset

chicks <- as_tibble(ChickWeight) # Loading the dataset as a table and assigning a name to it


summary(chicks) # Viewing the summary statistics of the dataset so i can compare it to using the summarise function

chicks %>% # Telling R which dataset to use
  select(weight) %>%  # Using the select function to only select a specific variable(column)
  summarise(mean_wt = round(mean(weight, na.rm = TRUE), 2), # Using the summarise function to find the mean weight rounded to 2 decimal places
            med_wt = median(weight, na.rm = TRUE), # Finding the median weight
            min_wt = min(weight), # Finding the minimum weight value
            qrt1_wt = quantile(weight, p = 0.25), # Finding the 1st quartile and find points below which 25% of the data are distributed
            qrt3_wt = median(weight, p = 0.75), # Finding the 3st quartile and find points below which 75% of the data are distributed
            max_wt = max(weight)) # Finding the maximum weight value

              

            