# Exploring the ChickWeight dataset
# Lanah Murray
# 24 February 2020

# Loading packages

library(tidyverse)

# Loading dataset

chicks <- as_tibble(ChickWeight) # Loading the dataset as a table

# Viewing the dataset
head(chicks)# Viewing the first 6 rows of data
head(chicks, n = 10) # Viewing the first 10 rows of data
tail(chicks) # Viewing the last 6 rows of data
tail(chicks, n = 2) # Viewing only 2 of the last rows
colnames(chicks) # Col names. Showing variable names
summary(chicks) # showing the summary stats of each variable

glimpse(chicks) # Checking the structure of the dataframe and viewing the variables by name
dim(chicks) # Checking the dimensions of my dataset even though it is specified within the environment
class(chicks) # Viewing the class of the object (dataset)
length(chicks) # Viewing the number of variables in the dataframe
str(chicks) # Viewing the structure of the dataset including  the class of each variable


