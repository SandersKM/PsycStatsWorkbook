#install.packages("dplyr")
#install.packages("Ecdat")
#install.packages("psych")

library(dplyr)
library(Ecdat)
library(flextable)

#################################
# Exploring the Mathlevel dataset
#################################

# First, we will save the data as a variable in RStudio
data("Mathlevel")

# Let's learn what kind of data this is
?Mathlevel

# Where and when was this data recorded?

# List the variables for student majors and what they stand for.

# What does the variable "sat" mean? Is it continuous, categorical, or ordinal?

# What does the variable "mathlevel" mean? Is it continuous, categorical, or ordinal?

# We can also see the levels of "mathlevel" in the console
levels(Mathlevel$mathlevel)

# Now, let's view the dataset
View(Mathlevel)

# Ok, that's a lot. How much is it? Let's count the total number of rows
nrow(Mathlevel)

# Let's make a frequency table using the variable "mathlevel"
mathlevel_frequency <- Mathlevel %>% count(mathlevel)
mathlevel_frequency # View the table in the console. "n" is the number of observations
View(mathlevel_frequency) # View the table in a data window
flextable(mathlevel_frequency) # A pretty table that can be exported as a picture

# What is the hightest frequency recorded in the table? What math level is it involved with?

# Now let's try the same thing with the variable "sat"
sat_frequency <- Mathlevel %>% count(sat)
sat_frequency # View the table in the console. "n" is the number of observations

# That is too many rows! We will need to create a grouped frequency table. 
# First, find the maximum and minimum SAT score
min_sat <- min(Mathlevel$sat)
max_sat <- max(Mathlevel$sat)

# Now, lets create variable for the class interval size. We will assign it the value 50
class_interval_size <- 50

# Using this information we can set "breaks" for the intervals
# then cut our continuous data into "class_intervals".
breaks <- seq(min_sat, max_sat + class_interval_size, by = class_interval_size)
sat_frequency <- Mathlevel %>% group_by(sat = cut(Mathlevel$sat, breaks,right = FALSE)) %>% count()
flextable(sat_frequency) # pretty table

# We can also group 