# Intro R Workshop: Exercise 2
# Lanah Murray
# 13 March 2020

# Loading packages

library(tidyverse)
library(dplyr)
library(lubridate)

### 1. The SACTNmonthly_v4.0.RData----------------------------------------------------------------------------------------------------------

# Loading dataset
load("data/SACTNmonthly_v4.0.RData")

# Exploring the dataset

head(SACTNmonthly_v4.0) # looking at the first 6 rows of the dataset
tail(SACTNmonthly_v4.0) # looking at the last 6 rows of the dataset
glimpse(SACTNmonthly_v4.0) # checkin the structure and variables of the dataset
names(SACTNmonthly_v4.0) # Showing the names of the variables (columns) in the dataframe
dim(SACTNmonthly_v4.0) # Checking the dimensions of my dataset even though it is specified within the environment
class(SACTNmonthly_v4.0) # Viewing the class of the object (dataset)
length(SACTNmonthly_v4.0) # Viewing the number of variables in the dataframe
str(SACTNmonthly_v4.0) # Viewing the structure of the dataset including  the class of each variable


SACT <- SACTNmonthly_v4.0 %>%  # Specifying which dataset to use and assigning a name to it
  separate(col = date, c("Year", "Month", "Day"), sep = "-") %>% # Separating the date column into year,month and date 
  filter(src == "KZNSB") %>% # Selecting only the data for KZNSB in the source column
  group_by(site, Year) %>%  # Grouping by the site and year
  mutate(mean_temp = temp) %>%  # Creating a new column for the mean temperatures
  summarise(temp_mean = mean(temp, na.rm = TRUE)) # Calculating the mean temperatures

SACT$Year <- as.numeric(SACT$Year) # Making the year interpretable as numbers

KZNSB <- ggplot(SACT, aes(x = Year, y = temp_mean))+ # CReating a plot using the SACT dataset, specifying axis and assigning a name
  geom_line(aes(y = SACT$temp_mean), colour = "red")+ # Specifying it should be a line plot with the temp mean being on the y axis
  scale_x_continuous(breaks = seq(1980, 2000, 20)) + # Specifying x scale
  scale_y_continuous(breaks = c(20, 22, 24), labels = c("20", "22", "24"))+ # Specifying the y scale
  xlab("Year")+ # Axis label
  ylab("Temperature °C")+ # Axis label
  ggtitle("KZNSB: series of annual means") # Adding a title


KZNSB <- KZNSB + facet_wrap(nrow = 9, ncol = 5, .~site)# Creating a faceted image of the plots and specifying layout of facet

### 2. The data.laminaria.csv data--------------------------------------------------------------------------------------------

# Loading packages

library(tidyverse)
library(dplyr)
library(lubridate)
library(RColorBrewer)

# Loading dataset

read_csv("data/laminaria.csv")

# Exploring the dataset

head(laminaria) # looking at the first 6 rows of the dataset
tail(laminaria) # looking at the last 6 rows of the dataset
glimpse(laminaria) # checkin the structure and variables of the dataset
names(laminaria) # Showing the names of the variables (columns) in the dataframe
dim(laminaria) # Checking the dimensions of my dataset even though it is specified within the environment
class(laminaria) # Viewing the class of the object (dataset)
length(laminaria) # Viewing the number of variables in the dataframe
str(laminaria) # Viewing the structure of the dataset including  the class of each variable

LAM <- laminaria %>% # Specifying which dataset to use and assigning a name to it
  filter(region == "FB") %>%  
  group_by(site)


LAM1 <- laminaria %>% 
  filter(region == "FB") %>% 
  select(site, blade_length, blade_weight) 
  

False_Bay <- ggplot(LAM1, aes(x = blade_length, y = blade_weight, colour = site, group = 1))+
  geom_point()+
  geom_line()+
  scale_x_continuous(breaks = seq(100, 175, 25)) +
  scale_y_discrete(breaks = seq(0, 3, 1))+
  xlab("Blade length (cm)")+ # Axis label
  ylab("Blade mass (kg)")+ # Axis label
  ggtitle("A crazy graph of some data for False Bay sites")+
  scale_color_brewer(palette = "Accent")

# For some reason i just could not get the y scale to show 0-3

False_Bay <- False_Bay + facet_wrap(.~site)
False_Bay

### 3. The ToothGrowth data--------------------------------------------------------------------------------------------------------

# Loading the toothgrowth dataset

Toothgrowth <- datasets::ToothGrowth

# Exploring the dataset

head(ToothGrowth) # looking at the first 6 rows of the dataset
tail(ToothGrowth) # looking at the last 6 rows of the dataset
glimpse(ToothGrowth) # checkin the structure and variables of the dataset
names(toot) # Showing the names of the variables (columns) in the dataframe
dim(ToothGrowth) # Checking the dimensions of my dataset even though it is specified within the environment
class(ToothGrowth) # Viewing the class of the object (dataset)
length(ToothGrowth) # Viewing the number of variables in the dataframe
str(ToothGrowth) # Viewing the structure of the dataset including  the class of each variable


mean_SD <- ToothGrowth%>% # Assigning  name and telling R which dataset to use
  group_by(supp, dose) %>% # Grouping by supplements and dosage
  summarise(mn.ln = mean(len),# Calculating the mean and standard deviation
            sd.ln = sd(len))


Toothgrowth<- ggplot(mean_SD, aes(x = dose, y = mn.ln, fill = supp)) + # Creating a plot and telling R which dataset to use while specifying axis data
  geom_col(aes(fill = supp), position = "dodge", colour = "black") + # specifying the position and colour of the columns in the graph
  geom_errorbar(aes(ymin = mn.ln - sd.ln, ymax = mn.ln + sd.ln), position = "dodge") + # Creating the error bar and specifying position
  labs(x = "Dose (mg/d)", y = "Tooth length (mm)") + # Adding axis labels
  ggtitle("Dosage of supplements in relation to tooth growth") # Adding title








