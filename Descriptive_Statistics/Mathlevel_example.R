library(dplyr)
library(Ecdat)
library(flextable)
library(ggplot2)

# First, we will save the data as a variable in RStudio
data("Mathlevel")


# Let's make a boxplot with the data
boxplot(Mathlevel$sat, ylab = "SAT Score", main = "Student SAT Scores")
sat_box <- boxplot(Mathlevel$sat, ylab = "SAT Score", main = "Student SAT Scores")

# Look at the Help box, and scroll down to the Value section.
?boxplot
# We can also get a list of all of the outlier values
sat_box$out

# We can also create side-by side boxplots to show group differences.
boxplot(Mathlevel$sat[which(Mathlevel$language == "yes")], Mathlevel$sat[which(Mathlevel$language == "no")],
        names = c("Language","No Language"), ylab = "SAT Score", main = "Student SAT Scores")


cohen.d(Mathlevel$sat[which(Mathlevel$language == "yes")], Mathlevel$sat[which(Mathlevel$language == "no")])
# Cohen's d
#
# d estimate: 0.2337049 (small)
# 95 percent confidence interval:
#       lower       upper 
# -0.01614697  0.48355676 