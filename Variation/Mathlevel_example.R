library(dplyr)
library(Ecdat)
library(flextable)
library(ggplot2)

# First, we will save the data as a variable in RStudio
data("Mathlevel")

# First, let's get the minimum and maximum values
sat_range <- range(Mathlevel$sat)

# Now, we will find the difference between the minimum and maximum values
diff(sat_range)

# The IQR is just 
IQR(Mathlevel$sat)


# Let's find the variance
var(Mathlevel$sat)


?sd
# Let's find the standard deviations
sd(Mathlevel$sat)




