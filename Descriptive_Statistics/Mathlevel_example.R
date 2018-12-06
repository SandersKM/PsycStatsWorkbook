library(dplyr)
library(Ecdat)
library(flextable)
library(ggplot2)

# First, we will save the data as a variable in RStudio
data("Mathlevel")


# Let's make a boxplot with the data
sat_box <- boxplot(Mathlevel$sat, ylab = "SAT Score", main = "Student SAT Scores")

# Look at the Help box, and scroll down to the Value section.
?boxplot
# We can also get a list of all of the outlier values
sat_box$out