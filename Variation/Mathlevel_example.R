library(dplyr)
library(Ecdat)
library(flextable)
library(ggplot2)
library(scales)

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

# Make
means_language = Mathlevel %>% group_by(language) %>% summarize_at(vars(sat), funs(mean, sd))

ggplot(means_language) +
  geom_bar( aes(x=language, y=mean), stat="identity", fill="skyblue", alpha=0.7) + ylab("Mean SAT core") +
  geom_errorbar( aes(x=language, ymin=mean-sd, ymax=mean+sd), width=0.4, colour="orange", alpha=0.9, size=1.3)


