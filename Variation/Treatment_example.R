library(dplyr)
library(Ecdat)
library(flextable)
library(ggplot2)

#####################################
# Practice Problems (with solutions)
#####################################

#
# Question 1

# First, we will save the data as a variable in RStudio
data("Treatment")

# What is the the minimum and maximum age of participants? What is the difference?
age_range <- range(Treatment$age)
diff(age_range)

# What is the IQR of the age of participants?
IQR(Treatment$age)

# What is the variance of age?
var(Treatment$age)

# What is the standard deviation?
sd(Treatment$age)

# Question 2

# What is the the minimum and maximum age of participants? What is the difference?
educ_range <- range(Treatment$educ)
diff(educ_range)

# What is the IQR of the age of participants?
IQR(Treatment$educ)

# What is the variance of age?
var(Treatment$educ)

# What is the standard deviation?
sd(Treatment$educ)

# Question 3

# What is the the minimum and maximum age of participants? What is the difference?
re75_range <- range(Treatment$re74)
diff(educ_range)

# What is the IQR of the age of participants?
IQR(Treatment$re74)

# What is the variance of age?
var(Treatment$re74)

# What is the standard deviation?
sd(Treatment$re74)

# Question 4

# What is the the minimum and maximum age of participants? What is the difference?
re75_range <- range(Treatment$re75)
diff(educ_range)

# What is the IQR of the age of participants?
IQR(Treatment$re75)

# What is the variance of age?
var(Treatment$re75)

# What is the standard deviation?
sd(Treatment$re75)


# Question 5

# What is the the minimum and maximum age of participants? What is the difference?
re78_range <- range(Treatment$re78)
diff(educ_range)

# What is the IQR of the age of participants?
IQR(Treatment$re78)

# What is the variance of age?
var(Treatment$re78)

# What is the standard deviation?
sd(Treatment$re78)


