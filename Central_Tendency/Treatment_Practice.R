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

# Let's learn what kind of data this is
?Treatment

# What is the average age of participants
mean(Treatment$age)
# What is the average real anual earnings in 1974?
mean(Treatment$re74)
# What is the average real anual earnings in 1975?
mean(Treatment$re75)
# What is the average real anual earnings in 1978?
mean(Treatment$re78)

# What is the median age of participants
median(Treatment$age)
# What is the median real anual earnings in 1974?
median(Treatment$re74)
# What is the median real anual earnings in 1975?
median(Treatment$re75)
# What is the median real anual earnings in 1978?
median(Treatment$re78)

Mode <- function(x) {
  uni <- unique(x)
  uni[which.max(tabulate(match(x, uni)))]
}


# What is the mode age of participants
Mode(Treatment$age)

# What is the mode real anual earnings in 1974?
Mode(Treatment$re74)

# What is the mode real anual earnings in 1975?
Mode(Treatment$re75)

# What is the mode real anual earnings in 1978?
Mode(Treatment$re78)


# What is the skew age of participants

# What is the skew real anual earnings in 1974?

# What is the skew real anual earnings in 1975?

# What is the skew real anual earnings in 1978?



# Plot the distribution of the age of participants

# Plot the distribution of the real anual earnings in 1974?

# Plot the distribution of the real anual earnings in 1975?

# Plot the distribution of the real anual earnings in 1978?


