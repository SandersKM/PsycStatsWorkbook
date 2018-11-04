#install.packages("dplyr")
#install.packages("Ecdat")
#install.packages("psych")
#install.packages("ggplot2")

library(dplyr)
library(Ecdat)
library(flextable)
library(ggplot2)


#################################
# Exploring the Mathlevel dataset
#################################

# First, we will save the data as a variable in RStudio
data("Mathlevel")

# Let's learn what kind of data this is
?Mathlevel

# Let's find the mean SAT score:
mean(Mathlevel$sat, na.rm = TRUE)

# Let's find the median SAT score:
median(Mathlevel$sat, na.rm = TRUE)

# Finding the mode is a bit harder. 
# Sadly mode(x) doesn't work. 
# Let's create our own function.
# First, we can find all of the unique values
uni <- unique(Mathlevel$sat)

# This next function finds the how many times each value shows up and picks the largest
uni[which.max(tabulate(match(Mathlevel$sat, uni)))]

# Rather than calling these two complicated functions every time we want to find a mean, 
# let's make a function. Note that the variable Mathlevel$sat is replaced with x
Mode <- function(x) {
  uni <- unique(x)
  uni[which.max(tabulate(match(x, uni)))]
}

# Let's find the mode SAT score using our new function!
Mode(Mathlevel$sat)

# Looking at the measures of central tendency, how do you think the data will be skewed?

# Now that we have the measures of central tendency, let's view the density plot. 
plot(density(Mathlevel$sat), main = "Density of SAT scores")

?density

