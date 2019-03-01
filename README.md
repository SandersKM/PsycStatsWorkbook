# Psychology R Statistics Workbook 
#### Problems and Solutions in R by Kate Sanders

## Table of Contents
1. [Introduction](#introduction)
2. [Frequency Distributions](#frequency-distributions)
3. [Central Tendency](#central-tendency)
4. [Variability](#variability)
5. [Solutions](#solutions)

## Introduction 

#### I got an error message. How do I fix it?

##### No Package
If your error message reads 
>Error in library(<span style="color:red">**package**</span>) : there is no package called ‘<span style="color:red">**package**</span>’
then you will want to install the <span style="color:red">**package**</span> causing the problem by typing the following into the R Studio Console:
```r
install.packages(package)
```

## Frequency Distributions

#### Tutorial for Frequency Distributions
Load the following libraries in R Studio. 
```r
library(dplyr)
library(Ecdat)
library(flextable)
library(ggplot2)
```
Refer [here](#no-package) if you get an error when running these lines. 

Throughout this example, we will explore the *Mathlevel* data set. First, we will load the data set into R:
```r
data("Mathlevel")
```
Now, we will pull up more information about the data set:
```r
?Mathlevel
```
Answer the following questions:
1. Where and when were these data recorded?
2. List the variables for student majors and what they stand for.
3. What does the variable "sat" mean? Is it continuous, discrete, categorical, or ordinal?
4. What does the variable "mathlevel" mean? Is it continuous, discrete, categorical, or ordinal?

We can actually see the levels of "mathlevel" in the console:
```r
levels(Mathlevel$mathlevel)
## [1] "170"  "171a" "172a" "171b" "172b" "221a" "221b"
```
Now, let's see how many rows are in *Mathlevel*
```r
nrow(Mathlevel)
## [1] 609
```
Now we are ready to make a frequency table using the variable "mathlevel". This step saves the table as a variable called "mathlevel_frequency"
```r
mathlevel_frequency <- Mathlevel %>% count(mathlevel) 
```
Now choose a method for displaying your table. The first will display the table in the console.
```r
mathlevel_frequency # View the table in the console. "n" is the number of observations
### A tibble: 7 x 2
##  mathlevel     n
##  <ord>     <int>
## 1 170         164
## 2 171a         49
## 3 172a         11
## 4 171b        228
## 5 172b         42
## 6 221a         31
## 7 221b         84
```
The "ord" below "mathlevel" shows that this variable is ordinal. The "int" below "n" shows that this variable is an integer. Note that "n" represents the frequency. 

You can also view this frequency table in a table in a separate window. 
```r
View(mathlevel_frequency) # View the table in a data window
```
There is also an option to display the the table as a nice image in Viewer using the code below.
```r
flextable(mathlevel_frequency) # A pretty table that can be exported as a picture
```
To export the flextable shown in Viewer, click "Export", then "Save as Image..."
(Insert photo!)

Now that we have displayed the frequency table, what is the highest frequency recorded? 

We can also view this data as a barplot.
\\ Insert a sidebar or something so people can learn more about unapparent code. 
```r
ggplot(data = Mathlevel, mapping = aes(x = mathlevel)) + geom_bar() 
```
Now, we will try the same method of making a frequence table for the variable "sat".
```r
sat_frequency <- Mathlevel %>% count(sat)
sat_frequency 
```
Oh no! So many rows! We will need to create a grouped frequency table.

```r
# First, find the maximum and minimum SAT score
min_sat <- min(Mathlevel$sat)
max_sat <- max(Mathlevel$sat)

# Now, lets create variable for the class interval size. We will assign it the value 50
class_interval_size <- 50

# Using this information we can set "breaks" for the intervals
# then cut our continuous data into "class_intervals".
breaks <- seq(min_sat, max_sat + class_interval_size, by = class_interval_size)
sat_frequency <- Mathlevel %>% group_by(sat = cut(Mathlevel$sat, breaks,right = FALSE)) %>% count()
flextable(sat_frequency) # pretty table
```
\\ This is overfilling the box
Let's visualize this as a frequency polygon 
```r
ggplot(data = Mathlevel, mapping = aes(x = sat)) + geom_freqpoly(binwidth = class_interval_size)
```
***
#### Practice Problems for Frequency Distributions

__MSQ Data__ 
The libraries you will need for these questions.
```r
library(dplyr)
library(psych)
library(flextable)
library(ggplot2)
```
Load the "msq" data. Remember, if you are confused, refer to the [example](#example-for-frequency-distributions).

_Problem 1_: 

a) What does MSQ stand for?

b) Write down the scale used in this questionaire.

c) How many rows are in this dataset?

_Problem 2_: 

a) Make a frequency table using the variable "sad"

b) The numeric scale won't mean much to readers. Change the column labels for "sad" from numbers to the labels associated with those numbers using the following command
```r
sad_frequency$sad <- c("Not at all", "A little", "Moderately", "Very Much", "NA")
```

c) How many participants said that they were not at all sad?

d) How many participants didn't answer this question (NA)?

e) Create a barplot showing the reponses for "sad".

