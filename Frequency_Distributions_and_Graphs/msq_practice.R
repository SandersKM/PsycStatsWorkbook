library(dplyr)
library(psych)
library(flextable)
library(ggplot2)

#####################################
# Practice Problems (with solutions)
#####################################

#
# Question 1

# First, we will save the data as a variable in RStudio
data("msq")

# Let's learn what kind of data this is
?msq

# What does MSQ stand for?
# Motivtional States Questionnaire

# Write down the scale used in this questionaire
# 0 = Not at all, 1= A little, 2 = Moderately, 3 = Very Much

# How many rows are in this dataset?
nrow(msq)
# 3896

#
# Question 2

# Make a frequency table using the variable "sad"
sad_frequency <- msq %>% count(sad)
sad_frequency # View the table in the console. "n" is the number of observations
View(sad_frequency) # View the table in a data window
flextable(sad_frequency) # A pretty table that can be exported as a picture

# The numeric scale won't mean much to readers. Change the column "sad" to a vector of strings (explain)
sad_frequency$sad <- c("Not at all", "A little", "Moderately", "Very Much", "NA")

# How many participants said that they were not at all sad?
# 2825

# How many participants didn't answer (NA)?
# 10

# Let's visualize this with a barplot:
ggplot(data = msq, mapping = aes(x = sad), na.) + geom_bar() 
# Have them figure out how to change the y-axis scale


#
# Question 3

# Make a frequency table using the variable "happy"
happy_frequency <- msq %>% count(happy)
happy_frequency # View the table in the console. "n" is the number of observations
View(happy_frequency) # View the table in a data window
flextable(happy_frequency) # A pretty table that can be exported as a picture

# The numeric scale won't mean much to readers. Change the column "sad" to a vector of strings (explain)
happy_frequency$happy <- c("Not at all", "A little", "Moderately", "Very Much", "NA")

flextable(happy_frequency) # A pretty table that can be exported as a picture

# How many participants said that they were not at all happy?
# 1016

# How many participants said that they were at least moderatly happy?
# 1228 + 380 = 1608


# Let's visualize this with a barplot:
ggplot(data = msq, mapping = aes(x = happy), na.) + geom_bar() 

# What kind of distribution is this?

#
# Question 4

# Now let's try the same thing with the variable "Neuroticism"
Neuroticism_frequency <- msq %>% count(Neuroticism)
Neuroticism_frequency # View the table in the console. "n" is the number of observations

# That is too many rows! We will need to create a grouped frequency table. 
# First, find the maximum and minimum 
min_Neuroticism <- min(msq$Neuroticism, na.rm = TRUE)
max_Neuroticism <- max(msq$Neuroticism, na.rm = TRUE)

# Now, lets create variable for the Neuroticism interval size. 
Neuroticism_interval_size <- 5

# Using this information we can set "breaks" for the intervals
# then cut our continuous data into "class_intervals".
breaks <- seq(min_Neuroticism, max_Neuroticism + Neuroticism_interval_size, by = Neuroticism_interval_size)
Neuroticism_frequency <- msq %>% group_by(Neuroticism = cut(msq$Neuroticism, breaks,right = FALSE)) %>% count()
flextable(Neuroticism_frequency) # pretty table

# Let's visualize this as a frequency polygon 
ggplot(data = msq, mapping = aes(x =Neuroticism )) + geom_freqpoly(binwidth = Neuroticism_interval_size, na.rm = TRUE)

# Let's visualize this as a histogram
ggplot(data = msq, mapping = aes(x =Neuroticism )) + geom_histogram(binwidth = Neuroticism_interval_size, na.rm = TRUE)

# What kind of distribution is this?

