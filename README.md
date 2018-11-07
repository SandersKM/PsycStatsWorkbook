# Psychology R Statistics Workbook 
#### Problems and Solutions in R by Kate Sanders

## Table of Contents
1. [Introduction](#introduction)
2. [Frequency Distributions](#frequency-distributions)
3. [Central Tendency](#central-tendency)
4. Variability
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

#### Example for Frequency Distributions
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
1. Where and when was this data recorded?
2. List the variables for student majors and what they stand for.
3. What does the variable "sat" mean? Is it continuous, categorical, or ordinal?
4. What does the variable "mathlevel" mean? Is it continuous, categorical, or ordinal?

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
Now we are ready to make a frequency table using the variable "mathlevel". First we will make a table and view it in the console.
```r
mathlevel_frequency <- Mathlevel %>% count(mathlevel)
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
The <ord> below "mathlevel" shows that this variable is ordinal. The <int> below "n" shows that this variable is an integer. Note that "n" represents the frequency. What is the highest frequency recorded in the table? 

You can also view this frequency table in a table in a separate window or as a image in Viewer using the code below.
```r
View(mathlevel_frequency) # View the table in a data window
flextable(mathlevel_frequency) # A pretty table that can be exported as a picture
```
To export the flextable shown in Viewer, click "Export", then "Save as Image..."
(Insert photo!)

We can also view this data as a barplot.
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
Let's visualize this as a frequency polygon 
```r
ggplot(data = Mathlevel, mapping = aes(x = sat)) + geom_freqpoly(binwidth = class_interval_size)
```

#### Questions for Frequency Distributions

__MSQ Data__ 
The libraries you will need for these questions.
```r
library(dplyr)
library(psych)
library(flextable)
library(ggplot2)
```
Load the "msq" data. Remember, if you are confused, refer to the [example](#example-for-frequence-distributions).

_Question 1_: 
_a)_ What does MSQ stand for?
_b)_ Write down the scale used in this questionaire.
_c)_ How many rows are in this dataset?

_Question 2_: 
_a)_ Make a frequency table using the variable "sad"
_b)_ The numeric scale won't mean much to readers. Change the column "sad" to a vector of strings using the following command
```r
sad_frequency$sad <- c("Not at all", "A little", "Moderately", "Very Much", "NA")
```
_c)_ How many participants said that they were not at all sad?
_d)_ How many participants didn't answer this question (NA)?
_e)_ Create a barplot showing the reponses for "sad". Can you figure out how to change the y-axis label?

_Question 3_:
_a)_ Make a frequency table using the variable "happy"
_b)_ The numeric scale won't mean much to readers. Change the labels; see Question 5.b for help. 
_c)_ How many participants said that they were not at all happy?
_d)_ How many participants didn't answer this question (NA)?
_e)_ Create a barplot showing the reponses for "happy". Can you figure out how to change the y-axis label?
_f)_ What kind of distribution is this?

_Question 4_:
_a)_ Find the minimum and maximum of the variable "Neuroticism". Remember to save the values as variables in R!
_b)_ Create variable for the Neuroticism interval size, which should equal 5.
_c)_ Using this information, set "breaks" for the intervals and then cut the continuous data into "class_intervals". Remeber the example is there for reference!
_d)_ View the "Neuroticism" data as a barplot.
_e)_ View the "Neuroticism" data as a histogram. Hint: Replace "geom_freqpoly" in the previous command with "geom_histogram".

[View Solutions](#solutions-for-frequency-distributions)
## Central Tendency 


## Solutions

#### Solutions for Frequency Distributions
[Go back to questions](#questions-for-frequency-distributions)