_Problem 3_:

a) Make a frequency table using the variable "happy"

b) The numeric scale won't mean much to readers. Change the labels again; see Question 5.b for help. 

c) How many participants said that they were not at all happy?

d) How many participants said that they were at least moderatly happy?

e) Create a barplot showing the reponses for "happy". 

f) Describe the distribution.

_Problem 4_:

a) Find the minimum and maximum of the variable "Neuroticism". Remember to save the values as variables in R!

b) Create variable for the Neuroticism interval size, which should equal 5.

c) Using this information, set "breaks" for the intervals and then cut the continuous data into "class_intervals". Remeber the example is there for reference!

d) View the "Neuroticism" data as a barplot.

e) View the "Neuroticism" data as a histogram. Hint: Replace "geom_freqpoly" in the previous command with "geom_histogram".

[View Solutions](#solutions-for-frequency-distributions)
## Central Tendency 

#### Tutorial for Central Tendency
Load the following libraries in R Studio. 
```r
library(dplyr)
library(Ecdat)
library(flextable)
library(ggplot2)
```
Refer [here](#no-package) if you get an error when running these lines. 

Throughout this example, we will explore the *Mathlevel* data set. First, we will load the data set into R:
```r
data("Mathlevel")
```
Now, we will pull up more information about the data set:
```r
?Mathlevel
```
First, let's get subsets of "sat" scores for students who have and have not taken a language class
```r
language_sat <- Mathlevel$sat[which(Mathlevel$language == "yes")]
no_language_sat <- Mathlevel$sat[which(Mathlevel$language == "no")]
```
Now, we can calculate the mean "sat" score for each group

```r
mean(no_language_sat)
# 623.2468
mean(language_sat)
# 637.1429
```
In order to find the combined mean, we can use a weighted mean based on each group's size and average "sat" score. 
To do that, we will create a vector with the group means and another vector with the group sizes. Then, we can call
the weighted.mean function with the two lists

```r
group_means <- c(mean(language_sat), mean(no_language_sat))
group_lengths <- c(length(language_sat), lenght(no_language_sat))
group_means <- c(mean(language_sat), mean(no_language_sat))
# 624.844
```

We can check the results for our weighted "sat" score mean.
```r
mean(Mathlevel$sat, na.rm = TRUE)
# 624.844
```

Now let's find the median "sat" score.
```r
median(Mathlevel$sat, na.rm = TRUE)
# 630
```

R does not have an inbuilt function for finding the mode. Let's create our own function to find the mode!
First, we can find all of the unique values. In the list (1,2,3,3,4,5,5,5), the unique values are (1,2,3,4,5)
```r
uni <- unique(Mathlevel$sat)
```
This next method finds the how many times each value shows up and picks the largest. Like with in math, read this function from the most nested parentheses outward. We are sending the Mathlevel$sat scores and matching them to the indexes of the unique scores we identified above. Then we are counting how many of each score there is using tabulate(). We use which.max to find the most common score index. We find the score at that index using uni[index].
```r
uni[which.max(tabulate(match(Mathlevel$sat, uni)))]
# 620
```
Rather than calling these two complicated functions every time we want to find a mode, let's make a function. Note that the variable Mathlevel$sat is replaced with x. 
```r
Mode <- function(x) {
  uni <- unique(x)
  uni[which.max(tabulate(match(x, uni)))]
}
```
Let's find the mode SAT score using our new function!
```r
Mode(Mathlevel$sat)
# 620 
```
Looking at the measures of central tendency, how do you think the data will be skewed?
Now that we have the measures of central tendency, let's view the density plot. 

\\ maybe explain density plot
```r
plot(density(Mathlevel$sat), main = "Density of SAT scores")
```

***
#### Practice Problems for Central Tendency

__Treatment Data__ 
The libraries you will need for these questions.
```r
library(dplyr)
library(psych)
library(flextable)
library(ggplot2)
```
Load the "Treatment" data. Remember, if you are confused, refer to the [example](#example-for-frequency-distributions).

_Problem 1_: 

a) What is the mean age of participants?

b) What is the median age of participants?

c) What is the mode age of participants?

d) Calculate the skew of the age of participants.

e) Plot the distribution of the age of participants.


_Problem 1_: 

a) What is the mean age of the real anual earnings of participants in 1974?

b) What is the median age of the real anual earnings of participants in 1974?

c) What is the mode age of the real anual earnings of participants in 1974?

d) Calculate the skew of the real anual earnings of participants in 1974.

e) Plot the distribution of the real anual earnings of participants in 1974.


_Problem 3_: 

a) What is the mean age of the real anual earnings of participants in 1975?

b) What is the median age of the real anual earnings of participants in 1975?

c) What is the mode age of the real anual earnings of participants in 1975?

d) Calculate the skew of the real anual earnings of participants in 1975.

e) Plot the distribution of the real anual earnings of participants in 1975.


_Problem 4_: 

a) What is the mean age of the real anual earnings of participants in 1978?

b) What is the median age of the real anual earnings of participants in 1978?

c) What is the mode age of the real anual earnings of participants in 1978?

