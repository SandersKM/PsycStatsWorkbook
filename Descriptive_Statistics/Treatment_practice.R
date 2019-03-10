library(effsize)
data("Treatment")

# Create a boxplot of participant education. List the outliers.
boxplot(Treatment$educ, ylab="Years of Education", main="Sample Education Levels")

treatment_education_box <- boxplot(Treatment$educ, ylab="Years of Education", main="Sample Education Levels")

treatment_education_box$out

# Create a boxplot of participant age. List the minimum, maximum, and the median.
boxplot(Treatment$age, ylab="Age", main="Sample Ages")

treatment_age_box <- boxplot(Treatment$age, ylab="Age", main="Sample Ages")

treatment_age_box$stats

# Make a boxplot of earnings in 1974, 1975, 1978
boxplot(Treatment$re74, Treatment$re75, Treatment$re78, ylab="Real Anual Earnings", 
        names=c("1974", "1975", "1978"),main="Participant Earnings by Year")

# Calculate the following Effect Size indexes
cohen.d(Treatment$re74, Treatment$re75)

cohen.d(Treatment$re74, Treatment$re78)

cohen.d(Treatment$re75, Treatment$re78)

# Create a boxplot comparing 1978 participant earnings of those who are married and unmarried.

boxplot(Treatment$re78[which(Treatment$married=="TRUE")],Treatment$re78[which(Treatment$married=="FALSE")],
        names= c("Married", "Not Married"), ylab="Real Annual Earnings", 
        main="1978 Earnings of Married vs Unmarried participants")

# Calculate the Effect Size Index between 1978 participant earnings of those who are married and unmarried.

cohen.d(Treatment$re78[which(Treatment$married=="TRUE")],Treatment$re78[which(Treatment$married=="FALSE")])
