library(dplyr)
library(Ecdat)
library(flextable)
library(ggplot2)

#####################################
# Practice Problems (with solutions)
#####################################

# First, we will save the data as a variable in RStudio
data("incomeInequality")

# Let's learn what kind of data this is
?incomeInequality

#
# Question 1

# How is the variable "realGDPperFamily" computed?
# personsPerFamily * realGDPperCap

# Use a line plot to show realGDPperFamily by year
ggplot(data = incomeInequality, mapping = aes(x = Year, y=realGDPperFamily )) + geom_line()


#
# Question 2

# What is the variable "mean.median" a measure of?
# it is a measure of skewness and income inequality

# Use a line plot to show mean.median by year
ggplot(data = incomeInequality, mapping = aes(x = Year, y=mean.median )) + geom_line()