d) Calculate the skew of the real anual earnings of participants in 1978.

e) Plot the distribution of the real anual earnings of participants in 1978.

[View Solutions](#solutions-for-central-tendency)

## Variation 

#### Tutorial for Variation

For this example, we will use the Mathlevel dataset again.
```r
library(dplyr)
library(Ecdat)
library(flextable)
library(ggplot2)
data("Mathlevel")
```
First let's get the minimum and maximum SAT scores in this dataset
```r
sat_range <- range(Mathlevel$sat)
```
Now we can find the difference between the minimum and maximum values
```r
diff(sat_range)
```
We would also like to know the IQR of this data, which can be found using a simple function
```r
IQR(Mathlevel$sat)
```
Now let's find the variation:
```r
var(Mathlevel$sat)
```
Before we call the function for variance, let's look at its documentation
```r
?sd
```
Go to the Details section. What denoninator is used in this function?
Now that we know this is the function we want, let's get the standard deveation
```r
sd(Mathlevel$sat)
```

We can also find the mean and standard deviation by group using a pipline of dplyr commands.
```r
# State dataset, group by language, and summarize the sat mean and standard deviation per group
means_language = Mathlevel %>% group_by(language) %>% summarize_at(vars(sat), funs(mean, sd))
means_language # print out result
```
We can also plot these means in a bar graph with error bars using ggplot2.
```r
# declare the grouped mean table created above, plot a bar graph, and add error bars
ggplot(means_language) +
  geom_bar( aes(x=language, y=mean), stat="identity", fill="skyblue", alpha=0.7) +
  geom_errorbar( aes(x=language, ymin=mean-sd, ymax=mean+sd), width=0.4, colour="orange", alpha=0.9, size=1.3)
```

***
#### Practice Problems for Variation

__Treatment Data__ 
The libraries you will need for these questions.
```r
library(dplyr)
library(psych)
library(flextable)
library(ggplot2)
```
Load the "Treatment" data. Each question will state the variable for analysis. Remember, if you don't remember the the name for the variable described, use the help documentation for the dataset. For each variable, find the following values:
a) Minimum and maximum value
b) Range
c) IQR
d) Variance
e) Standard Deviation

_Problem 1_: Participant age

_Problem 2_: Years of education

_Problem 3_: Real annual earnings in 1974

_Problem 4_: Real annual earnings in 1975

_Problem 5_: Real annual earnings in 1978

## Descriptive Statistics

#### Example for Descriptive Statistics
For this example, we will use the Mathlevel dataset again.
```r
library(dplyr)
library(Ecdat)
library(flextable)
library(ggplot2)
data("Mathlevel")
```

Making a boxplot is easy in R; just state the variable, y axis label, and Title (main) for the plot.
```r
sat_box <- boxplot(Mathlevel$sat, ylab = "SAT Score", main = "Student SAT Scores")
```
// Insert image
This variable contains lots of information to make the graph. Look at the boxplot documentation, particularly the "Values" section.
```r
?boxplot
```
Each of these values can be accessed directly from the variable. For intance, let's find all of the outliers:
```r
sat_box$out
#  [1] 430 460 480 400 460 440 480 440 480 780 780 790 780 780 770
```


```r

```


```r

```


## Solutions

#### Solutions for Frequency Distributions
[Go back to questions](#practice-problems-for-frequency-distributions)

_Problem 1_

a) Motivtional States Questionnaire

b) 0 = Not at all, 1= A little, 2 = Moderately, 3 = Very Much

c) 3896

_Problem 2_

a)

| sad|    n|
|---:|----:|
|   0| 2825|
|   1|  839|
|   2|  169|
|   3|   53|
|  NA|   10|

b)

c) 2825

d) 10

e)

_Problem 3_

a) 

| happy|    n|
|-----:|----:|
|     0| 1016|
|     1| 1356|
|     2| 1128|
|     3|  380|
|    NA|   16|

b) 
```r
sad_frequency$sad <- c("Not at all", "A little", "Moderately", "Very Much", "NA")
```

c) 1016

d) 1228 + 380 = 1608

e) 

_Question 4_

a)
```r
min_Neuroticism <- min(msq$Neuroticism, na.rm = TRUE)
max_Neuroticism <- max(msq$Neuroticism, na.rm = TRUE)
```

b)
```r
Neuroticism_interval_size <- 5
```

c)
```r
breaks <- seq(min_Neuroticism, max_Neuroticism + Neuroticism_interval_size, by = Neuroticism_interval_size)
Neuroticism_frequency <- msq %>% group_by(Neuroticism = cut(msq$Neuroticism, breaks,right = FALSE)) %>% count()
flextable(Neuroticism_frequency)
```

d)
```r
ggplot(data = msq, mapping = aes(x =Neuroticism )) + geom_freqpoly(binwidth = Neuroticism_interval_size, na.rm = TRUE)
```

e)
```r
ggplot(data = msq, mapping = aes(x =Neuroticism )) + geom_histogram(binwidth = Neuroticism_interval_size, na.rm = TRUE)
```


#### Solutions for Central Tendency
[Go back to questions](#practice-problems-for-central-tendency)

