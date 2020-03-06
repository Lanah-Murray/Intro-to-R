# Exercise 1 : Distributions TASK 2
# Author: Lanah Murray
# 6 March 2020

# Loading packages
library(tidyverse)
library(dplyr)
library(fitdistrplus)
library(logspline)
library(tidyr)
library(purrr)
library(ggplot)
library(grid)

## BINOMIAL DISTRIBUTION
# Determining if a newly created drug is able to cure coronavirus disease in animals. 
# Creating a vector ranging from 1 to 20 and naming it x
# Creating a dataframe and assigning a name df while specifying the column names and contents
# Column x will contain the values in vector x and column y will contain the values used for the binomial
# distribution with x being the vector, 20 being the vector of probabilities and 0.5 being the log function of the probability vector

x  <- 1:20
df <- data.frame(x = x, y = dbinom(x, 20, 0.5))

# Exploring the created dataset
# Using the head function to view the first 6 rows, tail to view the last 6 rows and
# glimpse to check the structure of the dataframe by viewing the variables by name
head(df)
tail(df)
glimpse(df)

# Assigning a name to the object to be saved into the environment and using the ggplot function
# Specifying what is going onto the axis and telling R we want to use the bar graph function
# Specifying that the aesthetic produced by the statistic must have the expression identity
# Specifying the colour for the outline of the bars and the colour of the inside of the bar
# Adding a title and labels to the axis and adjusting the themes as well

Binom_distr <- ggplot(df, aes(x = x, y = y)) +
  geom_bar(stat = "identity", col = "black", fill = "lightgreen") +
  labs(title = "Binomial Distribution") + theme_bw(16, "serif") + 
  theme(plot.title = element_text(size = rel(1.2), vjust = 1.5))


## POISSON DISTRIBUTION
# Creating a dataset/sequence of events
# Saving the dataset into the environment and determining the number of students entering the UWC nature reserve in a period when the expected number of events is lambda
# Assigning a name and gathering the distribution and density while excluding the events column
# Creating a Poisson distribution plot with the density on the y axis and filling the with the distribution
# Using the dodge position for the graphs columns and adding the various labels and title

n = 0:20 
df <- data.frame(events = 0:20,
                 Poisson = dpois(x = n, lambda = .08 * 50))

plot <- gather(df, key = "Distribution", value = "density", -c(events)) 
Poisson_distr <- ggplot(plot, aes(x = factor(events), y = density, fill = Distribution)) +
  geom_col(position = "dodge") +
  labs(title = "Poisson",
       x = "Events",
       y = "Count")

# The plot above shows that the most students enter the nature reserve at events 3 and 4. The probability of the most students entering at that time is approximately 0.18
# This distribution is helpful because we are observing the number of times students enter the reserve in a fixed location.


## NORMAL DISTRIBUTION
# The lengths of mole snakes found in the UWC Cape Flats Nature Reserve
# Setting the seed to lock in the sequence of data
# Create a sequence of values from -4 to 4, and 
# generate 100 random draws from the standard normal distribution.
# Plotting the normal distribution curve

set.seed(100)
xseq<-seq(-4,4,.01)
densities<-dnorm(xseq, 0,1)
randomdeviates<-rnorm(100,0,1)

par(mfrow=c(1,3), mar=c(3,4,4,2))

plot(xseq, densities, col="darkgreen",xlab="", ylab="Density", type="l",lwd=2, cex=2, main="PDF of Standard Normal", cex.axis=.8)



## CHI-SQUARED DISTRIBUTION
# Creating a density plot for a chi-square distribution
# Degrees of freedom is 5 where the x-axis of the plot ranges from 0 to 30
# Changing the density plot by adding a title, changing the y-axis label
# increasing the line width, and changing the line color

curve(dchisq(x, df = 5), from = 0, to = 30)

curve(dchisq(x, df = 5), from = 0, to = 30,
      main = 'Chi-Square Distribution', # add title
      ylab = 'Density', # Specifying the y-axis label
      lwd = 1, # Changing line width to 1
      col = 'red') # change line color to red


# I STRUGGLED ALOT! SORRY FOR THIS BAD QUALITY SUBMISSION, I JUST COULDN'T WRAP MY BRAIN AROUND EVERYTHING
# LOTS OF HELP NEEDED TO UNDERSTAND THE REASONING BEHIND EVERYTHING 

