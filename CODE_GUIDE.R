# "CHEATSHEET"
# Listing all the functions used thus far
# Lanah Murray
# 24 February 2020

# EXPLORING DATAFRAME(df)

head(df) # Viewing the first 6 rows
head(df, n = 3) # Specifying that we only want to look at the first 3 rows
tail(df) # Viewing the last 6 rows
tail(df, n = 2) # Specifying that we only want to look at the last 2 rows
glimpse(df) # Checking the structure of the dataframe by viewing the variables by name
names(df) # Showing the names of the variables (columns) in the dataframe

# SUBSETTING THE df
# column name = col_name

select(col_name, col_name) # Selecting only specific columns if we want to refer to a specific variable
slice(row_numbers) # If we want to only select values from a specific columns
filter(col_name == "specific observation") # We want to select only the rows of data belonging to the "specific observation" in the specified col_name
nrow() # Counting the number of rows 

summary(df) # Tabulating variables by name and provides summary statistics for each variable

# SUMMARY STATISTICS by variable (col_name/cn)

summarise(mean_cn = round(mean(col_name, na.rm = TRUE), 2), # Calculating the mean, removing NA values and having it be rounded off to 2 decimal places
          med_cn = median(col_name, na.rm = TRUE), # Calculating the median and removing NA values 
          sd_cn = round(sd(col_name, na.rm = TRUE), 2), # Calculating the standard deviation , removinf NA values and rounding it off to 2 decimal places
          sum_cn = sum(col_name), # Calculating the sum of the specified column
          min_cn = min(col_name), # Obtaining the minimum value
          qrt1_cn = quantile(col_name, p = 0.25), # Finding the 1st quartile and find points below which 25% of the data are distributed
          qrt3_cn = median(col_name, p = 0.75), # Finding the 3rd quartile and find points below which 75% of the data are distributed
          max_cn = max(col_name), # Obtaining thr maximum value
          range_cn = range((col_name)[2] - range(col_name)[1]), # Finding the range where the difference between max and min is clear
          n_cn = n()) # Counting the number of rows

# TIDY DATA

gather(col_name, col_name, col_name, key = "1", value = "2") 
# Gathering the columns that we want in one column 
# specify the name (1) of the key column that will contain all the old column names
# Specifying the name (2) of the value column that will contain all the values we are gathering up

spread(key = 1, value = 2)
# Spreading observations that are spread across  multiple rows 
# Specifying the key column that has the multiple variables (1)
# Specifying the name of the column that has the values that need to be spread (2)

separating(col = col_name, into = c("1", "2"), sep = "?")
# Separating 2 variables when they have been combined in 1 column 
# Specify which column must be separated (col_name)
# Specify what the names of the new columns will be (1) and (2)
# Specify what the variables are being seperated by (?) in the original column

mutate(day = lubridate::day(date),
       month = lubridate::month(date),
       year = lubridate::year(date)) 
# Using the lubridate function to separate the dates in a column

unite(col_name, col_name, col_name, col = "1", sep = "?")
# Use the unite function to shows data such as date in one column
# Specify which columns must be united (col_name)
# Specify what we want the name of the new column to be (1)
# Specify what we want them to be separated by (?)

left_join(df, df, by = c("col_name", "col_name", "col_name"))
# Using left_join to join 2 dataframes and instructing how it must be matched up from left to right so that they can complete one another
# Specify which dataframes must be joined (df)
# The by argument specifies how to join df's when it is fed the column names (col_name)

# TIDIER DATA

# <EXAMPLE> 
filter(site == "Pollock Beach", month(date) == 12 | month(date) == 1)
# This code tells us that we want to find all the temperatures recorded at pollock beach during december OR(|) january

arrange(col_name, col_name)
# Arranging observations(rows) in a df based on the variables(columns) it is given (col_name)

arrange(desc(col_name))
# Arranging observations(rows) in descending order based on the variable(column) it is given (col_name)

# <EXAMPLE> 
filter(site == "Humewood", year(date) == 1990)
# Selecting all monthly temperatures recorded at the site humewood during the year 1990
# Removing observations(rows) we do not want

select(col_name, col_name, col_name) # selecting individual variables(columns) by name
select(col_name:col_name) # Select all columns between the mentioned columns (col_name)
select(-col_name, -col_name) # Select all columns except those stated individually
select(-(col_name:col_name)) # select all columns except those within the given sequence
select(col_name, col_name, everything()) # Using the everything function to grab all columns not already specified

mutate(new_col_name = (col_name))
# Using the mutate function to create new variables (columns)
# Specifying the name of the new column to be created (new_col_name)
# Specifying what column data will go into the new column (col_name)

# TIDIEST DATA

group_by(col_name)
# Use group_by in conjunction with the summarise function
# Assign a name to the above as a new object and then use that dataset when executing the summarise function

# <EXAMPLE> 
  SACTN_depth <- SACTN %>% # Creating the new object
  group_by(depth)


SACTN_depth_mean <- SACTN_depth %>%  # Using the new object
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            count = n())


# Grouping multiple variables based on the given column names
group_by(col_name, col_name) 

# Ungrouping to avoid confusion about which dataframes are grouped or not
ungroup() 

# ADDITIONAL USEFUL FUNCTIONS

rename(new_name = existing_col_name) # To rename variables (columns)
transmute(new_col_name = col_name) # Creating a new dataframe for a newly created variable (column) if we don't want to keep the dataframe from which the new column was created




























